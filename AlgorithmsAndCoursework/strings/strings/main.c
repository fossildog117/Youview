//
//  main.c
//  strings
//
//  Created by Nathan Liu on 10/12/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

#include <stdio.h>

double x;
double LW, RW;

int main (int argc, const char * argv[]) {
    
    x = 9;
    
    LW = (-0.187302 * x * x * x) + (6.33333333 * x * x) - (73.1556 * x) + 349.524;
    RW = (((-0.187302 * x * x * x) + (6.33333333 * x * x) - (73.1556 * x) + 349.524) * -1) + 128;
    
    
    printf("%f, %f", LW, RW);
    
    return 0;
}

