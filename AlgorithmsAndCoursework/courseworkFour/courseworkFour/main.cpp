//
//  main.cpp
//  courseworkFour
//
//  Created by Nathan Liu on 30/10/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

#include <iostream>
#include <math.h>

void sum();
int total = 0;

int main(int argc, const char * argv[]) {
    
    sum();
    
    printf("%d \n", total);
    
    return 0;
}

void sum() {
    
    int n, sumNumber;
    int i = 0, tracker = 0, sumAux = 0;
    
    printf("Enter number: ");
    scanf("%d", &n);
    
    printf("Enter sum: ");
    scanf("%d", &sumNumber);
    
    while (i < pow(10, n)) {
        
        while (tracker < n) {
            
            int temp = i / pow(10, tracker);
            int dummy = temp/10;
            int output = temp - (dummy * 10);
            
            sumAux = sumAux + output;
            
            if (sumAux > sumNumber) {
                
                tracker = n - 1;
                
            }
            
                if (tracker == n - 1 && sumAux == sumNumber) {
                    
                    sumAux = 0;
                    total++;
                    
                }
                
                if (tracker == n - 1) {
                    
                    sumAux = 0;
                    
            }
            
            tracker++;
            
        }
        
        if (tracker == n) {
            
            tracker = 0;
            
        }
        
        i++;
        
    }
    
}
