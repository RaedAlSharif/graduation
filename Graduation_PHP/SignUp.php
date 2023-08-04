<?php

header("Access-Control-Allow-Origin: *");

$db = mysqli_connect("localhost", "root", "", "Graduation");
if (!$db){
    echo 'Error Connecting to Database';
}

    $name = $_POST["NAME"];
    $surname = $_POST["SURNAME"];
    $age = $_POST["AGE"];
    $email = $_POST["EMAIL"];
    $phone = $_POST["PHONE"];
    $gender = $_POST["GENDER"];
    $password = $_POST["PASSWORD"];
    $idDocters = $_POST["IDDOCTORS"];
   
    /*
$name = "NAME";
    $surname = ("SURNAME");
    $age = "23";
    $email = ("EMAIL");
    $phone = "02524521";
    $gender = "true";
    $date = ("2020/12/12");
    $time = ("12:12");*/
    
   $id = random_int(1, 99999);
   
           
    $sql = "INSERT INTO graduation.patients(`idPatients` , `name`,`surname`,`email`,`phone`,`gender`,`password`,`age`,`idDoctors`) VALUES "
            . "( '".$id."' , '".$name."'  ,  '".$surname."' , '".$email."'  ,  '".$phone."' ,  '".$gender."'  ,   '".$password."'  , '".$age."'   , '".$idDocters."' )";
    $result = mysqli_query($db, $sql);
 
?>
    
    