//
//  libxmlParserOption.swift
//  kathy
//
//  Created by Nathan Liu on 14/01/2016.
//  Copyright © 2016 Liu Empire. All rights reserved.
//

import Foundation
import libxml2

/*
Libxml2HTMLParserOptions
*/
public struct Libxml2HTMLParserOptions : OptionSetType {
    public typealias RawValue = UInt
    private var value: UInt = 0
    init(_ value: UInt) { self.value = value }
    private init(_ opt: htmlParserOption) { self.value = UInt(opt.rawValue) }
    public init(rawValue value: UInt) { self.value = value }
    public init(nilLiteral: ()) { self.value = 0 }
    public static var allZeros: Libxml2HTMLParserOptions { return .init(0) }
    static func fromMask(raw: UInt) -> Libxml2HTMLParserOptions { return .init(raw) }
    public var rawValue: UInt { return self.value }
    
    static let STRICT     = Libxml2HTMLParserOptions(0)
    static let RECOVER    = Libxml2HTMLParserOptions(HTML_PARSE_RECOVER)
    static let NODEFDTD   = Libxml2HTMLParserOptions(HTML_PARSE_NODEFDTD)
    static let NOERROR    = Libxml2HTMLParserOptions(HTML_PARSE_NOERROR)
    static let NOWARNING  = Libxml2HTMLParserOptions(HTML_PARSE_NOWARNING)
    static let PEDANTIC   = Libxml2HTMLParserOptions(HTML_PARSE_PEDANTIC)
    static let NOBLANKS   = Libxml2HTMLParserOptions(HTML_PARSE_NOBLANKS)
    static let NONET      = Libxml2HTMLParserOptions(HTML_PARSE_NONET)
    static let NOIMPLIED  = Libxml2HTMLParserOptions(HTML_PARSE_NOIMPLIED)
    static let COMPACT    = Libxml2HTMLParserOptions(HTML_PARSE_COMPACT)
    static let IGNORE_ENC = Libxml2HTMLParserOptions(HTML_PARSE_IGNORE_ENC)
}

/*
Libxml2XMLParserOptions
*/
public struct Libxml2XMLParserOptions: OptionSetType {
    public typealias RawValue = UInt
    private var value: UInt = 0
    init(_ value: UInt) { self.value = value }
    private init(_ opt: xmlParserOption) { self.value = UInt(opt.rawValue) }
    public init(rawValue value: UInt) { self.value = value }
    public init(nilLiteral: ()) { self.value = 0 }
    public static var allZeros: Libxml2XMLParserOptions { return .init(0) }
    static func fromMask(raw: UInt) -> Libxml2XMLParserOptions { return .init(raw) }
    public var rawValue: UInt { return self.value }
    
    static let STRICT     = Libxml2XMLParserOptions(0)
    static let RECOVER    = Libxml2XMLParserOptions(XML_PARSE_RECOVER)
    static let NOENT      = Libxml2XMLParserOptions(XML_PARSE_NOENT)
    static let DTDLOAD    = Libxml2XMLParserOptions(XML_PARSE_DTDLOAD)
    static let DTDATTR    = Libxml2XMLParserOptions(XML_PARSE_DTDATTR)
    static let DTDVALID   = Libxml2XMLParserOptions(XML_PARSE_DTDVALID)
    static let NOERROR    = Libxml2XMLParserOptions(XML_PARSE_NOERROR)
    static let NOWARNING  = Libxml2XMLParserOptions(XML_PARSE_NOWARNING)
    static let PEDANTIC   = Libxml2XMLParserOptions(XML_PARSE_PEDANTIC)
    static let NOBLANKS   = Libxml2XMLParserOptions(XML_PARSE_NOBLANKS)
    static let SAX1       = Libxml2XMLParserOptions(XML_PARSE_SAX1)
    static let XINCLUDE   = Libxml2XMLParserOptions(XML_PARSE_XINCLUDE)
    static let NONET      = Libxml2XMLParserOptions(XML_PARSE_NONET)
    static let NODICT     = Libxml2XMLParserOptions(XML_PARSE_NODICT)
    static let NSCLEAN    = Libxml2XMLParserOptions(XML_PARSE_NSCLEAN)
    static let NOCDATA    = Libxml2XMLParserOptions(XML_PARSE_NOCDATA)
    static let NOXINCNODE = Libxml2XMLParserOptions(XML_PARSE_NOXINCNODE)
    static let COMPACT    = Libxml2XMLParserOptions(XML_PARSE_COMPACT)
    static let OLD10      = Libxml2XMLParserOptions(XML_PARSE_OLD10)
    static let NOBASEFIX  = Libxml2XMLParserOptions(XML_PARSE_NOBASEFIX)
    static let HUGE       = Libxml2XMLParserOptions(XML_PARSE_HUGE)
    static let OLDSAX     = Libxml2XMLParserOptions(XML_PARSE_OLDSAX)
    static let IGNORE_ENC = Libxml2XMLParserOptions(XML_PARSE_IGNORE_ENC)
    static let BIG_LINES  = Libxml2XMLParserOptions(XML_PARSE_BIG_LINES)
}