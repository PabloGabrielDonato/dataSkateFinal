<?php

session_start();
require '../database.php';
date_default_timezone_set("America/Argentina/Buenos_Aires");

if (isset($_SESSION['user_id'])) {

    $records = $conn->prepare('SELECT users.*, clubs.institucion, clubs.cuit FROM users, clubs WHERE users.cuit = clubs.cuit AND users.id= :id');

    $records->bindParam(':id', $_SESSION['user_id']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $user = null;

    if (count($results) > 0) {
        $user = $results;
    } else {
        header("Location: ../index.php");
    }
}

// verifica si el usuario esta logeado
if (!isset($user)) {
    header("Location: ../index.php");
}

if (isset($_GET['opcion'])) {
    $opcion = $_GET['opcion'];
}

switch ($opcion) {
    case 0:
        // lectura de los datos en la tabla
        $sql = "SELECT * FROM ingresos;";

        $result = mysqli_query($conexion, $sql);

        // creal el array con los datos del ciente
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);

        break;

    case 1:
        // borra datos de la tabal recicled segun el año de baja
        $yearbaja = $_GET['yearbaja'];

        if ($yearbaja == 0) {
            $sql = "DELETE FROM ingresos;";
            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('No se pudo borrar los reguistros!!');
            };
        } else {
            $sql = "DELETE FROM ingresos WHERE EXTRACT(YEAR FROM ingresos.fechaingreso)=$yearbaja;";
            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('No se pudo borrar los reguistros!!');
            }
        }

        break;
}
mysqli_close($conexion);
