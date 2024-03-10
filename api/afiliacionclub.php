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
        header("Location: /newproyect_lepa/index.php");
    }
}

// verifica si el usuario esta logeado
if (!isset($user)) {
    header("Location: /newproyect_lepa/index.php");
}

if (isset($_GET['opcion'])) {
    $opcion = $_GET['opcion'];
}

if (isset($_POST['opcion'])) {
    $opcion = $_POST['opcion'];
    $afiliacion = $_POST['afiliacion'];
}

switch ($opcion) {
    case 0:
        // consulta SQL
        $sql = "SELECT afiliacionclub.tipoafiliacion, afiliacionclub.id FROM afiliacionclub;";
        $result = mysqli_query($conexion, $sql);

        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        echo json_encode($arreglo);
        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT *, DATE_FORMAT(afiliacionclub.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(afiliacionclub.fechamod, '%d/%m/%Y') AS newfechamod  FROM afiliacionclub where afiliacionclub.id = $id";
        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 2:
        // Actualiza los datos by ID
        $id = $_POST['id'];
        if (isset($id)) {
            $dnimod = $user['dni'];
            $nombremod = $user['nombre'];
            $apellidomod = $user['apellido'];
            $cuitmod = $user['cuit'];
            $institucionmod = $user['institucion'];
            $fechamod = date('Y-m-d');

            $sql = "UPDATE afiliacionclub SET tipoafiliacion = '$afiliacion', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE afiliacionclub.id = $id;";

            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('0');
            }
        } else {
            echo json_encode('0');
        }
        break;

    case 3:
        // Eliminar by ID
        $id = $_GET['id'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Afiliacion Club';

        if (isset($id)) {
            //Guardar el usuario a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
                    (SELECT afiliacionclub.id FROM afiliacionclub WHERE afiliacionclub.id=$id),
                    (SELECT afiliacionclub.tipoafiliacion FROM afiliacionclub WHERE afiliacionclub.id=$id),'$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";

            //borra el reguistro en la tabala especificada
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM afiliacionclub WHERE afiliacionclub.id = $id;";
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('0');
                };
            } else {
                echo json_encode('0');
            };
        } else {
            echo json_encode('0');
        };
        break;

    case 4:
        // Altas
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        // Verifica si existe la categoria
        $sentenciaSQL = $conn->prepare("SELECT * FROM afiliacionclub WHERE afiliacionclub.tipoafiliacion=:afiliacion");
        $sentenciaSQL->bindParam("afiliacion", $_POST['afiliacion'], PDO::PARAM_STR);
        $sentenciaSQL->execute();
        $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

        //si no existe registra
        if ($numeroRegistros == 0) {

            $sql = "INSERT INTO afiliacionclub (tipoafiliacion, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$afiliacion', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('La Disciplina no pudo registrarse!');
            };
        } else {
            echo json_encode('La Disciplina ya existe');
        };
        break;

    case 5:
        //ELIMINAR TODOS
        $password = $_GET['password'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $usercuit = $user['cuit'];
        $recicledtabla = 'Afiliacion Club';

        //Guardar el usuario a ELIMINAR en la tabla RECICLED
        if ($password == $user['password']) {
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
                SELECT afiliacionclub.id, afiliacionclub.tipoafiliacion,'$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM afiliacionclub;";

            // Elimina todos los datotos de la tabla
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM afiliacionclub;";

                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('No se pudo borrar las Licencias');
                };
            } else {
                echo json_encode('No se pudo borrar las Licencias');
            };
        } else {
            echo json_encode('Las passwords no coinciden');
        }
        break;
}
mysqli_close($conexion);
