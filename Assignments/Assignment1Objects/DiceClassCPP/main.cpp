/* 
 * File:   main.cpp
 * Author: Sebastian Hall
 * Created on March 7, 2019, 1:26 PM
 * Purpose: Test the dice class
 */

#include <iostream>
#include "Dice.h"
using namespace std;

int main(int argc, char** argv) {
    //Declare variables
    Dice *die = nullptr;//Pointer to sides of dice
    
    //Loop through and create/delete 6 sides of a dice and output dice
    for(int i = 1; i <= 6; ++i) {
        die = new Dice(i);
        die->toString();
        cout<<endl;
        delete die;
    }
    //A Sebastian Production
    return 0;
}

