/*******************************************************************************
    Function definitions
*******************************************************************************/
#include "functions.h"
#include <iostream>

using namespace std;

int search(int array[], int reccnt, int searchvalue) {
    for(int i = 0; i < reccnt; i++) {
        if(array[i] == searchvalue) {
            return i+1;
        }
    }
    return -2;
}

int modify(int array[], int index, int new_value, int reccnt) {
    if(index < 1 || index > reccnt) {
        throw out_of_range("Index out of range");
    }
    
    for(int i = 0; i < reccnt; i++) {
        if((i+1) == index) {
            int oldvalue = array[i];
            array[i] = new_value;
            return oldvalue;
        }
    }
    return -2;
}

void remove(int array[], int index, int reccnt) {
    for(int i = 0; i < reccnt; i++) {
        if((i+1) == index) {
            array[i] = 0;
            break;
        }
    }
}

int add(int array[], int reccnt, int new_value) {
    for(int i = 0; i < reccnt; i++) {
        if(array[i] == 0) {
            array[i] = new_value;
            return new_value;
        }
    }
    cout << endl;
    throw out_of_range("Array is full.");
}