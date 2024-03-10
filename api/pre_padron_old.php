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
        $fechanacimiento = $_POST['fechanacimiento'];
        $nacionalidad = ucwords(strtolower($_POST['nacionalidad']));
        $nombre = ucwords(strtolower($_POST['nombre']));
        $apellido = ucwords(strtolower($_POST['apellido']));
        $sexo = $_POST['sexo'];
        $telefono = $_POST['telefono'];
        $email = $_POST['email'];
        $domicilio = ucwords(strtolower($_POST['domicilio']));
        $localidad = strtoupper($_POST['localidad']);
        $partido = ucwords(strtolower($_POST['partido']));
        $cp = $_POST['cp'];
        $provincia = ucwords(strtolower($_POST['provincia']));
        $cuit = $_POST['cuit']; //institucion
        $licencia = $_POST['licencia'];
        $nombrepadre = ucwords(strtolower($_POST['nombrePadre']));
        $dnipadre = $_POST['dniPadre'];
        $nombremadre = ucwords(strtolower($_POST['nombreMadre']));
        $dnimadre = $_POST['dniMadre'];

        // $funcion = 'Patinador';
    }
}

switch ($opcion) {
    case 0:
        $cuit = $user['cuit'];

        if ($user['acceso'] != 'administrador') {
            $sql = "SELECT prepatinadores.apellidopatinador, prepatinadores.nombrepatinador, prepatinadores.dnipatinador, DATE_FORMAT(prepatinadores.fechanacpatinador, '%d-%m-%Y') AS fechanacpatinador, YEAR(CURDATE())-YEAR(prepatinadores.fechanacpatinador) AS edad, prepatinadores.sexopatinador, prepatinadores.nacionalidadpatinador, prepatinadores.domiciliopatinador, prepatinadores.provinciapatinador, prepatinadores.localidadpatinador, prepatinadores.cppatinador, prepatinadores.funcionpatinador, prepatinadores.tipolicencia, prepatinadores.telefonopatinador, clubs.institucion, clubs.tipoafiliacion, prepatinadores.id  FROM prepatinadores, clubs WHERE prepatinadores.cuit=$cuit AND clubs.cuit=$cuit";
        } else {
            $sql = "SELECT prepatinadores.apellidopatinador, prepatinadores.nombrepatinador, prepatinadores.dnipatinador, DATE_FORMAT(prepatinadores.fechanacpatinador, '%d-%m-%Y') AS fechanacpatinador, YEAR(CURDATE())-YEAR(prepatinadores.fechanacpatinador) AS edad, prepatinadores.sexopatinador, prepatinadores.nacionalidadpatinador, prepatinadores.domiciliopatinador, prepatinadores.provinciapatinador, prepatinadores.localidadpatinador, prepatinadores.cppatinador, prepatinadores.funcionpatinador, prepatinadores.tipolicencia, prepatinadores.telefonopatinador, clubs.institucion, clubs.tipoafiliacion, prepatinadores.id  FROM prepatinadores, clubs WHERE prepatinadores.cuit=clubs.cuit";
        }

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        if (empty($arreglo)) {
            echo json_encode($array = [
                "apellidopatinador" => "-",
                "nombrepatinador" => "-",
                "dnipatinador" => "-",
                "fechanacpatinador" => "-",
                "edad" => "-",
                "sexopatinador" => "-",
                "nacionalidadpatinador" => "-",
                "domiciliopatinador" => "-",
                "provinciapatinador" => "-",
                "localidadpatinador" => "-",
                "cppatinador" => "-",
                "funcionpatinador" => "-",
                "tipolicencia" => "-",
                "telefonopatinador" => "-",
                "institucion" => "-",
                "tipoafiliacion" => "-",
                "id" => "-",
            ]);
        } else {
            echo json_encode($arreglo);
        }

        // echo json_encode($arreglo);

        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT prepatinadores.*, YEAR(CURDATE())-YEAR(prepatinadores.fechanacpatinador) AS edad, DATE_FORMAT(prepatinadores.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(prepatinadores.fechamod, '%d/%m/%Y') AS newfechamod, clubs.institucion FROM prepatinadores, clubs WHERE prepatinadores.cuit=clubs.cuit AND prepatinadores.id=$id";

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }

        echo json_encode($datos);
        break;

    case 2:
        //Actualiza by ID
        $valorLicencia = $_POST['valorLicencia'];

        $dnimod = $user['dni'];
        $nombremod = $user['nombre'];
        $apellidomod = $user['apellido'];
        $cuitmod = $user['cuit'];
        $institucionmod = $user['institucion'];
        $fechamod = date('Y-m-d');

        if ($sexo == 'F') {
            $funcion = "Patinadora";
        } else if ($sexo == 'M') {
            $funcion = "Patinador";
        } else {
            $funcion = "Binario";
        }

        if (isset($id)) {
            //acutaliza la tabla PATINADORES

            $sql = "UPDATE `prepatinadores` SET  `nombrepatinador` = '$nombre', `apellidopatinador`  = '$apellido', `fechanacpatinador` = '$fechanacimiento', `sexopatinador` = '$sexo', `tipolicencia` = '$licencia', `emailpatinador` = '$email', `telefonopatinador` = '$telefono', `domiciliopatinador` = '$domicilio', `nacionalidadpatinador` = '$nacionalidad', `provinciapatinador` = '$provincia', `localidadpatinador` = '$localidad', `cppatinador` = '$cp', `funcionpatinador` = '$funcion', `partidopatinador` = '$partido', `cuit` = '$cuit', `nombrepadre` = '$nombrepadre', `dnipadre` = '$dnipadre', `nombremadre` = '$nombremadre', `dnimadre` = '$dnimadre', `dnimod` = '$dnimod', `nombremod` = '$nombremod', `apellidomod` = '$apellidomod', `cuitmod` = '$cuitmod', `institucionmod` = '$institucionmod', `fechamod` = '$fechamod', `valorLicencia` = '$valorLicencia' WHERE `prepatinadores`.`id` = $id;";

            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('Las modificaiones NO pudieron registrarse!');
            }
        } else {
            echo json_encode('Las modificaiones NO pudieron registrarse!');
        }
        break;

    case 3:
        // Baja by ID
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Pre-Padron';

        if (isset($_GET['id'])) {

            $id = $_GET['id'];

            //Guardar el patinador a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled(recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
            (SELECT prepatinadores.dnipatinador AS recicleddni FROM prepatinadores, clubs WHERE prepatinadores.id=$id and clubs.cuit=prepatinadores.cuit),
            (SELECT prepatinadores.nombrepatinador AS reciclednombre FROM prepatinadores, clubs WHERE prepatinadores.id=$id and clubs.cuit=prepatinadores.cuit),
            (SELECT prepatinadores.apellidopatinador AS recicledapellido FROM prepatinadores, clubs WHERE prepatinadores.id=$id and clubs.cuit=prepatinadores.cuit),
            (SELECT clubs.institucion AS recicledinstitucion FROM prepatinadores, clubs WHERE prepatinadores.id=$id and clubs.cuit=prepatinadores.cuit), '$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";


            if (mysqli_query($conexion, $sql)) {
                //borra el reguistro en la tabala especificada
                $sql = "DELETE FROM prepatinadores WHERE prepatinadores.id = $id;";
                $query = mysqli_query($conexion, $sql);
                echo json_encode('1');
            } else {
                echo json_encode('El patinador no pudo eliminarse!');
            };
        } else {
            echo json_encode('El patinador no pudo eliminarse!');
        }
        break;

    case 4:
        //Ingresa Patinador 
        $valorLicencia = $_POST['valorLicencia'];

        $dni = $_POST['dni'];
        $funcion = 'Patinador'; // dato fijo para el campo FUNCION
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        if ($sexo == 'F') {
            $funcion = "Patinadora";
        } else if ($sexo == 'M') {
            $funcion = "Patinador";
        } else {
            $funcion = "Binario";
        }


        if (!empty($_POST['dni'])) {

            // $sentenciaSQL = $conn->prepare("SELECT * FROM prepatinadores WHERE dnipatinador=:dni");
            $sentenciaSQL = $conn->prepare("SELECT prepatinadores.dnipatinador FROM prepatinadores WHERE prepatinadores.dnipatinador=:dni UNION SELECT patinadores.dnipatinador FROM patinadores WHERE patinadores.dnipatinador=:dni");
            $sentenciaSQL->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
            $sentenciaSQL->execute();
            $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

            //SI NO EXISTE USUARIO LO REGISTRA
            if ($numeroRegistros == 0) {
                $dni = $_POST['dni'];

                $sql = "INSERT INTO prepatinadores (dnipatinador, fechanacpatinador, nombrepatinador, apellidopatinador, sexopatinador, tipolicencia, emailpatinador, telefonopatinador, domiciliopatinador, nacionalidadpatinador, provinciapatinador, localidadpatinador, cppatinador, funcionpatinador, partidopatinador, valorLicencia, nombrepadre, dnipadre, nombremadre, dnimadre, cuit, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni', '$fechanacimiento', '$nombre', '$apellido', '$sexo', '$licencia', '$email', '$telefono', '$domicilio', '$nacionalidad', '$provincia', '$localidad', '$cp', '$funcion', '$partido', '$valorLicencia', '$nombrepadre', '$dnipadre', '$nombremadre', '$dnimadre', '$cuit', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

                //verifica si se creo el usuario correctamente o no y muestra mensage
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('El patinador no pudo registrarse!');
                }
            } else {
                echo json_encode('El patinador ya existe!');
            }
        }
        break;

    case 5:
        // MUEVE LOS DATOS DEL PREPADRON AL PADRON
        $cuit = $user['cuit'];

        // CONSULTA SI HAY DATOS CON LICENCIA VACIOS
        $sql = "SELECT prepatinadores.dnipatinador, prepatinadores.tipolicencia FROM prepatinadores WHERE (prepatinadores.tipolicencia='' OR prepatinadores.tipolicencia=NULL) AND prepatinadores.cuit=$cuit;";
        $result = mysqli_query($conexion, $sql);
        $licenciaVacia = mysqli_num_rows($result);
        // SI NO HAY DATO DE LICENCIAS VACIAS INICIA EL PROCESO
        if ($licenciaVacia == 0) {
            // INSERTA LOS DATOS DE PREPATINADORES EN LA TABLA PATINADORES SEGUN EL CUIT
            $sql = "INSERT INTO patinadores SELECT * FROM prepatinadores WHERE prepatinadores.cuit = $cuit";
            if (mysqli_query($conexion, $sql)) {
                // INSERTA LOS DATOS DE PREPATINADORES EN LA TABLA CTA CTE SEGUN EL CUIT
                $sql = "INSERT INTO ctacte (cuit, tipo_comprobante, fecha_alta, concepto, adeudado, pagado, dnipatinador, tipolicencia,dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta) SELECT cuit, 'Ticket', fechaalta, 'LICENCIAS', valorLicencia, '0', dnipatinador, tipolicencia, dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta FROM prepatinadores WHERE prepatinadores.cuit = $cuit";
                if (mysqli_query($conexion, $sql)) {
                    // BORRA LOS DATOS DE LA TABLA PATINADORES SEGUN EL CUIT
                    $sql = "DELETE FROM prepatinadores WHERE prepatinadores.cuit = $cuit";
                    if (mysqli_query($conexion, $sql)) {
                        echo json_encode('1');
                    } else {
                        echo json_encode('No pudo eliminarse los patinadores del Padron Provisorio!');
                    };
                } else {
                    echo json_encode('No se pudo generar la deuda en Cta Cte!');
                };
            } else {
                echo json_encode('No se pudo reguistrar los patinadores en el padron!');
            };
        } else {
            echo json_encode('Hay patinadores que no tienen establecida su licecia. Por favor completar!');
        };


        break;

    case 6:
        // SUMA LOS VALORES DE LICENCIA DEL PADRON PROVISORIO PARA MOSTRAR EN PANTALLA
        $cuit = $user['cuit'];
        if ($user['acceso'] != 'administrador') {
            $sql = "SELECT FORMAT(SUM(prepatinadores.valorLicencia),2) AS valorLicencia FROM prepatinadores WHERE prepatinadores.cuit=$cuit GROUP BY prepatinadores.cuit";
        } else {
            $sql = "SELECT FORMAT(SUM(prepatinadores.valorLicencia),2) AS valorLicencia FROM prepatinadores";
        }

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }

        echo json_encode($datos);

        break;
}
mysqli_close($conexion);
