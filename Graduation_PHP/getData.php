<?php

header("Access-Control-Allow-Origin: *");

$db = mysqli_connect("localhost", "root", "", "Graduation");
if (!$db){
    echo 'Error Connecting to Database';
}

$sql = "SELECT * FROM graduation.appointments";
$stmt = $db->prepare($sql);
$stmt->execute();
$app = $stmt->get_result();
$data = $app->fetch_all(MYSQLI_ASSOC);

echo json_encode($data);