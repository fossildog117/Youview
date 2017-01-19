//
//  ASCII.h
//  equations
//
//  Created by Nathan Liu on 08/01/2016.
//  Copyright © 2016 Liu Empire. All rights reserved.
//

#ifndef ASCII_h
#define ASCII_h

#include <stdio.h>

void straightLine();
void pointOfIntersection();
void solveQuadratic();
void equationCircle();
void numbericalDifferentiation();

void *findEquationOfCircle(char *equation);

int strtoInt(char *number);

char *removeSpaces(char *equation);
char *differentiate(char *equation);

#endif /* ASCII_h */
