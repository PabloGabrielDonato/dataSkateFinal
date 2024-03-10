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
        // $posicion = 0;
        $observaciones = $_POST['observaciones'];
        if (isset($_POST['libroTorneo'])) {
            $fechaTorneo = $_POST['fechaTorneo'];
            $horaTorneo = $_POST['horaTorneo'];
            $ordenSalida = $_POST['ordenSalida'];
            $podioTorneo = $_POST['podio'];
            $puntospatinador = $_POST['puntosPatinador'];
            $puntosclub = $_POST['puntosClub'];
        } else {
            $divisional = $_POST['divisional'];
            $eficiencia = $_POST['eficiencia'];
            $categoria = $_POST['categoria'];
            $disciplina = $_POST['disciplina'];
            $apagar = $_POST['apagar'];
            $pagado = $_POST['pagado'];
            $torneo = $_POST['torneo'];
        }
    }
}

switch ($opcion) {
    case 0:
        // GESTION BUENA FE
        // Consulta de todos los patinadores del padron según Administradores o según Usuarios
        $cuit = $user['cuit'];

        if ($user['acceso'] != 'administrador') {

            $sql = "SELECT
            buenafe.dnibuenafe,
            IFNULL(patinadores.sexopatinador, '**') AS sexopatinador,
            IFNULL(
                patinadores.apellidopatinador,
                '**'
            ) AS apellidopatinador,
            IFNULL(
                patinadores.nombrepatinador,
                '**EMPADRONAR**'
            ) AS nombrepatinador,
            IFNULL(
                DATE_FORMAT(
                    patinadores.fechanacpatinador,
                    '%d-%m-%Y'
                ),
                '**'
            ) AS fechanacimiento,
            IFNULL(
                YEAR(CURDATE()) - YEAR(patinadores.fechanacpatinador),
                '**') AS edad,
            buenafe.disciplina,
            buenafe.divisional,
            buenafe.eficiencia,
            buenafe.categoria,
            IFNULL(patinadores.tipolicencia, '**') AS tipolicencia,
            buenafe.torneo,
            IFNULL(
                    clubs.institucion,
                    buenafe.institucionalta
                ) AS institucion,
            IFNULL(buenafe.observaciones, '') AS observaciones,
            buenafe.id,
            torneo.estadotorneo,
            buenafe.estado,
            buenafe.programa1
            FROM
                buenafe
            LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON buenafe.dnialta = users.dni
            LEFT JOIN torneo ON buenafe.torneo = torneo.nombretorneo
            WHERE (patinadores.cuit=$cuit OR buenafe.cuitalta=$cuit) AND (estadotorneo = 'Abierto' OR estadotorneo = 'Cerrado') ORDER BY buenafe.torneo, buenafe.disciplina, buenafe.programa1";
        } else {

            $sql = "SELECT
            buenafe.dnibuenafe,
            IFNULL(patinadores.sexopatinador, '**') AS sexopatinador,
            IFNULL(
                patinadores.apellidopatinador,
                '**'
            ) AS apellidopatinador,
            IFNULL(
                patinadores.nombrepatinador,
                '**EMPADRONAR**'
            ) AS nombrepatinador,
            IFNULL(
                DATE_FORMAT(
                    patinadores.fechanacpatinador,
                    '%d-%m-%Y'
                ),
                '**'
            ) AS fechanacimiento,
            IFNULL(
                YEAR(CURDATE()) - YEAR(patinadores.fechanacpatinador),
                '**') AS edad,
            buenafe.disciplina,
            buenafe.divisional,
            buenafe.eficiencia,
            buenafe.categoria,
            IFNULL(patinadores.tipolicencia, '**') AS tipolicencia,
            FORMAT(buenafe.apagar, 2) AS apagar,
            FORMAT(buenafe.pagado, 2) AS pagado,
            buenafe.torneo,
            IFNULL(
                    clubs.institucion,
                    buenafe.institucionalta
                ) AS institucion,
            IFNULL(buenafe.observaciones, '') AS observaciones,
            buenafe.id,
            buenafe.estado,
            buenafe.programa1,
            buenafe.id_combinada
            FROM
                buenafe
            LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON buenafe.dnialta = users.dni ORDER BY buenafe.torneo, buenafe.disciplina, buenafe.programa1";
        }

        $result = mysqli_query($conexion, $sql);

        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }

        // echo json_encode($arreglo);

        if (!isset($arreglo["data"])) {
            echo json_encode($fila);
        } else {
            echo json_encode($arreglo);
        }

        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT buenafe.*,  DATE_FORMAT(buenafe.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(buenafe.fechamod, '%d/%m/%Y') AS newfechamod, IFNULL(patinadores.nombrepatinador,'**SIN EMPADRONAR PREVIAMENTE**') AS nombrepatinador, IFNULL(patinadores.apellidopatinador,'') AS apellidopatinador, patinadores.fechanacpatinador, IFNULL(DATE_FORMAT(patinadores.fechanacpatinador, '%d/%m/%Y'),'**') AS fechanacimiento, IFNULL(YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador),'**') AS edad, IFNULL(patinadores.tipolicencia,'**') AS tipolicencia, IFNULL(patinadores.sexopatinador,'**') AS sexopatinador, clubs.institucion, clubs.cuit FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe=patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit=clubs.cuit WHERE buenafe.id=$id";

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 2:
        //Actualiza by ID
        $programa1 = $_POST['programa1_2'];
        $estado = $_POST['estado'];

        $dnimod = $user['dni'];
        $nombremod = $user['nombre'];
        $apellidomod = $user['apellido'];
        $cuitmod = $user['cuit'];
        $institucionmod = $user['institucion'];
        $fechamod = date('Y-m-d');

        //acutaliza la tabla PATINADORES
        // Si actualiza desde el libro torneo o de Gestion Buena Fe

        if (isset($_POST['libroTorneo'])) {
            $sql = "UPDATE buenafe SET fechatorneo='$fechaTorneo', horatorneo='$horaTorneo', ordensalida='$ordenSalida', podiotorneo='$podioTorneo', puntospatinador='$puntospatinador', puntosclub='$puntosclub', observaciones = '$observaciones', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE buenafe.id = $id;";
        } else {
            $sql = "UPDATE buenafe SET divisional='$divisional', eficiencia='$eficiencia', categoria = '$categoria', disciplina = '$disciplina', programa1 = '$programa1',torneo = '$torneo', observaciones = '$observaciones', apagar = '$apagar', pagado = '$pagado', estado='$estado', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE buenafe.id = $id;";
        }
        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('Las modificaiones NO pudieron registrarse!');
        }

        break;

    case 3:
        // Baja by ID

        // if (!empty($_GET['id'])) {
        //     $id = $_GET['id'];
        // }
        if (!empty($_GET['id_combinada'])) {
            $id_combinada = $id = $_GET['id_combinada'];
        } else {
            $id = $_GET['id'];
        }

        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Buena Fe';

        //Guardar el usuario a ELIMINAR en la tabla RECICLED
        if (empty($id_combinada)) {
            $sql = "INSERT INTO recicled(recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) 
            VALUES (
                    (SELECT buenafe.dnibuenafe AS recicleddni FROM buenafe WHERE buenafe.id=$id),
            (SELECT IFNULL(patinadores.nombrepatinador,'**EMPADRONAR**') AS reciclednombre FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe=patinadores.dnipatinador WHERE buenafe.id=$id),
            (SELECT IFNULL(patinadores.apellidopatinador,'**') AS recicledapellido FROM buenafe LEFT JOIN patinadores ON buenafe.     dnibuenafe=patinadores.dnipatinador WHERE buenafe.id=$id),
            (SELECT IFNULL(clubs.institucion,buenafe.institucionalta) AS institucion FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe=patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit=clubs.cuit LEFT JOIN users ON buenafe.dnialta = users.dni where buenafe.id=$id),'$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";
        } else if (!empty($id_combinada)) {
            $sql = "INSERT INTO recicled(recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) 
            VALUES (
                    (SELECT buenafe.dnibuenafe AS recicleddni FROM buenafe WHERE buenafe.id_combinada='$id_combinada' GROUP BY buenafe.id_combinada),
            (SELECT IFNULL(patinadores.nombrepatinador,'**EMPADRONAR**') AS reciclednombre FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe=patinadores.dnipatinador WHERE buenafe.id_combinada='$id_combinada' GROUP BY buenafe.id_combinada),
            (SELECT IFNULL(patinadores.apellidopatinador,'**') AS recicledapellido FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe=patinadores.dnipatinador WHERE buenafe.id_combinada='$id_combinada' GROUP BY buenafe.id_combinada),
            (SELECT IFNULL(clubs.institucion,buenafe.institucionalta) AS institucion FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe=patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit=clubs.cuit LEFT JOIN users ON buenafe.dnialta = users.dni where buenafe.id_combinada='$id_combinada' GROUP BY buenafe.id_combinada),'$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";
        }

        if (mysqli_query($conexion, $sql)) {
            //borra el reguistro en la tabala especificada
            if (empty($id_combinada)) { //elimina registro by ID
                $sql = "DELETE FROM buenafe WHERE buenafe.id = $id;";
            } else if (!empty($id_combinada)) { //elimina registro by id_combinada
                $sql = "DELETE FROM buenafe WHERE buenafe.id_combinada = '$id_combinada';";
            }

            $query = mysqli_query($conexion, $sql);
            echo json_encode('1');
        } else {
            echo json_encode('El patinador no pudo eliminarse!');
        };

        break;


    case 4:
        //Agrega Patinador 

        $dni = $_POST['dni'];
        $dni = $_POST['dni'];
        $programa1 = $_POST['programa1_2'];
        $programa2 = $_POST['programa2_2'];

        $estado = 'ACTIVO';
        $funcion = 'Patinador'; // dato fijo para el campo FUNCION
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');
        $posicion = 0;
        $puntospatinador = 0;
        $puntosclub = 0;
        $ordensalida = 0;
        $podiotorneo = 0;
        $idAleatorio = rand(1, 1000);

        if (!empty($_POST['dni'])) {
            $sentenciaSQL = $conn->prepare("SELECT * FROM buenafe WHERE dnibuenafe=:dni  AND divisional=:divisional AND eficiencia=:eficiencia AND categoria=:categoria AND disciplina=:disciplina AND torneo=:torneo");
            $sentenciaSQL->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("divisional", $_POST['divisional'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("eficiencia", $_POST['eficiencia'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("categoria", $_POST['categoria'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("disciplina", $_POST['disciplina'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("torneo", $_POST['torneo'], PDO::PARAM_STR);
            $sentenciaSQL->execute();
            $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

            if ($numeroRegistros == 0) {

                if (empty($programa1) || empty($programa2)) {
                    $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, posicion, apagar, pagado, torneo, ordensalida, podiotorneo,puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni','$divisional', '$eficiencia',  '$categoria', '$disciplina', '$posicion', '$apagar', '$pagado', '$torneo', '$ordensalida', '$podiotorneo', '$puntospatinador', '$puntosclub', '$estado','$observaciones', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

                    if (mysqli_query($conexion, $sql)) {
                        echo json_encode('1');
                        break;
                    } else {
                        echo json_encode('El patinador no pudo registrarse!');
                        break;
                    }
                } else {
                    $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, id_combinada, posicion, apagar, pagado, torneo, ordensalida, podiotorneo,puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni','$divisional', '$eficiencia',  '$categoria', '$disciplina', CONCAT('$idAleatorio', 'buenafe') ,'$posicion', '$apagar', '$pagado', '$torneo', '$ordensalida', '$podiotorneo', '$puntospatinador', '$puntosclub', '$estado','$observaciones', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

                    if (mysqli_query($conexion, $sql)) {
                        $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, id_combinada, posicion, apagar, pagado, torneo, ordensalida, podiotorneo,puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni','$divisional', '$eficiencia',  '$categoria', '$disciplina', '$programa1', CONCAT('$idAleatorio', 'buenafe'), '$posicion', '$apagar', '$pagado', '$torneo', '$ordensalida', '$podiotorneo', '$puntospatinador', '$puntosclub', '$estado','$observaciones', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

                        if (mysqli_query($conexion, $sql)) {
                            $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, id_combinada, posicion, apagar, pagado, torneo, ordensalida, podiotorneo,puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni','$divisional', '$eficiencia',  '$categoria', '$disciplina', '$programa2', CONCAT('$idAleatorio', 'buenafe'), '$posicion', '$apagar', '$pagado', '$torneo', '$ordensalida', '$podiotorneo', '$puntospatinador', '$puntosclub', '$estado','$observaciones', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";
                            if (mysqli_query($conexion, $sql)) {
                                echo json_encode('1');
                            } else {
                                echo json_encode('El Programa 2 no pudo registrarse!');
                            }
                        } else {
                            echo json_encode('El Programa 1 no pudo registrarse!');
                        }
                    } else {
                        echo json_encode('El patinador no pudo registrarse!');
                    }
                }
                break;
            } else {
                echo json_encode('El patinador/a ya existe para la Categoria, Diciplina y Torneo que intenta registrar!');
            };
        }

        break;

    case 5:
        //ELIMINAR TODOS LOS USUARIOS
        $cuit = $_GET['cuit'];
        $torneo = $_GET['torneo'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Buena Fe';
        //Guardar el usuario a ELIMINAR en la tabla RECICLED

        if ($torneo == 0 && $cuit == 0) {
            //BORRA TODOS los datos en tabla BUENA FE
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, otro, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT buenafe.dnibuenafe, patinadores.nombrepatinador, patinadores.apellidopatinador, clubs.institucion,'$recicledtabla', buenafe.torneo ,'$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM buenafe, patinadores, clubs WHERE buenafe.dnibuenafe=patinadores.dnipatinador and patinadores.cuit=clubs.cuit;";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM buenafe;";
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        } else if ($torneo != 0 && $cuit != 0) {
            // BORRA TORNEO E INSTITUCION SELECCIONADA
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, otro, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT buenafe.dnibuenafe, patinadores.nombrepatinador, patinadores.apellidopatinador, clubs.institucion, '$recicledtabla', buenafe.torneo ,'$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit WHERE patinadores.cuit=$cuit AND buenafe.torneo='$torneo';";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE buenafe.* FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit WHERE patinadores.cuit=$cuit AND buenafe.torneo='$torneo';";
                $query = mysqli_query($conexion, $sql);
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        } else if ($torneo != 0 && $cuit == 0) {
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, otro, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT buenafe.dnibuenafe, patinadores.nombrepatinador, patinadores.apellidopatinador, clubs.institucion, '$recicledtabla', buenafe.torneo ,'$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit WHERE buenafe.torneo='$torneo';";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE buenafe.* FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit WHERE buenafe.torneo='$torneo';";
                $query = mysqli_query($conexion, $sql);
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        } else if ($torneo == 0 && $cuit != 0) {
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, otro, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
            SELECT buenafe.dnibuenafe, patinadores.nombrepatinador, patinadores.apellidopatinador, clubs.institucion, '$recicledtabla', buenafe.torneo ,'$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit WHERE patinadores.cuit=$cuit;";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE buenafe.* FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit WHERE patinadores.cuit=$cuit;";
                $query = mysqli_query($conexion, $sql);
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        }
        break;

    case 6:
        // Consulta by DNI
        $dni = $_GET['dni'];
        if ($user['acceso'] != 'administrador') {
            $sql = "SELECT
            patinadores.*,
            YEAR(CURDATE()) - YEAR(patinadores.fechanacpatinador) AS edad,
            IFNULL(
                DATE_FORMAT(
                    patinadores.fechanacpatinador,
                    '%d-%m-%Y'
                ),
                '**'
            ) AS fechanacimiento,
            clubs.institucion,
            patinadores.cuit,
            users.cuit
        FROM
            patinadores,
            clubs,
            users
        WHERE
            (patinadores.cuit = clubs.cuit AND patinadores.dnipatinador = $dni) AND (patinadores.cuit = users.cuit)";

            $result = mysqli_query($conexion, $sql);
            // creal el array con los datos del ciente
            $datos = array();
            while ($fila = mysqli_fetch_array($result)) {
                array_push($datos, $fila);
            }
        } else {
            $sql = "SELECT patinadores.*, YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador) AS edad, IFNULL(DATE_FORMAT(patinadores.fechanacpatinador, '%d-%m-%Y'),'**') AS fechanacimiento, clubs.institucion FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit AND patinadores.dnipatinador=$dni";

            $result = mysqli_query($conexion, $sql);
            // creal el array con los datos del ciente
            $datos = array();
            while ($fila = mysqli_fetch_array($result)) {
                array_push($datos, $fila);
            }
        }

        if (!empty($datos)) {
            echo json_encode($datos);
        } else {
            echo json_encode('0');
        }
        break;

    case 7:
        //MUEVE TODOS LOS REGISTROS A LA TABLA HBUENAFE (HistoricoBuenFe) - ARCHIVADO
        $torneoArchivar = $_GET['torneoArchivar'];
        if ($torneoArchivar == 0) {

            $sql = "SELECT buenafe.* FROM buenafe JOIN torneo ON buenafe.torneo=torneo.nombretorneo WHERE torneo.estadotorneo='Terminado'";
            if ($result = mysqli_query($conexion, $sql)) {
                $cantidadTorneos = mysqli_num_rows($result);
            }

            if ($cantidadTorneos > 0) {
                $sql = "INSERT INTO hbuenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod) SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1,apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod  FROM buenafe;";

                if (mysqli_query($conexion, $sql)) {
                    $sql = "DELETE buenafe FROM buenafe JOIN torneo ON buenafe.torneo=torneo.nombretorneo WHERE torneo.estadotorneo='Terminado'";
                    mysqli_query($conexion, $sql);
                    $sql = "UPDATE torneo SET estadotorneo = 'Archivado' WHERE estadotorneo='Terminado';";
                    mysqli_query($conexion, $sql);
                    echo json_encode('1');
                } else {
                    echo json_encode('No se pudo mover los datos al archivo!');
                };
            } else {
                echo json_encode('No hay torneos para archivar');
            };
        } else {
            $sql = "INSERT INTO hbuenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod) SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod  FROM buenafe WHERE buenafe.torneo='$torneoArchivar';";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM buenafe WHERE buenafe.torneo='$torneoArchivar';";
                mysqli_query($conexion, $sql);
                $sql = "UPDATE torneo SET estadotorneo = 'Archivado' WHERE torneo.nombretorneo = '$torneoArchivar';";
                mysqli_query($conexion, $sql);
                echo json_encode('1');
            } else {
                echo json_encode('No se pudo mover los datos al archivo!');
            };
        }

        break;
    case 8:
        // LIBRO TORNEO
        //  Consulta by ID según Administradores o según Usuarios
        $cuit = $user['cuit'];

        if ($user['acceso'] != 'administrador') {

            $sql = "SELECT
            IFNULL(
                patinadores.apellidopatinador,
                '**'
            ) AS apellidopatinador,
            IFNULL(
                patinadores.nombrepatinador,
                '**EMPADRONAR**'
            ) AS nombrepatinador,
            buenafe.dnibuenafe,
            IFNULL(
                DATE_FORMAT(
                    patinadores.fechanacpatinador,
                    '%d-%m-%Y'
                ),
                '**'
            ) AS fechanacimiento,
            IFNULL(
                YEAR(CURDATE()) - YEAR(patinadores.fechanacpatinador),
                '**') AS edad,
            buenafe.torneo,
            IFNULL(
                    clubs.institucion,
                    buenafe.institucionalta
                ) AS institucion,
            buenafe.ordensalida,
            IFNULL(DATE_FORMAT(buenafe.fechatorneo,'%d-%m-%Y'),'Fecha sin definir') AS fechatorneo,
            IFNULL(buenafe.horatorneo, 'Hora sin asignar') AS horatorneo,
            buenafe.podiotorneo,
            concat_ws(' - ', buenafe.disciplina, buenafe.divisional, buenafe.eficiencia, buenafe.categoria, patinadores.sexopatinador, buenafe.horatorneo) AS nivel,
            IFNULL(buenafe.observaciones, '') AS observaciones,
            buenafe.disciplina,
            buenafe.divisional,
            buenafe.eficiencia,
            buenafe.categoria,
            IFNULL(buenafe.puntospatinador,0) AS puntospatinador,
            IFNULL(buenafe.puntosclub,0) AS puntosclub,
            buenafe.id,
            torneo.estadotorneo,
            buenafe.estado
            FROM
                buenafe
            LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON buenafe.dnialta = users.dni
            LEFT JOIN torneo ON buenafe.torneo = torneo.nombretorneo
            WHERE (patinadores.cuit=$cuit OR buenafe.cuitalta=$cuit) AND estadotorneo = 'Abierto' AND WHERE buenafe.estado='ACTIVO'";
        } else {

            $sql = "SELECT
            IFNULL(
                patinadores.apellidopatinador,
                '**'
            ) AS apellidopatinador,
            IFNULL(
                patinadores.nombrepatinador,
                '**EMPADRONAR**'
            ) AS nombrepatinador,
            buenafe.dnibuenafe,
            IFNULL(
                DATE_FORMAT(
                    patinadores.fechanacpatinador,
                    '%d-%m-%Y'
                ),
                '**'
            ) AS fechanacimiento,
            IFNULL(
                YEAR(CURDATE()) - YEAR(patinadores.fechanacpatinador),
                '**') AS edad,
            buenafe.torneo,
            IFNULL(
                    clubs.institucion,
                    buenafe.institucionalta
                ) AS institucion,
            buenafe.ordensalida,
            IFNULL(DATE_FORMAT(buenafe.fechatorneo,'%d-%m-%Y'),'Fecha sin definir') AS fechatorneo,
            IFNULL(buenafe.horatorneo, 'Hora sin asignar') AS horatorneo,
            buenafe.podiotorneo,
            concat_ws(' - ' , buenafe.disciplina, buenafe.divisional, buenafe.eficiencia, buenafe.categoria, buenafe.programa1,patinadores.sexopatinador, buenafe.horatorneo) AS nivel,
            IFNULL(buenafe.observaciones, '') AS observaciones,
            buenafe.disciplina,
            buenafe.divisional,
            buenafe.eficiencia,
            buenafe.categoria,
            buenafe.estado,
            IFNULL(buenafe.puntospatinador,0) AS puntospatinador,
            IFNULL(buenafe.puntosclub,0) AS puntosclub,
            buenafe.id            
            FROM
                buenafe
            LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON buenafe.dnialta = users.dni WHERE buenafe.estado='ACTIVO' ORDER BY nivel";
        }

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        if (!isset($arreglo["data"])) {
            echo json_encode($fila);
        } else {
            echo json_encode($arreglo);
        }

        break;

    case 9:
        // LISTA TORNEO 
        // // Consulta de todos los patinadores según Administradores o según Usuarios
        $cuit = $user['cuit'];

        if ($user['acceso'] != 'administrador') {

            $sql = "SELECT
            buenafe.dnibuenafe,
            IFNULL(patinadores.sexopatinador, '**') AS sexopatinador,
            IFNULL(
                patinadores.apellidopatinador,
                '**'
            ) AS apellidopatinador,
            IFNULL(
                patinadores.nombrepatinador,
                '**EMPADRONAR**'
            ) AS nombrepatinador,
            IFNULL(
                DATE_FORMAT(
                    patinadores.fechanacpatinador,
                    '%d-%m-%Y'
                ),
                '**'
            ) AS fechanacimiento,
            IFNULL(
                YEAR(CURDATE()) - YEAR(patinadores.fechanacpatinador),
                '**') AS edad,
            buenafe.disciplina,
            buenafe.divisional,
            buenafe.eficiencia,
            buenafe.categoria,
            IFNULL(patinadores.tipolicencia, '**') AS tipolicencia,
            buenafe.torneo,
            IFNULL(
                    clubs.institucion,
                    buenafe.institucionalta
                ) AS institucion,
            concat_ws(' - ', buenafe.disciplina, buenafe.divisional, buenafe.eficiencia, buenafe.categoria) AS nivel,
            disciplinas.ordendisciplina,
            divisional.ordendivisional,
            eficiencia.ordeneficiencia,
            categorias.ordencategoria,
            buenafe.id,
            torneo.estadotorneo,
            buenafe.estado,
            buenafe.programa1
            FROM
                buenafe
            LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON buenafe.dnialta = users.dni
            LEFT JOIN divisional ON buenafe.divisional = divisional.divisional
            LEFT JOIN eficiencia ON buenafe.eficiencia = eficiencia.eficiencia
            LEFT JOIN categorias ON buenafe.categoria = categorias.categoria
            LEFT JOIN disciplinas ON buenafe.disciplina = disciplinas.disciplina
            LEFT JOIN torneo ON buenafe.torneo = torneo.nombretorneo
            WHERE (patinadores.cuit=$cuit OR buenafe.cuitalta=$cuit) AND estadotorneo='Abierto' AND buenafe.estado='ACTIVO' ORDER BY patinadores.sexopatinador, apellidopatinador";
        } else {
            $sql = "SELECT
            buenafe.dnibuenafe,
            IFNULL(patinadores.sexopatinador, '**') AS sexopatinador,
            IFNULL(
                patinadores.apellidopatinador,
                '**'
            ) AS apellidopatinador,
            IFNULL(
                patinadores.nombrepatinador,
                '**EMPADRONAR**'
            ) AS nombrepatinador,
            IFNULL(
                DATE_FORMAT(
                    patinadores.fechanacpatinador,
                    '%d-%m-%Y'
                ),
                '**'
            ) AS fechanacimiento,
            IFNULL(
                YEAR(CURDATE()) - YEAR(patinadores.fechanacpatinador),
                '**') AS edad,
            buenafe.disciplina,
            buenafe.divisional,
            buenafe.eficiencia,
            buenafe.categoria,
            IFNULL(patinadores.tipolicencia, '**') AS tipolicencia,
            buenafe.torneo,
            IFNULL(
                    clubs.institucion,
                    buenafe.institucionalta
                ) AS institucion,
            concat_ws(' - ', buenafe.disciplina, buenafe.divisional, buenafe.eficiencia, buenafe.categoria) AS nivel,
            disciplinas.ordendisciplina,
            divisional.ordendivisional,
            eficiencia.ordeneficiencia,
            categorias.ordencategoria,
            buenafe.id,
            buenafe.estado,
            buenafe.programa1
            FROM
                buenafe
            LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON buenafe.dnialta = users.dni
            LEFT JOIN divisional ON buenafe.divisional = divisional.divisional
            LEFT JOIN eficiencia ON buenafe.eficiencia = eficiencia.eficiencia
            LEFT JOIN categorias ON buenafe.categoria = categorias.categoria
            LEFT JOIN disciplinas ON buenafe.disciplina = disciplinas.disciplina
            WHERE buenafe.estado='ACTIVO' ORDER BY buenafe.torneo, patinadores.sexopatinador, apellidopatinador";
        }

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }

        // echo json_encode($arreglo);

        if (!isset($arreglo["data"])) {
            echo json_encode($fila);
        } else {
            echo json_encode($arreglo);
        }
        break;

    case 10:
        // Lista cronograma del torneo
        if ($user['acceso'] == 'administrador') {
            $sql = "SELECT
            buenafe.torneo,
            COUNT(buenafe.categoria) AS cantidad,
            CONCAT_WS(
                ' - ',
                buenafe.torneo,
                buenafe.disciplina,
                buenafe.divisional,
                buenafe.eficiencia,
                buenafe.categoria
            ) AS grupo,
            CONCAT_WS(
                ' - ',
                buenafe.disciplina,
                buenafe.divisional,
                buenafe.eficiencia,
                buenafe.categoria
            ) AS nivel,
            buenafe.disciplina,
            buenafe.divisional,
            buenafe.eficiencia,
            buenafe.categoria,
            torneo.estadotorneo,
            buenafe.estado
        FROM
            buenafe
        LEFT JOIN torneo ON buenafe.torneo = torneo.nombretorneo
        WHERE
            estadotorneo <> 'Terminado' AND buenafe.estado='ACTIVO'
        GROUP BY
            grupo
        ORDER BY
            torneo;";
        };

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }

        // echo json_encode($arreglo);

        if (!isset($arreglo["data"])) {
            echo json_encode($fila);
        } else {
            echo json_encode($arreglo);
        }
        break;
}
mysqli_close($conexion);
