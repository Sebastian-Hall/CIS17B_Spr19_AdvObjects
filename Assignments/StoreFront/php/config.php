 <?php
// Create connection
function connect($server, $username, $password, $db) {
    $conn = new mysqli($server, $username, $password, $db);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}
?> 
