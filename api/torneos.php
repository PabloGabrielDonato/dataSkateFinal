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
    $estadotorneo = $_POST['estadoTorneo'];
    $valor = $_POST['valor'];
}

switch ($opcion) {
    case 0:
        // consulta SQL
        $sql = "SELECT torneo.nombretorneo, FORMAT(torneo.valor,2) AS valor, torneo.estadotorneo, torneo.id FROM torneo;";
        $result = mysqli_query($conexion, $sql);

        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        echo json_encode($arreglo);
        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT torneo.*, DATE_FORMAT(torneo.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(torneo.fechamod, '%d/%m/%Y') AS newfechamod  FROM torneo where id = $id";
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

            $sql = "UPDATE torneo SET estadotorneo = '$estadotorneo', valor='$valor', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE torneo.id = $id;";

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
        $recicledtabla = 'Categorias';

        if (isset($id)) {
            //Guardar el usuario a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
                (SELECT torneo.id FROM torneo WHERE torneo.id=$id),
                (SELECT torneo.nombretorneo FROM torneo WHERE torneo.id=$id),'$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";

            //borra el reguistro en la tabala especificada
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM torneo WHERE torneo.id = $id;";
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
        $torneo = $_POST['torneo'];
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        // Verifica si existe el torneo
        $sentenciaSQL = $conn->prepare("SELECT * FROM torneo WHERE torneo.nombretorneo=:torneo");
        $sentenciaSQL->bindParam("torneo", $_POST['torneo'], PDO::PARAM_STR);
        $sentenciaSQL->execute();
        $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

        //si no existe registra
        if ($numeroRegistros == 0) {

            $sql = "INSERT INTO torneo (nombretorneo, valor, estadotorneo, fechatorneo, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$torneo', '$valor', '$estadotorneo', '', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('El Torneo no pudo registrarse!');
            };
        } else {
            echo json_encode('El Torneo ya existe');
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
        $recicledtabla = 'Usuarios';

        //Guardar el usuario a ELIMINAR en la tabla RECICLED
        if ($password == $user['password']) {
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT torneo.id, torneo.nombretorneo,'$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM torneo;";

            // Elimina todos los datotos de la tabla
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM torneo;";

                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('No se pudo borrar los usuarios');
                };
            } else {
                echo json_encode('No se pudo borrar los usuarios');
            };
        } else {
            echo json_encode('Las passwords no coinciden');
        }
        break;

    case 6:
        // Verifica si hay torneo Abierto para poder cargar
        $sql = "SELECT torneo.estadotorneo FROM torneo WHERE torneo.estadotorneo='Abierto'";
        $result = mysqli_query($conexion, $sql);
        $datos = array();

        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }

        if (empty($datos)) {
            echo json_encode('0');
        } else {
            echo json_encode('1');
        }
        break;

    case 7:
        // consulta valor de torneo para las las INSCRIPCIONES
        $torneo = $_GET['torneo'];
        $sql = "SELECT torneo.valor FROM torneo WHERE torneo.nombretorneo='$torneo'";
        $result = mysqli_query($conexion, $sql);
        $datos = array();

        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }

        echo json_encode($datos);
        break;
}
mysqli_close($conexion);
