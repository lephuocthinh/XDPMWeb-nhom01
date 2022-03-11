<?php
$host     = 'localhost';
$database = 'bannuoc';
$user     = 'root';
$password = '';
$data = "mysql:host=$host;dbname=$database;charset=UTF8";
try 
{
    $conn = new PDO($data, $user, $password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
} 
catch (PDOException $e) 
{
     echo $e->getMessage();
}
