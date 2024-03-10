<?php
session_start();

require '../../database.php';

// Toma los datos del usuario para mostrar en el encabezado de la pagina
if (isset($_SESSION['user_id'])) {
    $records = $conn->prepare('SELECT users.*, clubs.institucion, clubs.cuit FROM users, clubs WHERE users.cuit = clubs.cuit AND users.id= :id');
    $records->bindParam(':id', $_SESSION['user_id']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $user = null;

    if (count($results) > 0) {
        $user = $results;
    }
    $valorCuit = $user['cuit'];


    // ==== CONSULTA EL ESTADO DEL PADRON (ABIERTO o CERRADO)
    $recordsP = $conn->prepare('SELECT * FROM estadopadron');
    $recordsP->execute();
    $results1 = $recordsP->fetch(PDO::FETCH_ASSOC);

    $estado = null;

    if (count($results1) > 0) {
        $estado = $results1;
    }
}



// verifica si el usuario esta logeado
if (!isset($user)) {
    header("Location: index.php");
}
