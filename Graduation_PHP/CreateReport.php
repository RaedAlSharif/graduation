<?php

header("Access-Control-Allow-Origin: *");

$db = mysqli_connect("localhost", "root", "", "Graduation");
if (!$db){
    echo 'Error Connecting to Database';
}

    $idDocter = $_POST["idDoctors"];
    $idPatient = $_POST["idPatients"];
    $content = $_POST["CONTENT"];
    
    $sql2 = "SELECT * FROM graduation.reports";
     $result2 = mysqli_query($db, $sql2);
     
 if ($result2->num_rows > 0) {
  // output data of each row
  while($row = $result2->fetch_assoc()) {
      if($row['idPatients'] == $idPatient && $row['idDoctors'] == $idDocter){
          $sql = ("UPDATE reports SET Content = '".$content."' WHERE idPatients = '".$idPatient."' AND idDoctors = '".$idDocter."'");
          $result = mysqli_query($db, $sql);
      }
  }
  }
 
    $sql = "INSERT INTO graduation.reports(`idDoctors` , `idPatients`,`Content`) VALUES ( '".$idDocter."' , '".$idPatient."'  ,  '".$content."')";
    $result = mysqli_query($db, $sql);
 
?>  