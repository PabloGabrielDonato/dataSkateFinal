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

// Recibe los datos y realiza l aconsulta

$podioanual = $_POST['podiosanuales'];

$sql = "SELECT institucion, SUM(puntosclub) AS puntosclub, podioanual FROM podios WHERE podioanual='$podioanual' GROUP BY institucion, podioanual ORDER BY puntosclub DESC";

$result = mysqli_query($conexion, $sql);
$datos = array();

while ($fila = mysqli_fetch_array($result)) {
    // array_push($datos, $fila);

    $datos[] = $fila;
}

// return $datos;

echo json_encode($datos);
