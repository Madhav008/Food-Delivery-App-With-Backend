<?php 

include '../config/config.php';

$result = array();

$queryFood = "SELECT * FROM foods";

$queryResult = mysqli_query($conn,$queryFood);

while($row = mysqli_fetch_assoc($queryResult)){
	
	 array_push($result,$row);
	 
}


 echo json_encode($result);

?>