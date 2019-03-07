/* 
 * File:   Dice.h
 * Author: Sebastian Hall
 * Created on March 7, 2019, 1:29 PM
 * Purpose: Create a dice class to display 6 faces the faces of a dice
 */

#ifndef DICE_H
#define DICE_H

#include <string>
using std::string;

class Dice {
private:
    static const int HISIDE = 6;//Highest possible valid face value
    static const int LOWSIDE = 1;//Lowest possible valid face value
    static const int BADVAL = -1;//Default value for bad face values
    int face;//The face value of the dice
    string picture;//Holds an html image tag of the dice face
    void setPic();//Sets the img tag for the dice face
    
public:
    Dice(int);
    Dice(const Dice &);
    ~Dice();
    void setFace(int);
    int getFace();
    string getPic();
    void toString();
};

#endif /* DICE_H */

