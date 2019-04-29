<?php
require_once('config.php');

//Start session
session_start();
if(!isSet($_SESSION["username"]) || $_SERVER["REQUEST_METHOD"] != "POST") {//If not logged in
    header("location:index.php");
}

//Declare variables
$server = 'localhost';//Server name
$username = 'root';//Server username
$password = '';//Server password
$db = 'surveyengine';//Database name
$sql;//SQL query to be executed
$result;//Result of SQL query
$sname = $_POST["surveyName"];//Name of survey
$userid = $_SESSION["id"];//ID of user
$jsontext = $_POST["jsonText"];//Survey in json text form

//Create connection to database
$conn = connDB($server, $username, $password, $db);

//Check to see if survey record already exists in db
$sql = "SELECT `survey_name` FROM `surveyengine`.`surveys` WHERE `survey_name`='$sname';";
$result = $conn->query($sql);

//Store survey in db
If($result->num_rows > 0) {//Update record

} else {//Create record
    $sql = "INSERT INTO `surveyengine`.`surveys` (`survey_jsontext`, `survey_name`, `survey_user_id`) VALUES ('$jsontext', '$sname', $userid);";
    $conn->query($sql);
}

//Close connection and direct to home page
$conn->close();
header("location:home.php");
?>