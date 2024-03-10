<?php

// Conexiones PHP local

$server = 'localhost';
$username = 'root';
$password = '';
$database = 'database_rio';


try {
  $conn = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
} catch (PDOException $e) {
  die('Connection Failed: ' . $e->getMessage());
}

// conexion a Base de Datos para el Excel
$con = new mysqli("localhost", "root", "", "database_rio") or die("not connected" . mysqli_connect_error());
mysqli_query($con, "SET SESSION collation_connection ='utf8_unicode_ci'");
$db = mysqli_select_db($con, $database) or die("Upps! Error en conectar a la Base de Datos");

//otra conexion
$conexion = new mysqli("localhost", "root", "", "database_rio") or die("not connected" . mysqli_connect_error());


//hostinger: UTILIZAR ESTAS CONEXIONES

// $server = 'localhost';
// $username = 'u120164435_rio';
// $password = 'Rio_2023';
// $database = 'u120164435_rio';

// try {
//   $conn = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
// } catch (PDOException $e) {
//   die('Connection Failed: ' . $e->getMessage());
// }

// // conexion a Base de Datos para el Excel
// $con = new mysqli("localhost", "u120164435_rio", "Rio_2023", "u120164435_rio") or die("not connected" . mysqli_connect_error());
// mysqli_query($con, "SET SESSION collation_connection ='utf8_unicode_ci'");
// $db = mysqli_select_db($con, $database) or die("Upps! Error en conectar a la Base de Datos");

// //otra conexion
// $conexion = new mysqli("localhost", "u120164435_rio", "Rio_2023", "u120164435_rio") or die("not connected" . mysqli_connect_error());
