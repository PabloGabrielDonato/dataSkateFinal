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
if (isset($_POST['opcion'])) {
    $opcion = $_POST['opcion'];
    if ($opcion == 2 || $opcion == 4) {
        $id = $_POST['id'];
        $categoria = $_POST['categoria'];
        $disciplina = $_POST['disciplina'];
        $apagar = $_POST['apagar'];
        $torneo = $_POST['torneo'];
        $posicion = $_POST['posicion'];
        // $posicion = 0;
        $observaciones = $_POST['observaciones'];
    }
}

switch ($opcion) {
    case 0:
        // Consulta de todos los patinadores del padron
        $cuit = $user['cuit'];

        if ($user['acceso'] != 'administrador') {
            $sql = "SELECT hbuenafe.*, users.nombre AS nombrealta, users.apellido AS apellidoalta, IFNULL(patinadores.nombrepatinador,'**EMPADRONAR**') AS nombrepatinador, IFNULL(patinadores.apellidopatinador,'**') AS apellidopatinador, IFNULL(DATE_FORMAT(patinadores.fechanacpatinador, '%d-%m-%Y'),'**') AS fechanacimiento, IFNULL(YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador),'**') AS edad, IFNULL(patinadores.tipolicencia,'**') AS tipolicencia, IFNULL(patinadores.sexopatinador,'**') AS sexopatinador, IFNULL(clubs.institucion,hbuenafe.institucionalta) AS institucion FROM hbuenafe LEFT JOIN patinadores ON hbuenafe.dnibuenafe=patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit=clubs.cuit LEFT JOIN users ON hbuenafe.dnialta = users.dni WHERE patinadores.cuit=$cuit or hbuenafe.cuitalta=$cuit";
        } else {
            $sql = "SELECT hbuenafe.*, users.nombre AS nombrealta, users.apellido AS apellidoalta, IFNULL(patinadores.nombrepatinador,'**EMPADRONAR**') AS nombrepatinador, IFNULL(patinadores.apellidopatinador,'**') AS apellidopatinador, IFNULL(DATE_FORMAT(patinadores.fechanacpatinador, '%d-%m-%Y'),'**') AS fechanacimiento, IFNULL(YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador),'**') AS edad, IFNULL(patinadores.tipolicencia,'**') AS tipolicencia, IFNULL(patinadores.sexopatinador,'**') AS sexopatinador, IFNULL(clubs.institucion,hbuenafe.institucionalta) AS institucion FROM hbuenafe LEFT JOIN patinadores ON hbuenafe.dnibuenafe=patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit=clubs.cuit LEFT JOIN users ON hbuenafe.dnialta = users.dni";
        }

        $result = mysqli_query($conexion, $sql);
        // creal el array con los datos del ciente
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        // convierte el array en formato Json
        echo json_encode($datos);
        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT hbuenafe.*, DATE_FORMAT(hbuenafe.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(hbuenafe.fechamod, '%d/%m/%Y') AS newfechamod, IFNULL(patinadores.nombrepatinador,'**SIN EMPADRONAR PREVIAMENTE**') AS nombrepatinador, IFNULL(patinadores.apellidopatinador,'') AS apellidopatinador, patinadores.fechanacpatinador, IFNULL(DATE_FORMAT(patinadores.fechanacpatinador, '%d/%m/%Y'),'**') AS fechanacimiento, IFNULL(YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador),'**') AS edad, IFNULL(patinadores.tipolicencia,'**') AS tipolicencia, IFNULL(patinadores.sexopatinador,'**') AS sexopatinador, clubs.institucion, clubs.cuit FROM hbuenafe LEFT JOIN patinadores ON hbuenafe.dnibuenafe=patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit=clubs.cuit WHERE hbuenafe.id=$id";

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 2:
        //Actualiza by ID
        break;

    case 3:
        // Baja by ID
        break;

    case 4:
        //Agrega Patinador 
        break;

    case 5:
        //ELIMINAR archivo
        $torneo = $_GET['torneo'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Archivo Buena Fe';
        //Guardar el usuario a ELIMINAR en la tabla RECICLED

        if ($torneo == 0) {
            //BORRA TODO
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, otro, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT hbuenafe.dnibuenafe, patinadores.nombrepatinador, patinadores.apellidopatinador, clubs.institucion,  '$recicledtabla', hbuenafe.torneo, '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM hbuenafe, patinadores, clubs WHERE hbuenafe.dnibuenafe=patinadores.dnipatinador and patinadores.cuit=clubs.cuit;";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM hbuenafe ;";
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        } else {
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, otro, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT hbuenafe.dnibuenafe, patinadores.nombrepatinador, patinadores.apellidopatinador, clubs.institucion, '$recicledtabla', hbuenafe.torneo, '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM hbuenafe, patinadores, clubs WHERE hbuenafe.torneo='$torneo';";

            if (mysqli_query($conexion, $sql)) {
                $sql = " DELETE FROM hbuenafe WHERE hbuenafe.torneo='$torneo';";
                $query = mysqli_query($conexion, $sql);
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        }
        break;
}
mysqli_close($conexion);
