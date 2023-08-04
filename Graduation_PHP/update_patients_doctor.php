<?php

header("Access-Control-Allow-Origin: *");

$db = mysqli_connect("localhost", "root", "", "Graduation");
if (!$db){
    echo 'Error Connecting to Database';
}

   
    $idDoctors = $_POST["IDDOCTORS"];
    $idPatient = $_POST["IDPATIENT"];
           
    $sql = "UPDATE patients SET idDoctors = '".$idDoctors."' WHERE idPatients = '".$idPatient."';";
    $result = mysqli_query($db, $sql);
 
?>
    