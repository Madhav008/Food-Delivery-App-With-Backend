<?php

$host = "localhost";
$user = "root";
$password = "";
$db_name = "puri_fast_food";

$conn = mysqli_connect($host, $user, $password, $db_name);

if (!$conn) {
	echo "Not Connected";
}


?>