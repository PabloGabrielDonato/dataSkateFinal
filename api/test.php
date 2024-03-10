<?php
session_start();

require '../database.php';

date_default_timezone_set("America/Argentina/Buenos_Aires");

$id = $_GET['id'];
$opcion = $_GET['opcion'];

switch ($opcion) {
    case 0:
        $sql = "SELECT clubs.id, clubs.cuit, clubs.institucion, tecnicos.nombretecnico, tecnicos.apellidotecnico, tecnicos.licencia FROM clubs, tecnicos WHERE clubs.cuit=tecnicos.cuit AND clubs.id=$id";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;
}
mysqli_close($conexion);
