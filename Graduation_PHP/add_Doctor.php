<?php

header("Access-Control-Allow-Origin: *");

$db = mysqli_connect("localhost", "root", "", "Graduation");
if (!$db){
    echo 'Error Connecting to Database';
}

    $name = $_POST["NAME"];
    $surname = $_POST["SURNAME"];
    $idDoctors = $_POST["IDDOCTORS"];
    $email = $_POST["EMAIL"];
    $speciality = $_POST["SPECIALITY"];
    $password = $_POST["PASSWORD"];
 
           
    $sql = "INSERT INTO graduation.doctors(`idDoctors` , `name`,`surname` ,`email` , `speciality`,`password` ) VALUES ( '".$idDoctors."' , '".$name."'  ,  '".$surname."' , '".$email."' , '".$speciality."'  ,  '".$password."')";
    $result = mysqli_query($db, $sql);
 
?>
    
    