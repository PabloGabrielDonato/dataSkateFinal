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
    $institucion = strtoupper($_POST['institucion']);
    $direccion = ucwords(strtolower($_POST['direccion']));
    $localidad = strtoupper($_POST['localidad']);
    $afiliacion = $_POST['afiliaciones'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $web = $_POST['web'];
    if (isset($_POST['cuit'])) {
        $cuit = $_POST['cuit'];
    }
}

switch ($opcion) {
    case 0:
        // Carga la tabla
        $sql = "SELECT clubs.cuit, clubs.institucion, clubs.direccion, clubs.localidad, clubs.tipoafiliacion, clubs.telefono, clubs.email, clubs.web, clubs.id FROM clubs;";

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        echo json_encode($arreglo);
        break;

    case 1:
        // consulta formulario by ID
        $id = $_GET['id'];
        $sql = "SELECT clubs.*, DATE_FORMAT(clubs.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(clubs.fechamod, '%d/%m/%Y') AS newfechamod FROM clubs WHERE clubs.id=$id;";

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 2:
        // Actualiza los datos
        $id = $_POST['id'];
        if (isset($id)) {
            $dnimod = $user['dni'];
            $nombremod = $user['nombre'];
            $apellidomod = $user['apellido'];
            $cuitmod = $user['cuit'];
            $institucionmod = $user['institucion'];
            $fechamod = date('Y-m-d');

            $sql = "UPDATE clubs SET  institucion = '$institucion', direccion = '$direccion', localidad = '$localidad', telefono='$telefono', email='$email', web='$web', tipoafiliacion = '$afiliacion', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE clubs.id = $id;";

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
        // Baja by ID
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $reciclednombre = '-';
        $recicledapellido = '';
        $recicledtabla = 'Club';

        if (isset($_GET['id'])) {
            $id = $_GET['id'];

            //Guardar el dato a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
            (SELECT clubs.cuit AS recicleddni FROM clubs WHERE clubs.id=$id),
            '$reciclednombre',
            '$recicledapellido',
            (SELECT clubs.institucion AS reciclednombre FROM clubs WHERE clubs.id=$id),'$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";

            // Borra de la tabla by ID
            if (mysqli_query($conexion, $sql)) {

                $sql = "DELETE FROM clubs WHERE clubs.id = $id;";

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
        // Altas
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        //Si las pass son iguales hace la consulta a la base de datos para verificar si ya si existe el usuario
        $sentenciaSQL = $conn->prepare("SELECT * FROM clubs WHERE cuit=:cuit");
        $sentenciaSQL->bindParam("cuit", $_POST['cuit'], PDO::PARAM_STR);
        $sentenciaSQL->execute();
        $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario


        //si no existe registra
        if ($numeroRegistros == 0) {

            $sql = "INSERT INTO clubs (`cuit`, `institucion`, `direccion`, `localidad`, `telefono`, `email`, `web`, `tipoafiliacion`, `dnialta`, `nombrealta`, `apellidoalta`, `cuitalta`, `institucionalta`, `fechaalta`) VALUES ('$cuit', '$institucion', '$direccion', '$localidad', '$telefono', '$email', '$web','$afiliacion', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";


            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('El Club no pudo registrarse!');
            };
        } else {
            echo json_encode('El Club ya existe');
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
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT users.dni, users.nombre, users.apellido, clubs.institucion,'$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM users, clubs WHERE users.cuit=clubs.cuit AND users.dni<>'$dnibaja';";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE clubs FROM clubs, users WHERE clubs.cuit<>'$usercuit';";

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
        // CONSULTA REGUISTRO INSTITUCIONES - CLUBS
        $id = $_GET['id'];

        $sql = "SELECT clubs.id, clubs.cuit, clubs.institucion, clubs.direccion, clubs.telefono, clubs.web, clubs.email FROM clubs WHERE clubs.id=$id";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 7:
        // CONSULTA REGUISTRO INSTITUCIONES - TECNICOS
        $id = $_GET['id'];

        $sql = "SELECT tecnicos.nombretecnico, tecnicos.apellidotecnico, tecnicos.licencia, tecnicos.licencia, tecnicos.categoriatecnico, tecnicos.emailtecnico, tecnicos.telefono FROM clubs, tecnicos WHERE (clubs.cuit=tecnicos.cuit1 OR clubs.cuit=tecnicos.cuit2 or clubs.cuit=tecnicos.cuit3)  AND clubs.id=$id";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 8:
        // CONSULTA REGUISTRO INSTITUCIONES - DELEGADOS
        $id = $_GET['id'];

        $sql = "SELECT delegados.nombre, delegados.apellido, delegados.telefono, delegados.email, delegados.tipo FROM delegados, clubs WHERE delegados.cuit = clubs.cuit AND clubs.id=$id";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 9:
        // CONSULTA CANTIDAD DE PATINADORES EMPADRONADOS POR CUIT
        $cuit = $_GET['cuit'];

        $sql = "SELECT patinadores.dnipatinador, clubs.tipoafiliacion FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit AND patinadores.cuit=$cuit GROUP BY patinadores.dnipatinador";
        if ($result = mysqli_query($conexion, $sql)) {
            $patinadoresEmpadronados = mysqli_num_rows($result);
            echo json_encode($patinadoresEmpadronados);
        }

        break;

    case 10:
        // CONSULTA TIPO DE LICENCIAS EMPADRONADAS POR CUIT
        $cuit = $_GET['cuit'];

        $sql = "SELECT patinadores.tipolicencia, COUNT(patinadores.dnipatinador) AS cantidad FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit AND patinadores.cuit=$cuit GROUP BY patinadores.tipolicencia";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);

        break;

    case 11:
        // CONSULTA CANTIDAD DE PATINADORES POR INCRIPTOS EN BUENA FE
        $cuit = $_GET['cuit'];

        $sql = "SELECT buenafe.dnibuenafe, patinadores.cuit FROM buenafe, patinadores WHERE buenafe.dnibuenafe=patinadores.dnipatinador and patinadores.cuit=$cuit GROUP BY buenafe.dnibuenafe";

        if ($result = mysqli_query($conexion, $sql)) {
            $patinadoresInscriptos = mysqli_num_rows($result);
            echo json_encode($patinadoresInscriptos);
        }

        break;

    case 12:
        // CONSULTA CANTIDAD DE PATINADORES POR TORNEO EN BUENA FE
        $cuit = $_GET['cuit'];

        $sql = "SELECT torneo, COUNT(dnibuenafe) AS cantidad, patinadores.cuit FROM buenafe, patinadores WHERE buenafe.dnibuenafe =patinadores.dnipatinador AND patinadores.cuit=$cuit GROUP BY torneo";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);

        break;
}
mysqli_close($conexion);
