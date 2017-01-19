//
//  main.c
//  Prim's Algorithm
//
//  Created by Nathan Liu on 18/10/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int testArray[] = {18, 12, 11, 10, 9, 8};
int testArrayTotal;
int flowControl, i, tracker;

int size = 5;
int coordinatesArr[5][2] = {{3, 6}, {7, 9}, {4, 4}, {1, 7}, {8, 2}};
int distancesArr[numberOfArcs][2];

int main()
{
    
    int numberOfArcs = 0.5 * size * (size - 1);
    
    for (int outerControl = 0; outerControl < size; outerControl++) {
        
        for (int innerControl = 0; innerControl < size; innerControl++) {
            
            distancesArr[size][size] = coordinatesArr[
            
        }
        
    }
    
    // BubbleSort Algorithm Start
    
    testArrayTotal = 6; // total number of entries in array
    flowControl = 0; // controls outer cycle
    tracker = 1; // controls inner cycle
    
    while (flowControl <= testArrayTotal) {
        //Outer cycle
        
        if (testArray[tracker] < testArray [tracker - 1] ) {
            // Inner cycle
            
            int dummyVariable = testArray[tracker];
            testArray[tracker] = testArray[tracker - 1];
            testArray[tracker - 1] = dummyVariable;
            tracker = tracker - 1;
            
        } else {
            
            flowControl++;
            tracker = flowControl;
            
        }
        
    }
    
    for (i = 0; i < 6; i++) {
        
        printf("%i ", testArray[i]);
        
    }
    
    // BubbleSort Algorithm End

    
    return 0;
}

