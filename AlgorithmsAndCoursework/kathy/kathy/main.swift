//
//  main.swift
//  kathy
//
//  Created by Nathan Liu on 14/01/2016.
//  Copyright © 2016 Liu Empire. All rights reserved.
//

import Kanna

let html = "<html>...</html>"

if let doc = Kanna.HTML(html: html, encoding: NSUTF8StringEncoding) {
    println(doc.title)
    
    // Search for nodes by CSS
    for link in doc.css("a, link") {
        println(link.text)
        println(link["href"])
    }
    
    // Search for nodes by XPath
    for link in doc.xpath("//a | //link") {
        println(link.text)
        println(link["href"])
    }
}
let xml = "..."
if let doc = Kanna.XML(xml: xml, encoding: NSUTF8StringEncoding) {
    let namespaces = [
        "o":  "urn:schemas-microsoft-com:office:office",
        "ss": "urn:schemas-microsoft-com:office:spreadsheet"
    ]
    if let author = doc.at_xpath("//o:Author", namespaces: namespaces) {
        println(author.text)
    }
}