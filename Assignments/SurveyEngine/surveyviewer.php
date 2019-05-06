<!DOCTYPE html>
<?php
session_start();
if(!isSet($_SESSION["username"])) {//If not logged in
    header("location:index.php");
}
?>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="site.css" type="text/css" />
    <title>View all of your Surveys</title>
</head>

<body>
    <div id="main">
        <h1>My Surveys</h1>
        <?php
        require_once('config.php');
        $conn = connDB("localhost", "root", "", "surveyengine");
        $id = $_SESSION["id"];
        $sql = "SELECT `survey_id`, `survey_name` FROM `surveyengine`.`surveys` WHERE `survey_user_id`=$id;";
        $result = $conn->query($sql);
        if($result->num_rows > 0) {
            echo "<ul style='list-style-type:none;'>";
            while($rows = $result->fetch_assoc()) {
                $name = $rows["survey_name"];
                $sId = $rows["survey_id"];
                echo "<li><a href='mysurvey.php?id=$sId' target='_blank'>$name</a></li>";
            }
        } else {
            echo "<h3>You Haven't Made Any Surveys Yet</h3>";
        }
        ?>
    </div>
</body>
</html>
