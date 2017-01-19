//
//  main.c
//  MeetingNewPeople
//
//  Created by Nathan Liu on 23/10/2015.
//  Copyright © 2015 Liu Empire. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#define MULTIPLER 31334
#define MODDER 31337

void quickSort(long long *a, int l, int r, int n) {
    long long v, i, j, t;
    if (r>l) {
        
        i = l - 1;
        j = r;
        v = a[j];
        for (;;) {
            while (a[++i] < v);
            while (a[--j] > v);
            if (i >= j) {
                break;
            }
            t = a[i];
            a[i] = a[j];
            a[j] = t;
        }
        t = a[i];
        a[i] = a[r];
        a[r] = t;
        //printf("------------\n");
        for (j = 0; j < n; j++) {
            //printf("%lld\n", a[j]);
        }
        quickSort(a, l, i - 1, n);
        quickSort(a, i + 1, r, n);
    }
}

int main() {
    printf("Enter the Initial number: ");
    int initialNumber = 16804;
    scanf("%d", &initialNumber);
    printf("Enter the Person number: ");
    int personNumber = 1853932;
    scanf("%d", &personNumber);
    
    //array
    long long *a = (long long *)malloc(sizeof(long long)* personNumber);
    if (a == NULL) {
        printf("Memory allocated is not sufficent");
        return -1;
    }
    long long workingNumber = initialNumber;
    int i;
    long long temp;
    for (i = 0; i < personNumber; i++) {
        temp = workingNumber * 10000000 + i;
        a[i] = temp;
        workingNumber = (workingNumber*MULTIPLER) % MODDER;
        //printf("%lld\t%lld\n", temp, initialNumber);
    }
    
    // size of array
    int an = personNumber;
    quickSort(a, 0, an - 1, an);
    
    for (i = 0; i < personNumber; i++) {
        if (a[i] % 10000000 == personNumber-1) {
            printf("Found at %d\n", i);
            break;
        }
    }
    printf("end");
    return 0;
}
