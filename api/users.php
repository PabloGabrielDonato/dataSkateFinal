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
    $email = $_POST['email'];
    $nombre = ucwords(strtolower($_POST['nombre']));
    $apellido = ucwords(strtolower($_POST['apellido']));
    $cuit = $_POST['cuit'];
    $acceso = $_POST['acceso'];
}


switch ($opcion) {
    case 0:
        // Carga la tabla

        $sql = "SELECT users.dni, users.nombre, users.apellido, users.email, clubs.institucion, users.estadoacceso, users.acceso, users.id  FROM users, clubs WHERE users.cuit=clubs.cuit;";
        $result = mysqli_query($conexion, $sql);

        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        echo json_encode($arreglo);
        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];
        $sql = "SELECT users.*, DATE_FORMAT(users.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(users.fechamod, '%d/%m/%Y') AS newfechamod, clubs.institucion FROM users, clubs WHERE users.cuit=clubs.cuit AND users.id=$id";
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
        $estadoacceso = $_POST['estadoacceso'];
        $dnimod = $user['dni'];
        $nombremod = $user['nombre'];
        $apellidomod = $user['apellido'];
        $cuitmod = $user['cuit'];
        $institucionmod = $user['institucion'];
        $fechamod = date('Y-m-d');

        if (isset($id)) {

            $sql = "UPDATE users SET  nombre = '$nombre', apellido = '$apellido', email='$email', acceso = '$acceso', cuit = '$cuit', estadoacceso = '$estadoacceso', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod'   WHERE users.id = $id;";

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
            $recicledtabla = 'Usuarios';

            //Guardar el usuario a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
                (SELECT users.dni AS recicleddni FROM users WHERE users.id= $id),
                (SELECT users.nombre AS reciclednombre FROM users WHERE users.id= $id),
                (SELECT users.apellido AS recicledapellido FROM users WHERE users.id= $id),
                (SELECT clubs.institucion AS recicledinstitucion FROM clubs, users WHERE clubs.cuit=users.cuit AND users.id= $id), '$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";

            // Borra al Usuario de la tabla
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM `users` WHERE `users`.`id` = $id;";

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
        $password = $_POST['password'];
        $confirmPassword = $_POST['confirm_password'];
        $estadoacceso = 'DESBLOQUEADO';
        $fechalata = date('Y-m-d');
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        // Verifica si el Usuario esta duplicado
        $sentenciaSQL = $conn->prepare("SELECT * FROM users WHERE dni=:dni");
        $sentenciaSQL->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
        $sentenciaSQL->execute();
        $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

        //SI NO EXISTE USUARIO LO REGISTRA
        if ($numeroRegistros == 0) {

            $sql = "INSERT INTO users (`nombre`, `apellido`, `email`, `acceso`, `cuit`, `dni`, `password`, `estadoacceso`, `dnialta`, `nombrealta`, `apellidoalta`, `cuitalta`, `institucionalta`, `fechaalta`) VALUES ('$nombre', '$apellido','$email' , '$acceso', '$cuit', '$dni', '$password', '$estadoacceso','$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta');";

            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('El usuario no pudo registrarse!');
            };
        } else {
            echo json_encode('El usuario ya existe');
        };
        break;

    case 5:
        //ELIMINAR TODOS LOS USUARIOS
        $password = $_GET['password'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Usuarios';
        //Guardar el usuario a ELIMINAR en la tabla RECICLED

        if ($password == $user['password']) {
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT users.dni, users.nombre, users.apellido, clubs.institucion,'$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM users, clubs WHERE users.cuit=clubs.cuit AND users.dni<>'$dnibaja';";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM users WHERE users.dni<>'$dnibaja';";

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

    case 6:
        // Consulta by ID
        $dni = $_GET['dni'];

        $sql = "SELECT tecnicos.nombretecnico AS nombre, tecnicos.apellidotecnico AS apellido, tecnicos.dnitecnico AS dni, tecnicos.emailtecnico AS email FROM tecnicos WHERE tecnicos.licencia=$dni UNION SELECT delegados.nombre AS nombre, delegados.apellido AS apellido, delegados.dni AS dni, delegados.email AS email FROM delegados WHERE delegados.dni=$dni";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;
}
mysqli_close($conexion);
