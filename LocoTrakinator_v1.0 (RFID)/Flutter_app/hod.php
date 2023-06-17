<?php
$servername="localhost";
$username="root";
$password="";
$dbname="details";
$conn =new mysqli($servername,$username,$password,$dbname);
if ($conn -> connect_error){
	die("Connection failed: ". $conn->connect_error);
}
$sql="SELECT * from hod";
$result=$conn -> query($sql);
$response=array();
if($result -> num_rows >0){
	while($row =$result -> fetch_ assoc()){
	array_push($response,$row);

	}
}
$conn->close();
header('Content-Type :application/json');
echo json_encode($response);
?>