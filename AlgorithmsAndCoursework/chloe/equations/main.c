#include <stdio.h>
#include <string.h>   /* for all the new-fangled string functions */
#include <stdlib.h>     /* malloc, free, rand */

int Fsize=50;
int cases=10;

int parse(char *g);
char bin(char *g);
char *partone(char *g);
char *parttwo(char *g);

int i;
int j;

/*typedef struct tableau tableau;*/

typedef struct tableau {
    char *root;
    struct tableau *left;
    struct tableau *right;
    struct tableau *parent;
}*tab, *node, *node1, *kid, *pa;

int parse(char *g)
{
    if (*g == 'p' || *g == 'q' || *g == 'r') {
        return 1;
    }
    
    // Negation
    
    if (*g == '-') {
        if (parse(g+1) != 0) {
            return 2;
        }
    }
    
    // Binary Connective
    
    if (*g == '(') {
        if (parse(partone(g)) != 0 && parse(parttwo(g)) != 0) {
            return 3;
        }
    }
    
    return 0;
}

char *partone(char *g)
/*
 Given a formula (A*B) this should return A
 */
{
    
    int leftBracket = 0;
    int rightBracket = 0;
    
    char *outString = malloc(strlen(g));
    // printf("%s \n", g);
    for (int i = 0; i < strlen(g); i++) {
        if (*(g+i) == '(') {
            leftBracket++;
        }
        if (*(g+i) == ')') {
            rightBracket++;
        }
        if (rightBracket + 1 == leftBracket) {
            if (*(g+i) == '^' || *(g+i) == '>' || *(g+i) == 'v') {
                memcpy(outString, g + 1, i - 1);
                break;
            }
        }
    }
    
    return outString;
}

char *parttwo(char *g)
/*
 Given a formula (A*B) this should return B
 */
{
    
    int leftBracket = 0;
    int rightBracket = 0;
    
    char *outString = malloc(strlen(g));
    
    int i;
    for (i = (int)strlen(g) - 1; i > -1 ; i--) {
        
        if (*(g+i) == '(') {
            leftBracket++;
        }
        if (*(g+i) == ')') {
            rightBracket++;
        }
        if (rightBracket == leftBracket + 1) {
            if (*(g+i) == '^' || *(g+i) == '>' || *(g+i) == 'v') {
                memcpy(outString, g + i + 1, (int)strlen(g) - i - 2);
                break;
            }
        }
    }
    
    return outString;
}

char bin(char *g)
/*
 Given a formula (A*B) this should return the character *
 */
{
    
    int leftBracket = 0;
    int rightBracket = 0;
    
    char retChar;
    
    for (int i = 0; i < strlen(g); i++) {
        
        if (*(g+i) == '(') {
            leftBracket++;
        }
        if (*(g+i) == ')') {
            rightBracket++;
        }
        
        if (rightBracket + 1 == leftBracket) {
            if (*(g+i) == '^' || *(g+i) == '>' || *(g+i) == 'v') {
                retChar = *(g+i);
                break;
            }
        }
    }
    return retChar;
}
