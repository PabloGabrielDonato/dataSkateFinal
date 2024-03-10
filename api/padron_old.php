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

        // $pagoLicencia = $_POST['pagoLicencia'];
        $funcion = 'Patinador';
    }
}

switch ($opcion) {
    case 0:
        $cuit = $user['cuit'];

        if ($user['acceso'] != 'administrador') {

            $sql = "SELECT patinadores.apellidopatinador, patinadores.nombrepatinador, patinadores.dnipatinador, DATE_FORMAT(patinadores.fechanacpatinador, '%d-%m-%Y') AS fechanacpatinador, YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador) AS edad, patinadores.sexopatinador, patinadores.nacionalidadpatinador, patinadores.domiciliopatinador, patinadores.provinciapatinador, patinadores.localidadpatinador, patinadores.cppatinador, patinadores.funcionpatinador, patinadores.tipolicencia, patinadores.telefonopatinador, clubs.institucion, clubs.tipoafiliacion, patinadores.id  FROM patinadores, clubs WHERE patinadores.cuit=$cuit AND clubs.cuit=$cuit";

            $result = mysqli_query($conexion, $sql);
            while ($fila = mysqli_fetch_array($result)) {
                $arreglo["data"][] = $fila;
            }
            if (!isset($arreglo["data"])) {
                echo json_encode($fila);
            } else {
                echo json_encode($arreglo);
            }
        } else {
            // Consulta de todos los patinadores del padron

            $sql = "SELECT patinadores.apellidopatinador, patinadores.nombrepatinador, patinadores.dnipatinador, DATE_FORMAT(patinadores.fechanacpatinador, '%d-%m-%Y') AS fechanacpatinador, YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador) AS edad, patinadores.sexopatinador, patinadores.nacionalidadpatinador, patinadores.domiciliopatinador, patinadores.provinciapatinador, patinadores.localidadpatinador, patinadores.cppatinador, patinadores.funcionpatinador, patinadores.tipolicencia, patinadores.telefonopatinador, clubs.institucion, clubs.tipoafiliacion, patinadores.id, DATE_FORMAT(patinadores.fechaalta, '%d-%m-%Y') AS fechaalta  FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit";

            $result = mysqli_query($conexion, $sql);
            while ($fila = mysqli_fetch_array($result)) {
                $arreglo["data"][] = $fila;
            }
            if (!isset($arreglo["data"])) {
                echo json_encode($fila);
            } else {
                echo json_encode($arreglo);
            }
        }
        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT patinadores.*, YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador) AS edad, DATE_FORMAT(patinadores.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(patinadores.fechamod, '%d/%m/%Y') AS newfechamod, clubs.institucion FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit AND patinadores.id=$id";

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }

        echo json_encode($datos);
        break;

    case 2:
        //Actualiza by ID
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
            $valorLicencia = $_POST['valorLicencia'];

            $sql = "UPDATE `patinadores` SET  `nombrepatinador` = '$nombre', `apellidopatinador`  = '$apellido', `fechanacpatinador` = '$fechanacimiento', `sexopatinador` = '$sexo', `tipolicencia` = '$licencia', `emailpatinador` = '$email', `telefonopatinador` = '$telefono', `domiciliopatinador` = '$domicilio', `nacionalidadpatinador` = '$nacionalidad', `provinciapatinador` = '$provincia', `localidadpatinador` = '$localidad', `cppatinador` = '$cp', `funcionpatinador` = '$funcion', `partidopatinador` = '$partido', `cuit` = '$cuit', `nombrepadre` = '$nombrepadre', `dnipadre` = '$dnipadre', `nombremadre` = '$nombremadre', `dnimadre` = '$dnimadre', `dnimod` = '$dnimod', `nombremod` = '$nombremod', `apellidomod` = '$apellidomod', `cuitmod` = '$cuitmod', `institucionmod` = '$institucionmod', `fechamod` = '$fechamod', `valorLicencia` = '$valorLicencia'  WHERE `patinadores`.`id` = $id;";

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
        $recicledtabla = 'Padron';

        if (isset($_GET['id'])) {

            $id = $_GET['id'];

            //Guardar el patinador a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled(recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
            (SELECT patinadores.dnipatinador AS recicleddni FROM patinadores, clubs WHERE patinadores.id=$id and clubs.cuit=patinadores.cuit),
            (SELECT patinadores.nombrepatinador AS reciclednombre FROM patinadores, clubs WHERE patinadores.id=$id and clubs.cuit=patinadores.cuit),
            (SELECT patinadores.apellidopatinador AS recicledapellido FROM patinadores, clubs WHERE patinadores.id=$id and clubs.cuit=patinadores.cuit),
            (SELECT clubs.institucion AS recicledinstitucion FROM patinadores, clubs WHERE patinadores.id=$id and clubs.cuit=patinadores.cuit), '$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";


            if (mysqli_query($conexion, $sql)) {
                //borra el reguistro en la tabala especificada
                $sql = "DELETE FROM patinadores WHERE patinadores.id = $id;";
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

            $sentenciaSQL = $conn->prepare("SELECT * FROM patinadores WHERE dnipatinador=:dni");
            $sentenciaSQL->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
            $sentenciaSQL->execute();
            $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

            //SI NO EXISTE USUARIO LO REGISTRA
            if ($numeroRegistros == 0) {
                $dni = $_POST['dni'];

                $sql = "INSERT INTO patinadores (dnipatinador, fechanacpatinador, nombrepatinador, apellidopatinador, sexopatinador, tipolicencia, emailpatinador, telefonopatinador, domiciliopatinador, nacionalidadpatinador, provinciapatinador, localidadpatinador, cppatinador, funcionpatinador, partidopatinador, valorLicencia, nombrepadre, dnipadre, nombremadre, dnimadre, cuit, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni', '$fechanacimiento', '$nombre', '$apellido', '$sexo', '$licencia', '$email', '$telefono', '$domicilio', '$nacionalidad', '$provincia', '$localidad', '$cp', '$funcion', '$partido', '$valorLicencia', '$nombrepadre', '$dnipadre', '$nombremadre', '$dnimadre', '$cuit', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

                //verifica si se creo el usuario correctamente o no y muestra mensage
                if (mysqli_query($conexion, $sql)) {
                    // inserta la dueda de la inscripción en la Cta Cte
                    $sql = "INSERT INTO ctacte (cuit, tipo_comprobante, fecha_alta, concepto, adeudado, pagado, dnipatinador, tipolicencia) VALUES ('$cuit', 'Ticket', '$fechaalta', 'LICENCIAS', '$valorLicencia', '0', '$dni', '$licencia')";

                    if (mysqli_query($conexion, $sql)) {
                        echo json_encode('1');
                    } else {
                        echo json_encode('El patinador no pudo registrarse!');
                    }
                } else {
                    echo json_encode('El patinador no pudo registrarse!');
                }
            } else {
                echo json_encode('El patinador ya existe!');
            }
        }
        break;

    case 5:
        //ELIMINAR TODOS LOS USUARIOS
        $cuit = $_GET['cuit'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Padron';
        //Guardar el usuario a ELIMINAR en la tabla RECICLED

        if ($cuit == 0) {
            //BORRA TODO
            //Inserta consulta con varios resultados en la tabla RECICLED, en este caso TODOS
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
                    SELECT patinadores.dnipatinador, patinadores.nombrepatinador, patinadores.apellidopatinador, clubs.institucion,'$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit;";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM patinadores;";
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        } else {
            //BORRA SOLO LOS COMPETIDORES DEL CLUB
            //Inserta consulta con varios resultados en la tabla RECICLED, en este caso los coincidentes con el CLUB seleccionado
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
                     SELECT patinadores.dnipatinador, patinadores.nombrepatinador, patinadores.apellidopatinador, clubs.institucion,'$recicledtabla', '$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit and patinadores.cuit=$cuit;";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM patinadores WHERE patinadores.cuit=$cuit;";
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('0');
            }
        }
        break;

    case 6:
        //MUEVE LOS DATOS DE PADRON A LA TABLA PREPADRON

        if ($user['acceso'] == 'administrador') {

            $sql = "SELECT * FROM patinadores";
            $result = mysqli_query($conexion, $sql);
            $patinadores = mysqli_num_rows($result);
            // VERIFICA SI HAY DATOS EN EL PADRON
            if ($patinadores > 0) {
                // BORRA LOS DATOS EN LA TABLA PREPATINADORES
                $sql = "DELETE FROM prepatinadores";
                if (mysqli_query($conexion, $sql)) {
                    // INSERTA LOS DATOS DE PATINADORES EN LA TABLA PREPATINADORES
                    $sql = "INSERT INTO prepatinadores SELECT * FROM patinadores";
                    if (mysqli_query($conexion, $sql)) {
                        // BORRA LAS LICENCIAS Y SU VALOR DE LA TABLA PREPADRON
                        $sql = "UPDATE prepatinadores SET tipolicencia = NULL, valorLicencia = 0;";
                        if (mysqli_query($conexion, $sql)) {
                            // BORRA LOS DATOS DE LA TABLA PATINADORES
                            $sql = "DELETE FROM patinadores";
                            if (mysqli_query($conexion, $sql)) {
                                echo json_encode('1');
                            } else {
                                echo json_encode('No pudo eliminarse los patinadores del Padron');
                            };
                        } else {
                            echo json_encode('No se pudo mover los datos del Padron al Padrón Provisorio');
                        };
                    } else {
                        echo json_encode('No se pudo borrar las lisencias y sus valores del Padron Provisorio');
                    }
                } else {
                    echo json_encode('No se pudo borrar los datos en el Padron Provisorio');
                };
            } else {
                echo json_encode('No hay datos en el PADRON para procesar');
            }
        } else {

            header("Location: ../home.php");
        }

        break;
}
mysqli_close($conexion);
