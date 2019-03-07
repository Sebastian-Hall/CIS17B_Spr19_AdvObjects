/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//Declare constants
const HISIDE = 6;
const LOWSIDE = 1;
const BADVAL = -1;

function Dice(fVal) {
    this.setFace(fVal);
    this.setPic();
}

Dice.prototype.setFace = function(fVal) {
    if(fVal <= HISIDE && fVal >= LOWSIDE) {
        this.face = fVal;
    } else {
        this.face = BADVAL;
    }
};

Dice.prototype.setPic = function() {
    var tmp = "";
    //Assign img tag with path if face is not a bad value
    if(this.face != BADVAL){
        tmp = "<img src=\"faces\\face";
        tmp += this.face;
        tmp += ".png\" />";
    }
    else {
        tmp = "<img src=\"faces\\mystery.png\" alt=\"You Messed Up\" />";
    }
    //Set image tag to picture
    this.picture = tmp;
};

Dice.prototype.getFace = function() {
    return this.face;
};

Dice.prototype.getPic = function() {
    return this.picture;
};

Dice.prototype.toString = function() {
    var output = "";
    output = "<p>Face: " + this.getFace() + "</p>";
    output += this.getPic();
    output += "<br/><br/>";
    document.write(output);
};