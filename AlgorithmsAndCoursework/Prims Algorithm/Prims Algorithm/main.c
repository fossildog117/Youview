//
//  main.c
//  Prims Algorithm
//
//  Created by Nathan Liu on 19/10/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

#include <stdio.h>

float irLeft, irRight, difference;
int key[];

void make(float difference, int tracker) {
    
    
    
}

int main(void)
{

    low(26);
    low(27);
    
    int i = 0;
    
    while(1) {
        
        irLeft = 0;
        irRight = 0;
        
        for(int dacVal = 0; dacVal < 160; dacVal += 8)  // <- add
        {                                               // <- add
            dac_ctr(26, 0, dacVal);                       // <- add
            freqout(11, 1, 38000);                        // <- add
            irLeft += input(10);                          // <- modify
            
            dac_ctr(27, 1, dacVal);                       // <- add
            freqout(1, 1, 38000);
            irRight += input(2);                          // <- modify
        }
        
        difference = irLeft - irRight;
        
    }
    
}



