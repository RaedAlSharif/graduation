<?php

header("Access-Control-Allow-Origin: *");

$db = mysqli_connect("localhost", "root", "", "Graduation");
if (!$db){
    echo 'Error Connecting to Database';
}

    $date = $_POST["DATE"];
    $time = $_POST["TIME"];
    $idDoctors = $_POST["IDDOCTORS"];
 
           
    $sql = "INSERT INTO graduation.reserved( `idDoctors`, `Time` , `Date`) VALUES ('".$idDoctors."'  , '".$time."'  ,'".$date."'  )";
    $result = mysqli_query($db, $sql);
 
?>
    
    