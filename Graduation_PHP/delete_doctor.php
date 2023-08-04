<?php

header("Access-Control-Allow-Origin: *");

$db = mysqli_connect("localhost", "root", "", "Graduation");
if (!$db){
    echo 'Error Connecting to Database';
}

   
    $idDoctors = $_POST["IDDOCTORS"];
           
    $sql = "DELETE FROM doctors WHERE idDoctors = '".$idDoctors."';";
    $result = mysqli_query($db, $sql);
 
?>
    
    