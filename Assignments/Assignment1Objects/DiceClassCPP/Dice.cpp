/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "Dice.h"
#include <iostream>
using std::cout;
using std::endl;

Dice::Dice(int face) {
    setFace(face);
    setPic();
}

Dice::Dice(const Dice &r) {
    this->face = r.face;
    this->picture = r.picture;
}

Dice::~Dice() {
    //Nothing here
}

void Dice::setFace(int face) {
    if(face <= HISIDE && face >= LOWSIDE) 
        this->face = face;
    else
        this->face = BADVAL;
    
}

void Dice::setPic() {
    string tmp;
    //Assign img tag with path if face is not a bad value
    if(face != BADVAL){
        tmp = "<img src=\"faces\\face";
        tmp += static_cast<char>(this->face + 48);
        tmp += ".png\" />";
    }
    else {
        tmp = "<img src=\"faces\\mystery.png\" alt=\"You Messed Up\" />";
    }
    //Set image tag to picture
    this->picture = tmp;
}

int Dice::getFace() {
    return this->face;
}

string Dice::getPic() {
    return this->picture;
}

void Dice::toString() {
    //Output face value and img tag to console
    cout<<"Face: "<<this->getFace()<<endl;
    cout<<this->getPic()<<endl;
}