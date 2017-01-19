//
//  main.swift
//  ProjectY
//
//  Created by Nathan Liu on 23/11/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

import Foundation

var names = String()

print("\(names.characters.count)")

var caseSensitive: Bool

var string = "hello world"

var range = string.rangeOfString(" ")!
var index = string.startIndex.distanceTo(range.startIndex)

print(range)
print(index)

string.removeRange(string.endIndex.advancedBy(-index)..<string.endIndex)

print(string)

