<?php
$serverName = "PING";
$connectionInfo= array(
    "Database"=> "",
    // "UID"=>"",
    // "PWD"=>"p",
    // "CharacterSet" => "UTF-8"
    "Trusted_Connection"=>true
);

$conn=sqlsrv_connect($serverName,$connectionInfo);
if(!$conn){
    die(json_encode(["error"=>"Connection Failed"]));
}