//
//  main.cpp
//  courseworkfoursolution
//
//  Created by Nathan Liu on 31/10/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

#include <stdio.h>

long long counterFunction(int digits, int summation) {
    if (digits == 1) {
        if (summation >= 0 && summation < 10) {
            return 1;
        } else {
            return 0;
        }
    } else {
        long long sum = 0;
        int i;
        for (i = 0; i < 10; i++) {
            if (i == summation) {
                sum++;
                break;
            } else {
                sum = sum + counterFunction(digits - 1, summation - i);
            }
        }
        return sum;
    }
}
int main(void) {
    
        printf("Enter Number Of Digits: ");
        int inputDigits;
        scanf("%d", &inputDigits);
    
        printf("Enter Summation Value: ");
        int inputSum;
        scanf("%d", &inputSum);
    
        printf("%lld\n", counterFunction(inputDigits, inputSum));
        printf("Press Ctrl and C to Exit\n");
    
    return 0;
}

