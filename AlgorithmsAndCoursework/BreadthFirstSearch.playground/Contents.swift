import Foundation
import Darwin

var n = 1
var numberOfIterations = 0
var numberOfNodes = 8
var gridSize = 4
var tempNodes = [[Int]](count: gridSize * gridSize, repeatedValue: [Int](count: 2, repeatedValue: 0))

tempNodes = [[1, 1], [2, 1], [3, 0], [4, 1], [5, 0], [6, 1], [7, 0], [8, 1], [9, 0], [10, 0], [11, 0], [12, 0], [13, 0], [14, 0], [15, 0], [16, 0]]



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

whackMole(tempNodes)
print(tempNodes)