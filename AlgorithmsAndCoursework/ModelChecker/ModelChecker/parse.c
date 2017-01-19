//
//  parse.c
//  ModelChecker
//
//  Created by Nathan Liu on 29/12/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//
#include <stdio.h>
#include <string.h>   /* for all the new-fangled string functions */
#include <stdlib.h>     /* malloc, free, rand */
#include "parse.h"

int numberOfBrackets = 0;
int lengthOfString = 0;
int store = 0;

char bin(char *g);
char *partone(char *g);
char *parttwo(char *g);
char *string[];

int parse(char *g);
char *partone(char *g);
char *parttwo(char *g);
char bin(char *g);

int parse(char *g);
char *partone(char *g);
char *parttwo(char *g);
char bin(char *g);


int parse(char *g)
/* returns 0 for non-formulas, 1 for atoms, 2 for negations, 3 for binary connective fmlas, 4 for existential and 5 for universal formulas.*/

{
    if (*g == 'X') {
        if (*(g+1) == '[') {
            if (*(g+2) == 'x' || *(g+2) == 'y' || *(g+2) == 'z') {
                if (*(g+3) == 'x' || *(g+3) == 'y' || *(g+3) == 'z') {
                    if (*(g+4) == ']') {
                        if(*(g + 5) == '\0') {
                            return 1;
                        } else {
                            return 0;
                        }
                    }
                    return 0;
                }
                return 0;
            }
            return 0;
        }
        return 0;
    }
    
    if (*g == '-') {
        if (parse(g+1) != 0) {
            return 2;
        }
    }
    
    if (*g == 'E') {
        if (*(g+1) == 'x' || *(g+1) == 'y' || *(g+1) == 'z') {
            if (parse(g+2) > 0) {
                return 4;
            }
        }
    }
    
    if (*g == 'A') {
        if (*(g+1) == 'x' || *(g+1) == 'y' || *(g+1) == 'z') {
            if (parse(g+2) > 0) {
                return 5;
            }
        }
    }
    
    if (*g == '(') {
        numberOfBrackets++;
        lengthOfString++;
        
        bin(g+1);
        
        long len2 = strlen(g) - lengthOfString;
        string[store] = malloc(lengthOfString); // one for the null terminator
        memcpy(string[store], g+1, lengthOfString - 2);
        
        string[store][lengthOfString - 1] = '\0';
        store++;
        
        string[store]= malloc(len2 + 1); // one for the null terminator
        memcpy(string[store], g+lengthOfString, len2 - 1);
        
        string[store][len2 - 1] = '\0';
        store++;
        
        printf("%s, %s \n", string[store - 2], string[store - 1]);
        string[store] = string[store - 1];
        
        lengthOfString = 0;
        numberOfBrackets = 0;
        
        if (parse(string[store - 2]) != 0) {
            
            if (parse(string[store]) != 0) {
                
                return 3;
                
            }
        }
    }
    
    return 0;
}

char *partone(char *g)
/*
 Given a formula (A*B) this should return A
 */
{
    printf("%s \n", g);
    return string[0];
}

char *parttwo(char *g)
/*
 Given a formula (A*B) this should return B
 */
{
    return string[1];
}

char bin(char *g)
/*
 Given a formula (A*B) this should return the character *
 */
{
    
    if (numberOfBrackets == 1) {
        
        if (*g == 'v' || *g == '^' || *g == '>' || *g == '<') {
            
            lengthOfString++;
            
            return *g;
        }
    }
    
    if (*g == '(') {
        numberOfBrackets++;
        
    }
    
    if (*g == ')') {
        numberOfBrackets--;
    }
    
    if (lengthOfString == strlen(g)) {
        return 0;
    }
    
    lengthOfString++;
    
    return bin(g+1);
    
}