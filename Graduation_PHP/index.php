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
    $date = $_POST["DATE"];
    $time = $_POST["TIME"];
     $idDoctors = $_POST["IDDOCTORS"];/*
$name = "NAME";
    $surname = ("SURNAME");
    $age = "23";
    $email = ("EMAIL");
    $phone = "02524521";
    $gender = "true";
    $date = ("2020/12/12");
    $time = ("12:12");*/
    
   $id = random_int(1, 99999);
           
    $sql = "INSERT INTO appointments(`name`,`surname`,`age`,`email`,`phone`,`gender`,`date`,`time`,`ID` , idDoctors) VALUES "
            . "( '".$name."' , '".$surname."'  ,  '".$age."' , '".$email."'  ,  '".$phone."' ,  '".$gender."'  ,   '".$date."'  , '".$time."'   , '".$id."' , '".$idDoctors."' )";
    $result = mysqli_query($db, $sql);
    
    
 
?>
    
    
    

