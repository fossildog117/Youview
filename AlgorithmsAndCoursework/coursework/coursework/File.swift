//
//  File.swift
//  coursework
//
//  Created by Nathan Liu on 19/11/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

import Foundation

var ii = 0

var finalArray = [[[Int]]](count: 0, repeatedValue: [[Int]](count: gridSize * gridSize, repeatedValue: [Int](count: 2, repeatedValue: 0)))

var currentArray = [[Int]](count: gridSize * gridSize, repeatedValue: [Int](count: 2, repeatedValue: 0))
var storeNode = [[Int]](count: gridSize * gridSize, repeatedValue: [Int](count: 2, repeatedValue: 0))

func backTrack(Array: [[[Int]]]) {
    
    permStorage.removeRange((permStorage.count - storageNodes.count + 2)...(permStorage.count - 1))
    storeValueOfN.removeRange((storeValueOfN.count - storageNodes.count + 2)...(storeValueOfN.count - 2))
    
    currentArray = tempNodes
    print(permStorage)
    print(storeValueOfN)
    
    print(permStorage.count)
    print(storeValueOfN.count)
    
    for ii = permStorage.count - 1; ii >= 0; ii = ii - 1 {
        
        n = storeValueOfN[ii]

        tempNodes = permStorage[ii]
        storeNode = permStorage[ii]
        
        whackMole(tempNodes)

        if tempNodes == currentArray {
            finalArray.append(storeNode)
            currentArray = storeNode
        }
    }
}

func whackMole(array: [[Int]]) {
    
    tempNodes[n][1] = 0
    
    if n == 0 || n == gridSize - 1 || n == (gridSize * gridSize) - gridSize || n == (gridSize * gridSize) - 1 {
        
        // Cornor Nodes
        if n == 0 {
            if tempNodes[1][1] == 1 {
                tempNodes[1][1] = 0
            } else {
                tempNodes[1][1] = 1
            }
            if tempNodes[gridSize][1] == 1 {
                tempNodes[gridSize][1] = 0
            } else {
                tempNodes[gridSize][1] = 1
            }
        }
        if n == gridSize - 1 {
            if tempNodes[gridSize - 2][1] == 1 {
                tempNodes[gridSize - 2][1] = 0
            } else {
                tempNodes[gridSize - 2][1] = 1
            }
            if tempNodes[(gridSize * 2) - 1][1] == 1 {
                tempNodes[(gridSize * 2) - 1][1] = 0
            } else {
                tempNodes[(gridSize * 2) - 1][1] = 1
            }
        }
        if n == (gridSize * gridSize) - gridSize {
            if tempNodes[(gridSize * gridSize) - gridSize + 1][1] == 1 {
                tempNodes[(gridSize * gridSize) - gridSize + 1][1] = 0
            } else {
                tempNodes[(gridSize * gridSize) - gridSize + 1][1] = 1
            }
            if tempNodes[(gridSize * gridSize) - (2 * gridSize)][1] == 1 {
                tempNodes[(gridSize * gridSize) - (2 * gridSize)][1] = 0
            } else {
                tempNodes[(gridSize * gridSize) - (2 * gridSize)][1] = 1
            }
        }
        if n == (gridSize * gridSize) - 1 {
            if tempNodes[(gridSize * gridSize) - 2][1] == 1 {
                tempNodes[(gridSize * gridSize) - 2][1] = 0
            } else {
                tempNodes[(gridSize * gridSize) - 2][1] = 1
            }
            if tempNodes[(gridSize * gridSize) - 1 - gridSize][1] == 1 {
                tempNodes[(gridSize * gridSize) - 1 - gridSize][1] = 0
            } else {
                tempNodes[(gridSize * gridSize) - 1 - gridSize][1] = 1
            }
        }
        
        // Side Nodes
    } else if n < gridSize - 1 && 0 < n || n % gridSize == 0 && n != (gridSize * gridSize) - gridSize && n != 0 || n < gridSize * gridSize && n > (gridSize * gridSize) - gridSize || (n + 1) % gridSize == 0 && n != (gridSize * gridSize) - 1 && n != gridSize - 1 {
        
        if n < gridSize - 1 && 0 < n || n < gridSize * gridSize && n > (gridSize * gridSize) - gridSize {
            if tempNodes[n - 1][1] == 1 {
                tempNodes[n - 1][1] = 0
            } else {
                tempNodes[n - 1][1] = 1
            }
            if tempNodes[n + 1][1] == 1 {
                tempNodes[n + 1][1] = 0
            } else {
                tempNodes[n + 1][1] = 1
            }
            if n < gridSize - 1 && 0 < n {
                if tempNodes[n + gridSize][1] == 1 {
                    tempNodes[n + gridSize][1] = 0
                } else {
                    tempNodes[n + gridSize][1] = 1
                }
            } else {
                if tempNodes[n - gridSize][1] == 1 {
                    tempNodes[n - gridSize][1] = 0
                } else {
                    tempNodes[n - gridSize][1] = 1
                }
            }
        }
        if n % gridSize == 0 && n != (gridSize * gridSize) - gridSize && n != 0 || (n + 1) % gridSize == 0 && n != (gridSize * gridSize) - 1 && n != gridSize - 1 {
            if n % gridSize == 0 && n != (gridSize * gridSize) - gridSize && n != 0 {
                if tempNodes[n + 1][1] == 1 {
                    tempNodes[n + 1][1] = 0
                } else {
                    tempNodes[n + 1][1] = 1
                }
            } else {
                if tempNodes[n - 1][1] == 1 {
                    tempNodes[n - 1][1] = 0
                } else {
                    tempNodes[n - 1][1] = 1
                }
            }
            if tempNodes[n - gridSize][1] == 1 {
                tempNodes[n - gridSize][1] = 0
            } else {
                tempNodes[n - gridSize][1] = 1
            }
            if tempNodes[n + gridSize][1] == 1 {
                tempNodes[n + gridSize][1] = 0
            } else {
                tempNodes[n + gridSize][1] = 1
            }
        }
        // Central Nodes
    } else {
        if tempNodes[n - gridSize][1] == 1 {
            tempNodes[n - gridSize][1] = 0
        } else {
            tempNodes[n - gridSize][1] = 1
        }
        if tempNodes[n + gridSize][1] == 1 {
            tempNodes[n + gridSize][1] = 0
        } else {
            tempNodes[n + gridSize][1] = 1
        }
        if tempNodes[n - 1][1] == 1 {
            tempNodes[n - 1][1] = 0
        } else {
            tempNodes[n - 1][1] = 1
        }
        if tempNodes[n + 1][1] == 1 {
            tempNodes[n + 1][1] = 0
        } else {
            tempNodes[n + 1][1] = 1
        }
    }
}
