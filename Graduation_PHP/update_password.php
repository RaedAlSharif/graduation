<?php

header("Access-Control-Allow-Origin: *");

$db = mysqli_connect("localhost", "root", "", "Graduation");
if (!$db){
    echo 'Error Connecting to Database';
}

    $email = $_POST["Email"];
    $new_password = $_POST["NEW_PASS"];
    
     $sql = ("UPDATE patients SET password = '".$new_password."' WHERE email = '".$email."'");
          $result = mysqli_query($db, $sql);
                  ?>