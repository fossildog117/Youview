//
//  libxmlHTMLNode.swift
//  kathy
//
//  Created by Nathan Liu on 14/01/2016.
//  Copyright © 2016 Liu Empire. All rights reserved.
//

import libxml2

/**
 libxmlHTMLNode
 */
internal final class libxmlHTMLNode: XMLElement {
    var text: String? {
        if nodePtr != nil {
            return libxmlGetNodeContent(nodePtr)
        }
        return nil
    }
    
    var toHTML: String? {
        let buf = xmlBufferCreate()
        htmlNodeDump(buf, docPtr, nodePtr)
        let html = String.fromCString(UnsafePointer(buf.memory.content))
        xmlBufferFree(buf)
        return html
    }
    
    var innerHTML: String? {
        if let html = self.toHTML {
            let inner = html.stringByReplacingOccurrencesOfString("</[^>]*>$", withString: "", options: .RegularExpressionSearch, range: nil)
                .stringByReplacingOccurrencesOfString("^<[^>]*>", withString: "", options: .RegularExpressionSearch, range: nil)
            return inner
        }
        return nil
    }
    
    var className: String? {
        return self["class"]
    }
    
    var tagName:   String? {
        if nodePtr != nil {
            return String.fromCString(UnsafePointer(nodePtr.memory.name))
        }
        return nil
    }
    
    private var docPtr:  htmlDocPtr = nil
    private var nodePtr: xmlNodePtr = nil
    private var isRoot:  Bool       = false
    
    
    subscript(attributeName: String) -> String? {
        for var attr = nodePtr.memory.properties; attr != nil; attr = attr.memory.next {
            let mem = attr.memory
            if let tagName = String.fromCString(UnsafePointer(mem.name)) {
                if attributeName == tagName {
                    return libxmlGetNodeContent(mem.children)
                }
            }
        }
        return nil
    }
    
    init(docPtr: xmlDocPtr) {
        self.docPtr  = docPtr
        self.nodePtr = xmlDocGetRootElement(docPtr)
        self.isRoot  = true
    }
    
    init(docPtr: xmlDocPtr, node: xmlNodePtr) {
        self.docPtr  = docPtr
        self.nodePtr = node
    }
    
    // MARK: Searchable
    func xpath(xpath: String, namespaces: [String:String]?) -> XMLNodeSet {
        let ctxt = xmlXPathNewContext(docPtr)
        if ctxt == nil {
            return XMLNodeSet()
        }
        ctxt.memory.node = nodePtr
        
        if let nsDictionary = namespaces {
            for (ns, name) in nsDictionary {
                xmlXPathRegisterNs(ctxt, ns, name)
            }
        }
        
        let result = xmlXPathEvalExpression(xpath, ctxt)
        xmlXPathFreeContext(ctxt)
        if result == nil {
            return XMLNodeSet()
        }
        
        let nodeSet = result.memory.nodesetval
        if nodeSet == nil || nodeSet.memory.nodeNr == 0 || nodeSet.memory.nodeTab == nil {
            xmlXPathFreeObject(result)
            return XMLNodeSet()
        }
        
        var nodes : [XMLElement] = []
        let size = Int(nodeSet.memory.nodeNr)
        for var i = 0; i < size; ++i {
            let node: xmlNodePtr = nodeSet.memory.nodeTab[i]
            let htmlNode = libxmlHTMLNode(docPtr: docPtr, node: node)
            nodes.append(htmlNode)
        }
        xmlXPathFreeObject(result)
        return XMLNodeSet(nodes: nodes)
    }
    
    func xpath(xpath: String) -> XMLNodeSet {
        return self.xpath(xpath, namespaces: nil)
    }
    
    func at_xpath(xpath: String, namespaces: [String:String]?) -> XMLElement? {
        return self.xpath(xpath, namespaces: namespaces).first
    }
    
    func at_xpath(xpath: String) -> XMLElement? {
        return self.at_xpath(xpath, namespaces: nil)
    }
    
    func css(selector: String, namespaces: [String:String]?) -> XMLNodeSet {
        if let xpath = CSS.toXPath(selector) {
            if isRoot {
                return self.xpath(xpath, namespaces: namespaces)
            } else {
                return self.xpath("." + xpath, namespaces: namespaces)
            }
        }
        return XMLNodeSet()
    }
    
    func css(selector: String) -> XMLNodeSet {
        return self.css(selector, namespaces: nil)
    }
    
    func at_css(selector: String, namespaces: [String:String]?) -> XMLElement? {
        return self.css(selector, namespaces: namespaces).first
    }
    
    func at_css(selector: String) -> XMLElement? {
        return self.css(selector, namespaces: nil).first
    }
}

private func libxmlGetNodeContent(nodePtr: xmlNodePtr) -> String? {
    let content = xmlNodeGetContent(nodePtr)
    if let result  = String.fromCString(UnsafePointer(content)) {
        content.dealloc(1)
        return result
    }
    content.dealloc(1)
    return nil
}