#include<stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int size = 100;
char *storeArray[];
int integerStore[];

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

int main () {
    char word[] = "(AxEx(X[xx]>Ey-X[xy])";
    //int idxToDel = 9;
    
    char *equation = malloc(size);
    
    printf("Enter Formula: ");
    fgets(equation, size, stdin);
    
    equation = removeSpaces(equation);
    
    int i = 0;
    int power = 0;
    int coefficient = 0;
    
    int store = 0;
    
//    for (int i = 0; *(equation+i) != '\0'; i++) {
//        if (*(equation+i) == '+') {
//            
//            if (store == 0) {
//                storeArray[store] = malloc(i+1);
//                memcpy(storeArray[store], equation, i);
//                storeArray[store][i] = '\0';
//                store++;
//                
//                for (int j = 0; j < strlen(storeArray[0]) + 1; j++) {
//                    storeArray[0][strlen(storeArray[0]) -j + 1] = storeArray[0][strlen(storeArray[0]) -j];
//                    
//                    if (j == strlen(storeArray[0])) {
//                        storeArray[0][0] = '+';
//                    }
//                    
//                }
//                
//            } else {
//                storeArray[store] = malloc(i);
//                memcpy(storeArray[store], equation, i);
//                storeArray[store][i] = '\0';
//                store++;
//            }
//            
//            storeArray[store] = malloc(i + strlen(equation)); // + 1 for null terminator
//            memcpy(storeArray[store], i + equation, strlen(equation) - i);
//            storeArray[store][strlen(equation) - i] = '\0';
//            store++;
//            
//            equation = storeArray[store-1];
//            
//            i = 0;
//        
//        }
//        
//    }
    
    for (int i = 0; i < store; i++) {
        printf("%s\n", storeArray[i]);
    }
    
    while (*(equation + i) != '\0') {
        
        if (*(equation+i) == 'x' || *(equation+i) == 'X') {
            for (int j = -1; j * -1 != i + 1 ; j--) {
                coefficient = coefficient + ((*(equation+i+j) - '0') * pow(10, (j * -1) - 1));
            }
        }
        
        if (*(equation + i) == '^') {
            for (int j = 1; (*(equation+i+j) != '\0'); j++) {
                if (*(equation+i+j) == '\n') {
                    break;
                }
                power = power + ((*(equation+i+j) - '0') * pow(10, strlen(equation) - i - j - 2));
            }
        }
        i++;
    }
    
    printf("%d %d\n", power, coefficient);
    printf("the differential is: %dx^ %d\n", power * coefficient, power -1);
    
    return 0;
}

