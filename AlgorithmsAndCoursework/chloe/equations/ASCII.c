//
//  ASCII.c
//  equations
//
//  Created by Nathan Liu on 08/01/2016.
//  Copyright © 2016 Liu Empire. All rights reserved.
//

#include "ASCII.h"
#include <stdio.h>
#include <string.h>   /* for all the new-fangled string functions */
#include <stdlib.h>     /* malloc, free, rand */
#include <math.h>

float a1, b1, a2, b2, a3, b3, a4, b4, circleX1, circleY1, radius1;
float arrayPowers[15], arrayCoeficcients[15];

char *removeSpaces(char *equation) {
    for (int i = 0; i < strlen(equation); i++) {
        if (*(equation+i) == ' ') {
            for (int j = 0; *(equation+i+j) != '\0'; j++) {
                *(equation+i+j) = *(equation+j+i+1);
            }
            *(equation+strlen(equation)-1) = '\0';
        }
    }
    return equation;
}

void straightLine() {
    
    float gradient = (b1 - b2)/(a1 - a2);
    float constant = b1 - (gradient * a1);
    
    printf("Gradient is: %f\n", gradient);
    printf("Constant is: %f\n", constant);
    printf("y = %fx + %f \n", gradient, constant);
    
}

void pointOfIntersection() {
    
    float xCoordinate = ((b1 - (((b1 - b2)/(a1-a2))*a1)) - (b3 - (((b3 - b4)/(a3-a4))*a3)))/(((b3-b4)/(a3-a4))-((b1 - b2)/(a1 - a2)));
    float yCoordinate = ((b1 - b2)/(a1 - a2) * xCoordinate) + b1 - ((b1 - b2)/(a1 - a2) * a1);
    
    printf("X coordinate is %f \nY coordinate it %f \n", xCoordinate, yCoordinate);
    
}

void solveQuadratic() {
    
    float a,b,c;
    
    printf("Ax^2, A = "); scanf("%f", &a);
    printf("Bx, B = "); scanf("%f", &b);
    printf("The constant C, C = "); scanf("%f", &c);
    
    float discriminant = pow(b,2) - (4*a*c);
    
    if (pow(b,2) - (4*a*c) >= 0) {
        
        float alpha = (a - sqrtf(powf(b, 2) - (4 * a * c)))/(2 * a);
        float beta = (a + sqrtf(powf(b, 2) - (4 * a * c)))/(2 * a);
        
        printf("The discriminant is: %f \n", discriminant);
        printf("The solution for y = 0 is x = %f and %f\n", alpha, beta);
        printf("The factorised formula is ");
        
        if (alpha > 0) {
            printf("(x-%f)", alpha);
        } else {
            alpha = alpha * - 1;
            printf("(x + %f)", alpha);
        }
        
        if (beta > 0) {
            printf("(x-%f)\n", beta);
        } else {
            beta = alpha * - 1;
            printf("(x + %f)\n", beta);
        }
    } else {
        printf("The discriminant %f is smaller than 0. Therefore the equation has no real roots \n", discriminant);
    }
}

void equationCircle() {
    
    if (circleX1 > 0) {
        printf("(x-%f)^2 + ", circleX1);
    } else {
        circleX1 = circleX1 * - 1;
        printf("(x + %f)^2 + ", circleX1);
    }
    
    if (circleY1 > 0) {
        printf("(x-%f)^2 = %f", circleY1, pow(radius1,2));
    } else {
        circleY1 = circleY1 * - 1;
        printf("(x + %f)^2 = %f", circleY1, pow(radius1, 2));
    }
}

void *findEquationOfCircle(char *equation) {
    
    
    
    return 0;
}

void numbericalDifferentiation() {
    
}

char *differentiate(char *equation) {
    
    equation = removeSpaces(equation);
    
    return equation;
}