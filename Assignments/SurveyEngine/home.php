<!DOCTYPE html>
<?php
session_start();
if(!isSet($_SESSION["username"])) {
    header("location:index.php");
}
?>
<html lang="en-US">
    <head>
        <meta charset="utf-8" />
        <link href="site.css" rel="stylesheet" type="text/css">
        <script src="Survey.js"></script>
        <script src="Question.js"></script>
        <title>Survey Engine</title>
    </head>
    <body>
        <div id="main">
            <h1>Welcome to the main page</h1>
            <a href="creator.php">Create a new survey</a>
            <a href="surveyviewer.php">View my surveys</a>
        </div>
    </body>
</html>