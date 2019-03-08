<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>PHP Dice</title>
        <style>
            img {width: 100px; height: 100px;}
        </style>
        <?php include './Dice.php'?>
    </head>
    <body>
        <h1>PHP Dice Class </h1>
        <?php
        $numSide = 6;
        $faces=array($numSide);
        for($i = 0; $i < $numSide; ++$i) {
            $faces[$i] = new Dice($i + 1);
            $faces[$i]->toString();
        }
        ?>
    </body>
</html>
