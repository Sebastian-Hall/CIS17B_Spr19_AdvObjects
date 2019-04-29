<!DOCTYPE html>
<?php
session_start();
if(!isSet($_SESSION["username"])) {//If not logged in
    header("location:index.php");
}
?>
<html lang="">
<head>
    <meta charset="utf-8">
    <script src="Survey.js"></script>
    <script src="Question.js"></script>
    <title>Your Survey</title>
</head>

<body>
    <?php
        require_once('config.php');
        $conn = connDB("localhost", "root", "", "surveyengine");
        $id = $_GET["id"];
        $sql = "SELECT `survey_jsontext` FROM `surveyengine`.`surveys` WHERE `survey_id`=$id;";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $txt = $row["survey_jsontext"];
        echo "<script>" .
                "var obj = JSON.parse('$txt');" .
                "var srvy = new Survey(obj);" . 
                "document.write(srvy.toHTML());" . 
             "</script>";
    ?>
</body>
</html>
