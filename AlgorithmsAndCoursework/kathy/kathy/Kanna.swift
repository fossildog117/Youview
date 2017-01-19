//
//  Kanna.swift
//  kathy
//
//  Created by Nathan Liu on 14/01/2016.
//  Copyright © 2016 Liu Empire. All rights reserved.
//


import Foundation

/*
ParseOption
*/
public enum ParseOption {
    // libxml2
    case XmlParseUseLibxml(Libxml2XMLParserOptions)
    case HtmlParseUseLibxml(Libxml2HTMLParserOptions)
}

private let kDefaultXmlParseOption   = ParseOption.XmlParseUseLibxml([.RECOVER, .NOERROR, .NOWARNING])
private let kDefaultHtmlParseOption  = ParseOption.HtmlParseUseLibxml([.RECOVER, .NOERROR, .NOWARNING])

/**
 Parse XML
 @param xml      an XML string
 @param url      the base URL to use for the document
 @param encoding the document encoding
 @param options  a ParserOption
 */
public func XML(xml xml: String, url: String?, encoding: UInt, option: ParseOption = kDefaultXmlParseOption) -> XMLDocument? {
    switch option {
    case .XmlParseUseLibxml(let opt):
        return libxmlXMLDocument(xml: xml, url: url, encoding: encoding, option: opt.rawValue)
    default:
        return nil
    }
}

public func XML(xml xml: String, encoding: UInt, option: ParseOption = kDefaultXmlParseOption) -> XMLDocument? {
    return XML(xml: xml, url: nil, encoding: encoding, option: option)
}

// NSData
public func XML(xml xml: NSData, url: String?, encoding: UInt, option: ParseOption = kDefaultXmlParseOption) -> XMLDocument? {
    if let xmlStr = NSString(data: xml, encoding: encoding) as? String {
        return XML(xml: xmlStr, url: url, encoding: encoding, option: option)
    }
    return nil
}

public func XML(xml xml: NSData, encoding: UInt, option: ParseOption = kDefaultXmlParseOption) -> XMLDocument? {
    return XML(xml: xml, url: nil, encoding: encoding, option: option)
}

// NSURL
public func XML(url url: NSURL, encoding: UInt, option: ParseOption = kDefaultXmlParseOption) -> XMLDocument? {
    if let data = NSData(contentsOfURL: url) {
        return XML(xml: data, url: url.absoluteString, encoding: encoding, option: option)
    }
    return nil
}

/**
 Parse HTML
 @param html     an HTML string
 @param url      the base URL to use for the document
 @param encoding the document encoding
 @param options  a ParserOption
 */
public func HTML(html html: String, url: String?, encoding: UInt, option: ParseOption = kDefaultHtmlParseOption) -> HTMLDocument? {
    switch option {
    case .HtmlParseUseLibxml(let opt):
        return libxmlHTMLDocument(html: html, url: url, encoding: encoding, option: opt.rawValue)
    default:
        return nil
    }
}

public func HTML(html html: String, encoding: UInt, option: ParseOption = kDefaultHtmlParseOption) -> HTMLDocument? {
    return HTML(html: html, url: nil, encoding: encoding, option: option)
}

// NSData
public func HTML(html html: NSData, url: String?, encoding: UInt, option: ParseOption = kDefaultHtmlParseOption) -> HTMLDocument? {
    if let htmlStr = NSString(data: html, encoding: encoding) as? String {
        return HTML(html: htmlStr, url: url, encoding: encoding, option: option)
    }
    return nil
}

public func HTML(html html: NSData, encoding: UInt, option: ParseOption = kDefaultHtmlParseOption) -> HTMLDocument? {
    return HTML(html: html, url: nil, encoding: encoding, option: option)
}

// NSURL
public func HTML(url url: NSURL, encoding: UInt, option: ParseOption = kDefaultHtmlParseOption) -> HTMLDocument? {
    if let data = NSData(contentsOfURL: url) {
        return HTML(html: data, url: url.absoluteString, encoding: encoding, option: option)
    }
    return nil
}

/**
 Searchable
 */
public protocol Searchable {
    /**
     Search for node from current node by XPath.
     
     @param xpath
     */
    func xpath(xpath: String, namespaces: [String:String]?) -> XMLNodeSet
    func xpath(xpath: String) -> XMLNodeSet
    func at_xpath(xpath: String, namespaces: [String:String]?) -> XMLElement?
    func at_xpath(xpath: String) -> XMLElement?
    
    /**
     Search for node from current node by CSS selector.
     
     @param selector a CSS selector
     */
    func css(selector: String, namespaces: [String:String]?) -> XMLNodeSet
    func css(selector: String) -> XMLNodeSet
    func at_css(selector: String, namespaces: [String:String]?) -> XMLElement?
    func at_css(selector: String) -> XMLElement?
}

/**
 SearchableNode
 */
public protocol SearchableNode: Searchable {
    var text: String? { get }
    var toHTML:      String? { get }
    var innerHTML: String? { get }
    var className: String? { get }
    var tagName:   String? { get }
}

/**
 XMLElement
 */
public protocol XMLElement: SearchableNode {
    subscript(attr: String) -> String? { get }
}

/**
 XMLDocument
 */
public protocol XMLDocument: SearchableNode {
}

/**
 HTMLDocument
 */
public protocol HTMLDocument: XMLDocument {
    var title: String? { get }
    var head: XMLElement? { get }
    var body: XMLElement? { get }
}

/**
 XMLNodeSet
 */
public final class XMLNodeSet {
    private var nodes: [XMLElement] = []
    
    public var toHTML: String? {
        let html = nodes.reduce("") {
            if let text = $1.toHTML {
                return $0 + text
            }
            return $0
        }
        return html.isEmpty == false ? html : nil
    }
    
    public var innerHTML: String? {
        let html = nodes.reduce("") {
            if let text = $1.innerHTML {
                return $0 + text
            }
            return $0
        }
        return html.isEmpty == false ? html : nil
    }
    
    public var text: String? {
        let html = nodes.reduce("") {
            if let text = $1.text {
                return $0 + text
            }
            return $0
        }
        return html
    }
    
    public subscript(index: Int) -> XMLElement {
        return nodes[index]
    }
    
    public var count: Int {
        return nodes.count
    }
    
    internal init() {
    }
    
    internal init(nodes: [XMLElement]) {
        self.nodes = nodes
    }
    
    public func at(index: Int) -> XMLElement? {
        return count > index ? nodes[index] : nil
    }
    
    public var first: XMLElement? {
        return at(0)
    }
    
    public var last: XMLElement? {
        return at(count-1)
    }
}

extension XMLNodeSet: SequenceType {
    public typealias Generator = AnyGenerator<XMLElement>
    public func generate() -> Generator {
        var index = 0
        return anyGenerator {
            if index < self.nodes.count {
                return self.nodes[index++]
            }
            return nil
        }
    }
}