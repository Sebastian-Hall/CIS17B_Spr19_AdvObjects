<?php
    
define('HISIDE', 6);
define('LOWSIDE',1);
define('BADVAL',-1);


class Dice {
    private $face;
    private $picture;
    
    private function setPic() {
        $tmp = NULL;
    //Assign img tag with path if face is not a bad value
    if($this->face != BADVAL){
        $tmp = "<img src=\"faces\\face" . $this->face . ".png\" />";
    }
    else {
        $tmp = "<img src=\"faces\\mystery.png\" alt=\"You Messed Up\" />";
    }
    //Set image tag to picture
    $this->picture = $tmp;
    }
    
    public function Dice($face) {
        $this->setFace($face);
        $this->setPic();
    }
    
    public function setFace($face) {
        if($face <= HISIDE && $face >= LOWSIDE) {
        $this->face = $face;
        } else {
            $this->face = BADVAL;
        }
    }
    
    public function getFace() {
        return $this->face;
    }
    
    public function getPic() {
        return $this->picture;
    }
    
    public function toString() {
        echo "Face: " . $this->getFace() . "<br/>";
        echo $this->getPic() . "<br/>";
    }
}
?>