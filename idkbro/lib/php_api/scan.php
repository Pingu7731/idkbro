<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include ("config.php");

$code=$_POST['code']??'';
if(!$code){
    echo json_encode(["error"=> "No code Received"]);
    exit;
}

$sql ="INSERT INTO ScanLogs (CodeValue,ScanTime) VALUES (?, GETDATE())";
$params=[$code];
$stmt=sqlsrv_query($conn,$sql,$params);


if ($stmt) {
    echo json_encode(["success" => true, "code" => $code]);
} else {
    echo json_encode(["error" => "Insert failed"]);
}


