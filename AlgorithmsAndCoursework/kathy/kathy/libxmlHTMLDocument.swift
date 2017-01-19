//
//  libxmlHTMLDocument.swift
//  kathy
//
//  Created by Nathan Liu on 14/01/2016.
//  Copyright © 2016 Liu Empire. All rights reserved.
//

import Foundation
import libxml2

/*
libxmlHTMLDocument
*/
internal final class libxmlHTMLDocument: HTMLDocument {
    private var docPtr:   htmlDocPtr = nil
    private var rootNode: XMLElement?
    private var html: String
    private var url:  String?
    private var encoding: UInt
    
    var text: String? {
        return rootNode?.text
    }
    
    var toHTML: String? {
        return html
    }
    
    var innerHTML: String? {
        return rootNode?.innerHTML
    }
    
    var className: String? {
        return nil
    }
    
    var tagName:   String? {
        return nil
    }
    
    init?(html: String, url: String?, encoding: UInt, option: UInt) {
        self.html = html
        self.url  = url
        self.encoding = encoding
        
        if html.lengthOfBytesUsingEncoding(encoding) <= 0 {
            return nil
        }
        let cfenc : CFStringEncoding = CFStringConvertNSStringEncodingToEncoding(encoding)
        let cfencstr = CFStringConvertEncodingToIANACharSetName(cfenc)
        
        if let cur = html.cStringUsingEncoding(encoding) {
            let url : String = ""
            docPtr = htmlReadDoc(UnsafePointer<xmlChar>(cur), url, String(cfencstr), CInt(option))
            rootNode  = libxmlHTMLNode(docPtr: docPtr)
        } else {
            return nil
        }
    }
    
    deinit {
        xmlFreeDoc(self.docPtr)
    }
    
    var title: String? { return at_xpath("//title")?.text }
    var head: XMLElement? { return at_xpath("//head") }
    var body: XMLElement? { return at_xpath("//body") }
    
    func xpath(xpath: String, namespaces: [String:String]?) -> XMLNodeSet {
        return rootNode?.xpath(xpath, namespaces: namespaces) ?? XMLNodeSet()
    }
    
    func xpath(xpath: String) -> XMLNodeSet {
        return self.xpath(xpath, namespaces: nil)
    }
    
    func at_xpath(xpath: String, namespaces: [String:String]?) -> XMLElement? {
        return rootNode?.at_xpath(xpath, namespaces: namespaces)
    }
    
    func at_xpath(xpath: String) -> XMLElement? {
        return self.at_xpath(xpath, namespaces: nil)
    }
    
    func css(selector: String, namespaces: [String:String]?) -> XMLNodeSet {
        return rootNode?.css(selector, namespaces: namespaces) ?? XMLNodeSet()
    }
    
    func css(selector: String) -> XMLNodeSet {
        return self.css(selector, namespaces: nil)
    }
    
    func at_css(selector: String, namespaces: [String:String]?) -> XMLElement? {
        return rootNode?.at_css(selector, namespaces: namespaces)
    }
    
    func at_css(selector: String) -> XMLElement? {
        return self.at_css(selector, namespaces: nil)
    }
}

/*
libxmlXMLDocument
*/
internal final class libxmlXMLDocument: XMLDocument {
    private var docPtr:   xmlDocPtr = nil
    private var rootNode: XMLElement?
    private var xml: String
    private var url: String?
    private var encoding: UInt
    
    var text: String? {
        return rootNode?.text
    }
    
    var toHTML: String? {
        return xml
    }
    
    var innerHTML: String? {
        return rootNode?.innerHTML
    }
    
    var className: String? {
        return nil
    }
    
    var tagName:   String? {
        return nil
    }
    
    init?(xml: String, url: String?, encoding: UInt, option: UInt) {
        self.xml  = xml
        self.url  = url
        self.encoding = encoding
        
        if xml.lengthOfBytesUsingEncoding(encoding) <= 0 {
            return nil
        }
        let cfenc : CFStringEncoding = CFStringConvertNSStringEncodingToEncoding(encoding)
        let cfencstr = CFStringConvertEncodingToIANACharSetName(cfenc)
        
        if let cur = xml.cStringUsingEncoding(encoding) {
            let url : String = ""
            docPtr = xmlReadDoc(UnsafePointer<xmlChar>(cur), url, String(cfencstr), CInt(option))
            rootNode  = libxmlHTMLNode(docPtr: docPtr)
        } else {
            return nil
        }
    }
    
    func xpath(xpath: String, namespaces: [String:String]?) -> XMLNodeSet {
        return rootNode?.xpath(xpath, namespaces: namespaces) ?? XMLNodeSet()
    }
    
    func xpath(xpath: String) -> XMLNodeSet {
        return self.xpath(xpath, namespaces: nil)
    }
    
    func at_xpath(xpath: String, namespaces: [String:String]?) -> XMLElement? {
        return rootNode?.at_xpath(xpath, namespaces: namespaces)
    }
    
    func at_xpath(xpath: String) -> XMLElement? {
        return self.at_xpath(xpath, namespaces: nil)
    }
    
    func css(selector: String, namespaces: [String:String]?) -> XMLNodeSet {
        return rootNode?.css(selector, namespaces: namespaces) ?? XMLNodeSet()
    }
    
    func css(selector: String) -> XMLNodeSet {
        return self.css(selector, namespaces: nil)
    }
    
    func at_css(selector: String, namespaces: [String:String]?) -> XMLElement? {
        return rootNode?.at_css(selector, namespaces: namespaces)
    }
    
    func at_css(selector: String) -> XMLElement? {
        return self.at_css(selector, namespaces: nil)
    }
}