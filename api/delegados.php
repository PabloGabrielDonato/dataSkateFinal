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
    $nombre = ucwords(strtolower($_POST['nombre']));
    $apellido = ucwords(strtolower($_POST['apellido']));
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $cuit = $_POST['cuit'];
    $tipo = strtoupper($_POST['cargo']);

    // echo 'opcion ' . $opcion . ' ';
    // echo 'nombre ' . $nombre . ' ';
    // echo 'apellido ' . $apellido . ' ';
    // echo 'email ' . $email . ' ';
    // echo 'telefono ' . $telefono . ' ';
    // echo 'cuit ' . $cuit . ' ';
    // echo 'tipo ' . $tipo . ' ';
}


switch ($opcion) {
    case 0:
        // Carga la tabla

        $sql = "SELECT delegados.id, delegados.dni, delegados.nombre, delegados.apellido, delegados.telefono, delegados.tipo, delegados.email, clubs.institucion FROM delegados, clubs WHERE delegados.cuit=clubs.cuit";

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        echo json_encode($arreglo);
        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT delegados.*, DATE_FORMAT(delegados.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(delegados.fechamod, '%d/%m/%Y') AS newfechamod, clubs.cuit FROM delegados, clubs WHERE delegados.cuit=clubs.cuit AND delegados.id=$id";

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
        $dnimod = $user['dni'];
        $nombremod = $user['nombre'];
        $apellidomod = $user['apellido'];
        $cuitmod = $user['cuit'];
        $institucionmod = $user['institucion'];
        $fechamod = date('Y-m-d');

        // echo 'dnimod ' . $dnimod . ' ';
        // echo 'nombremod ' . $nombremod . ' ';
        // echo 'apellidomod ' . $apellidomod . ' ';
        // echo 'cuitmod ' . $cuitmod . ' ';
        // echo 'institucionmod ' . $institucionmod . ' ';
        // echo 'fechamod ' . $fechamod . ' ';

        if (isset($id)) {
            $sql = "UPDATE delegados SET apellido = '$apellido', nombre = '$nombre', email = '$email', telefono='$telefono', tipo='$tipo', cuit='$cuit', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE delegados.id = $id";

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
        // BAJA de Usuarios por ID
        if (isset($_GET['id'])) {
            $id = $_GET['id'];
            $dnibaja = $user['dni'];
            $nombrebaja = $user['nombre'];
            $apellidobaja = $user['apellido'];
            $institucionbaja = $user['institucion'];
            $recicledtabla = 'Delegados';

            //Guardar el usuario a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
                (SELECT delegados.dni AS recicleddni FROM delegados WHERE delegados.id= $id),
                (SELECT delegados.nombre AS reciclednombre FROM delegados WHERE delegados.id= $id),
                (SELECT delegados.apellido AS recicledapellido FROM delegados WHERE delegados.id= $id),
                '$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";

            //     // Borra al Usuario de la tabla
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM delegados WHERE delegados.id = $id;";

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
        }
        break;

    case 4:
        //ALTA usuario
        $dni = $_POST['dni'];

        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        // Verifica si el Usuario esta duplicado
        $sentenciaSQL = $conn->prepare("SELECT * FROM delegados WHERE dni=:dni");
        $sentenciaSQL->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
        $sentenciaSQL->execute();
        $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

        // SI NO EXISTE USUARIO LO REGISTRA
        if ($numeroRegistros == 0) {

            $sql = "INSERT INTO delegados (`dni`, `apellido`, `nombre`, `email`, `telefono`, `tipo`, `cuit`, `dnialta`, `nombrealta`, `apellidoalta`, `cuitalta`, `institucionalta`, `fechaalta`) VALUES ('$dni', '$apellido', '$nombre', '$email', '$telefono', '$tipo', '$cuit', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta');";

            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('El Tecnico no pudo registrarse!');
            };
        } else {
            echo json_encode('El Tecnico ya existe');
        };
        break;

    case 5:
        //ELIMINAR TODOS LOS USUARIOS
        $password = $_GET['password'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Tecnicos';
        $fechabaja = date('Y-m-d');
        //Guardar el usuario a ELIMINAR en la tabla RECICLED

        if ($password == $user['password']) {
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT delegados.dni, delegados.nombre, delegados.apellido,'$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', '$fechabaja' FROM delegados;";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM delegados;";

                // $query = mysqli_query($conexion, $sql);
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
}
mysqli_close($conexion);
