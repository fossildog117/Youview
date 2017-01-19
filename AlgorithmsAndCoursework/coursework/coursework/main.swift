//
//  main.swift
//  coursework
//
//  Created by Nathan Liu on 19/11/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

import Foundation
import Darwin

var n = 0
var numberOfIterations = 0
var numberOfNodes = 8
var gridSize = 4
var startingMoles = [1, 2, 4, 8, 9, 10, 11, 14]
var arrNodes = [[Int]](count: gridSize * gridSize, repeatedValue: [Int](count: 2, repeatedValue: 0))
var tempNodes = [[Int]](count: gridSize * gridSize, repeatedValue: [Int](count: 2, repeatedValue: 0))
var storageNodes = [[[Int]]](count: 0, repeatedValue: [[Int]](count: gridSize * gridSize, repeatedValue: [Int](count: 2, repeatedValue: 0)))
var counter = 0
var permStorage = [[[Int]]](count: 0, repeatedValue: [[Int]](count: gridSize * gridSize, repeatedValue: [Int](count: 2, repeatedValue: 0)))
var storeValueOfN = [Int](count: 0, repeatedValue: 0)

func count(input: Int) {
    counter = 0
    for var i = 0; i < gridSize * gridSize; i++ {
        if tempNodes[i][1] == 1 {
            counter++
        }
    }
}

for var i = 0; i < gridSize * gridSize; i++ {
    for var j = 0; j < numberOfNodes; j++ {
        if i + 1 == startingMoles[j] {
            arrNodes[i][1] = 1
        }
    }
    arrNodes[i][0] = i + 1
}

storageNodes.append(arrNodes)
permStorage.append(arrNodes)

for n = 0; n < gridSize * gridSize; n++ {
    
    if storageNodes[0][n][1] == 1 {
        tempNodes = storageNodes[0]
        whackMole(tempNodes)
        storageNodes.append(tempNodes)
        permStorage.append(tempNodes)
        storeValueOfN.append(n)
        count(counter)
        
        print(tempNodes)
        
        if counter == 0 {
            finalArray.append(tempNodes)
            backTrack(finalArray)
            print(finalArray)
            exit(0)
        }
    }
    
    if n == (gridSize * gridSize) - 1 {
        n = 0
        storageNodes.removeAtIndex(0)
    }
}