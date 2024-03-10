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
    $dni = $_POST['dni'];
    $nombre = ucwords(strtolower($_POST['nombre']));
    $apellido = ucwords(strtolower($_POST['apellido']));
    $fechaNacimiento = $_POST['fechaNacimiento'];
    $funcion = strtoupper($_POST['funcion']);
    $sexo = $_POST['sexo'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $cuit1 = $_POST['cuit1'];
    $cuit2 = $_POST['cuit2'];
    $cuit3 = $_POST['cuit3'];
    $especialidad = strtoupper($_POST['especialidad']);
    $categoria = strtoupper($_POST['categoria']);

    // echo 'CUIT1:' . $cuit1 . ' ';
    // echo 'CUIT2:' . $cuit2 . ' ';
    // echo 'CUIT3:' . $cuit3 . ' ';
}


switch ($opcion) {
    case 0:
        // Carga la tabla

        $sql = "SELECT tecnicos.dnitecnico, tecnicos.apellidotecnico, tecnicos.nombretecnico, tecnicos.sexotecnico, DATE_FORMAT(tecnicos.fechanactecnico, '%d/%m/%Y') AS newfechanactecnico, IFNULL(TIMESTAMPDIFF(YEAR,fechanactecnico,CURDATE()),'-') AS edadtecnico, tecnicos.licencia, tecnicos.funciontecnico, tecnicos.telefono, tecnicos.emailtecnico, tecnicos.especialidadtecnico, tecnicos.categoriatecnico, tecnicos.id_tecnicos, (SELECT clubs.institucion FROM clubs WHERE clubs.cuit = tecnicos.cuit1) AS institucion1, (SELECT clubs.institucion FROM clubs WHERE clubs.cuit = tecnicos.cuit2) AS institucion2, (SELECT clubs.institucion FROM clubs WHERE clubs.cuit = tecnicos.cuit3) AS institucion3 FROM tecnicos";

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        echo json_encode($arreglo);
        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];
        $sql = "SELECT tecnicos.* , DATE_FORMAT(tecnicos.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(tecnicos.fechamod, '%d/%m/%Y') AS newfechamod, IFNULL(TIMESTAMPDIFF(YEAR,fechanactecnico,CURDATE()),'-') AS edadtecnico FROM tecnicos WHERE tecnicos.id_tecnicos=$id;";
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

        if (isset($id)) {
            $sql = "UPDATE tecnicos SET  funciontecnico= '$funcion', sexotecnico='$sexo', apellidotecnico = '$apellido', nombretecnico = '$nombre', fechanactecnico='$fechaNacimiento' , dnitecnico='$dni', emailtecnico = '$email', especialidadtecnico='$especialidad', telefono='$telefono', categoriatecnico='$categoria', cuit1='$cuit1', cuit2='$cuit2', cuit3='$cuit3', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE tecnicos.id_tecnicos = $id;";

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
            $recicledtabla = 'Tecnicos';

            //Guardar el usuario a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
                (SELECT tecnicos.licencia AS recicleddni FROM tecnicos WHERE tecnicos.id_tecnicos= $id),
                (SELECT tecnicos.nombretecnico AS reciclednombre FROM tecnicos WHERE tecnicos.id_tecnicos= $id),
                (SELECT tecnicos.apellidotecnico AS recicledapellido FROM tecnicos WHERE tecnicos.id_tecnicos= $id),
                '$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";

            //     // Borra al Usuario de la tabla
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM tecnicos WHERE tecnicos.id_tecnicos = $id;";

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
        $licencia = $_POST['licencia'];
        $fechalata = date('Y-m-d');
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        // Verifica si el Usuario esta duplicado
        $sentenciaSQL = $conn->prepare("SELECT * FROM tecnicos WHERE licencia=:licencia");
        $sentenciaSQL->bindParam("licencia", $_POST['licencia'], PDO::PARAM_STR);
        $sentenciaSQL->execute();
        $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

        // SI NO EXISTE USUARIO LO REGISTRA
        if ($numeroRegistros == 0) {

            $sql = "INSERT INTO tecnicos (`licencia`, `funciontecnico`, `sexotecnico`, `apellidotecnico`, `nombretecnico`, `fechanactecnico`, `dnitecnico`, `emailtecnico`, `telefono`, `especialidadtecnico`, `categoriatecnico`, `cuit1`, `cuit2`, `cuit3`, `dnialta`, `nombrealta`, `apellidoalta`, `cuitalta`, `institucionalta`, `fechaalta`) VALUES ('$licencia', '$funcion', '$sexo',  '$apellido', '$nombre', '$fechaNacimiento', '$dni', '$email', '$telefono', '$especialidad', '$categoria', '$cuit1', '$cuit2', '$cuit3', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta');";

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
            SELECT tecnicos.licencia, tecnicos.nombretecnico, tecnicos.apellidotecnico,'$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', '$fechabaja' FROM tecnicos;";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM tecnicos;";

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
