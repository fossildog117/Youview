//
//  main.c
//  BreadthFirstSearchCourseWorkFive
//
//  Created by Nathan Liu on 19/11/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

#include <stdio.h>

int startingMoles[] = {1, 2, 4, 8, 9, 10, 11, 14};
int numberOfMoles = 8;

struct Node {
    int  level;
    int grid[16][2];
};

void printNode(struct Node node);

int main(int argc, char *argv[]) {
    
    struct Node firstNode;
    
    firstNode.level = 0;
    
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < numberOfMoles; j ++) {
            if (i + 1 == startingMoles[j]) {
                firstNode.grid[i][1] = 1;
            }
        }
        firstNode.grid[i][0] = i + 1;
    }
    
    printNode(firstNode);
    
    return 0;
}

void printNode(struct Node node) {
    printf("Level is: %d \nGrid is: \n", node.level);
    
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 2; j++) {
            printf("[%d][%d]: %d \n", i, j, node.grid[i][j]);
        }
    }
}