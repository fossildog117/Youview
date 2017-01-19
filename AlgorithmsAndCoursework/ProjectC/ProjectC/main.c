//
//  main.c
//  ProjectC
//
//  Created by Nathan Liu on 23/11/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

#include <stdio.h>

double leftWheelSpeed(double distance) {
    distance = (2.1333333333333333 * distance) + 64;
    return distance;
}

double rightWheelSpeed(double distance) {
    distance = (2.1333333333333333 * distance * -1) + 64;
    return distance;
}

double distanceToTicks(double x) {
    x = x/3.25;
    return x;
}

double angleToTicks(double x) {
    x = x/5.625;
    return x;
}

int main(int argc, const char * argv[]) {
    
    double irLeft, irRight, distance;
    distance = irLeft - irRight;
    
    for (int i = 0; i < 2147483647; i++) {
        if (i == 2147483646) {
            printf("%d", i);
        }
    }
    
    return 0;
}

