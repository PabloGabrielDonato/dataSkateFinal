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
        // if (isset($_POST['libroTorneo'])) {
        //     $fechaTorneo = $_POST['fechaTorneo'];
        //     $horaTorneo = $_POST['horaTorneo'];
        //     $ordenSalida = $_POST['ordenSalida'];
        //     $podioTorneo = $_POST['podio'];
        //     $puntospatinador = $_POST['puntosPatinador'];
        //     $puntosclub = $_POST['puntosClub'];
        // } else {
        $divisional = $_POST['divisional2'];
        $eficiencia = $_POST['eficiencia2'];
        $categoria = $_POST['categoria2'];
        $disciplina = $_POST['disciplina2'];
        $apagar = $_POST['apagar'];
        $pagado = $_POST['pagado'];
        $torneo = $_POST['torneo'];
        // }
    }
}

switch ($opcion) {
    case 0:
        // GESTION BUENA FE
        // Consulta de todos los patinadores del padron según Administradores o según Usuarios
        $cuit = $user['cuit'];

        if ($user['acceso'] != 'administrador') {

            $sql = "SELECT
            prebuenafe.dnibuenafe,
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
            prebuenafe.disciplina,
            prebuenafe.divisional,
            prebuenafe.eficiencia,
            prebuenafe.categoria,
            prebuenafe.programa1,
            prebuenafe.programa2,
            IFNULL(patinadores.tipolicencia, '**') AS tipolicencia,
            prebuenafe.torneo,
            IFNULL(
                    clubs.institucion,
                    prebuenafe.institucionalta
                ) AS institucion,
            IFNULL(prebuenafe.observaciones, '') AS observaciones,
            prebuenafe.id,
            torneo.estadotorneo,
            prebuenafe.estado,
            prebuenafe.apagar
            FROM
                prebuenafe
            LEFT JOIN patinadores ON prebuenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON prebuenafe.dnialta = users.dni
            LEFT JOIN torneo ON prebuenafe.torneo = torneo.nombretorneo
            WHERE (patinadores.cuit=$cuit OR prebuenafe.cuitalta=$cuit) AND estadotorneo = 'Abierto' ORDER BY prebuenafe.torneo";
        } else {

            $sql = "SELECT
            prebuenafe.dnibuenafe,
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
            prebuenafe.disciplina,
            prebuenafe.divisional,
            prebuenafe.eficiencia,
            prebuenafe.categoria,
            IFNULL(patinadores.tipolicencia, '**') AS tipolicencia,
            prebuenafe.torneo,
            IFNULL(
                    clubs.institucion,
                    prebuenafe.institucionalta
                ) AS institucion,
            IFNULL(prebuenafe.observaciones, '') AS observaciones,
            prebuenafe.id,
            torneo.estadotorneo,
            prebuenafe.estado,
            prebuenafe.apagar,
            prebuenafe.programa1,
            prebuenafe.programa2
            FROM
                prebuenafe
            LEFT JOIN patinadores ON prebuenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON prebuenafe.dnialta = users.dni
            LEFT JOIN torneo ON prebuenafe.torneo = torneo.nombretorneo ORDER BY prebuenafe.torneo";
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

        $sql = "SELECT prebuenafe.*,  DATE_FORMAT(prebuenafe.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(prebuenafe.fechamod, '%d/%m/%Y') AS newfechamod, IFNULL(patinadores.nombrepatinador,'**SIN EMPADRONAR PREVIAMENTE**') AS nombrepatinador, IFNULL(patinadores.apellidopatinador,'') AS apellidopatinador, patinadores.fechanacpatinador, IFNULL(DATE_FORMAT(patinadores.fechanacpatinador, '%d/%m/%Y'),'**') AS fechanacimiento, IFNULL(YEAR(CURDATE())-YEAR(patinadores.fechanacpatinador),'**') AS edad, IFNULL(patinadores.tipolicencia,'**') AS tipolicencia, IFNULL(patinadores.sexopatinador,'**') AS sexopatinador, clubs.institucion, clubs.cuit FROM prebuenafe LEFT JOIN patinadores ON prebuenafe.dnibuenafe=patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit=clubs.cuit WHERE prebuenafe.id=$id";

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
        $programa2 = $_POST['programa2_2'];

        $estado = $_POST['estado'];
        $dnimod = $user['dni'];
        $nombremod = $user['nombre'];
        $apellidomod = $user['apellido'];
        $cuitmod = $user['cuit'];
        $institucionmod = $user['institucion'];
        $fechamod = date('Y-m-d');

        //acutaliza la tabla PATINADORES
        // Si actualiza desde el libro torneo o de Gestion Buena Fe
        // if (isset($_POST['libroTorneo'])) {
        //     $sql = "UPDATE prebuenafe SET fechatorneo='$fechaTorneo', horatorneo='$horaTorneo', ordensalida='$ordenSalida', podiotorneo='$podioTorneo', puntospatinador='$puntospatinador', puntosclub='$puntosclub', observaciones = '$observaciones', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE prebuenafe.id = $id;";
        // } else {
        $sql = "UPDATE prebuenafe SET divisional='$divisional', eficiencia='$eficiencia', categoria = '$categoria', disciplina = '$disciplina', programa1='$programa1', programa2='$programa2' ,torneo = '$torneo', observaciones = '$observaciones', apagar = '$apagar', pagado = '$pagado', estado='$estado', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE prebuenafe.id = $id;";
        // }

        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('Las modificaiones NO pudieron registrarse!');
        }

        break;

    case 3:
        // Baja by ID
        $id = $_GET['id'];

        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Inscripcion Provisoria';

        //Guardar el usuario a ELIMINAR en la tabla RECICLED
        $sql = "INSERT INTO recicled(recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) 
        VALUES (
                (SELECT prebuenafe.dnibuenafe AS recicleddni FROM prebuenafe WHERE prebuenafe.id=$id),
        (SELECT IFNULL(patinadores.nombrepatinador,'**EMPADRONAR**') AS reciclednombre FROM prebuenafe LEFT JOIN patinadores ON prebuenafe.dnibuenafe=patinadores.dnipatinador WHERE prebuenafe.id=$id),
        (SELECT IFNULL(patinadores.apellidopatinador,'**') AS recicledapellido FROM prebuenafe LEFT JOIN patinadores ON prebuenafe.dnibuenafe=patinadores.dnipatinador WHERE prebuenafe.id=$id),
        (SELECT IFNULL(clubs.institucion,prebuenafe.institucionalta) AS institucion FROM prebuenafe LEFT JOIN patinadores ON prebuenafe.dnibuenafe=patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit=clubs.cuit LEFT JOIN users ON prebuenafe.dnialta = users.dni where prebuenafe.id=$id),'$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";

        if (mysqli_query($conexion, $sql)) {
            //borra el reguistro en la tabala especificada
            $sql = "DELETE FROM prebuenafe WHERE prebuenafe.id = $id;";
            $query = mysqli_query($conexion, $sql);
            echo json_encode('1');
        } else {
            echo json_encode('0');
        };

        break;


    case 4:
        //Agrega Patinador 
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

        if (!empty($_POST['dni'])) {
            $sentenciaSQL = $conn->prepare("SELECT * FROM prebuenafe WHERE dnibuenafe=:dni  AND divisional=:divisional AND eficiencia=:eficiencia AND categoria=:categoria AND disciplina=:disciplina AND torneo=:torneo UNION SELECT * FROM buenafe WHERE dnibuenafe=:dni  AND divisional=:divisional AND eficiencia=:eficiencia AND categoria=:categoria AND disciplina=:disciplina AND torneo=:torneo");
            $sentenciaSQL->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("divisional", $_POST['divisional2'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("eficiencia", $_POST['eficiencia2'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("categoria", $_POST['categoria2'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("disciplina", $_POST['disciplina2'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("torneo", $_POST['torneo'], PDO::PARAM_STR);
            $sentenciaSQL->execute();
            $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

            if ($numeroRegistros == 0) {

                $sql = "INSERT INTO prebuenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, programa2, posicion, apagar, pagado, torneo, ordensalida, podiotorneo,puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni','$divisional', '$eficiencia',  '$categoria', '$disciplina', '$programa1', '$programa2', '$posicion', '$apagar', '$pagado', '$torneo', '$ordensalida', '$podiotorneo', '$puntospatinador', '$puntosclub', '$estado','$observaciones', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                    break;
                } else {
                    echo json_encode('El patinador no pudo registrarse!');
                }
                break;
            } else {
                echo json_encode('El patinador/a ya existe para la Disciplina, Divisional, Eficiencia, Categoria y Torneo que intenta registrar!');
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
        $cuit = $_GET['cuit'];

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
            clubs.institucion
        FROM
            patinadores,
            clubs
        WHERE
            (
                patinadores.dnipatinador = $dni AND patinadores.cuit = clubs.cuit
            ) AND patinadores.cuit = $cuit";

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
                $sql = "INSERT INTO hbuenafe SELECT * FROM buenafe;";

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
            $sql = "INSERT INTO hbuenafe SELECT * FROM buenafe WHERE buenafe.torneo='$torneoArchivar';";

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
            concat_ws(' - ', buenafe.disciplina, buenafe.divisional, buenafe.eficiencia, buenafe.categoria, buenafe.horatorneo) AS nivel,
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
            concat_ws(' - ' , buenafe.disciplina, buenafe.divisional, buenafe.eficiencia, buenafe.categoria, buenafe.horatorneo) AS nivel,
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
        echo json_encode($arreglo);
        break;

    case 9:
        // LIBRO TORNEO 
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
            buenafe.estado
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
            WHERE (patinadores.cuit=$cuit OR buenafe.cuitalta=$cuit) AND estadotorneo='Abierto' AND buenafe.estado='ACTIVO'";
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
            buenafe.estado
            FROM
                buenafe
            LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON buenafe.dnialta = users.dni
            LEFT JOIN divisional ON buenafe.divisional = divisional.divisional
            LEFT JOIN eficiencia ON buenafe.eficiencia = eficiencia.eficiencia
            LEFT JOIN categorias ON buenafe.categoria = categorias.categoria
            LEFT JOIN disciplinas ON buenafe.disciplina = disciplinas.disciplina
            WHERE buenafe.estado='ACTIVO'";
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

    case 11:
        // SUMA LOS VALORES DE LICENCIA DEL INSCRIPCION PROVISORIO PARA MOSTRAR EN PANTALLA
        $cuit = $user['cuit'];
        if ($user['acceso'] != 'administrador') {
            $sql = "SELECT FORMAT(SUM(prebuenafe.apagar),2) AS apagar FROM prebuenafe WHERE prebuenafe.cuitalta=$cuit GROUP BY prebuenafe.cuitalta";
        } else {
            $sql = "SELECT FORMAT(SUM(prebuenafe.apagar),2) AS apagar FROM prebuenafe";
        }

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }

        echo json_encode($datos);

        break;


    case 12:
        // MUEVE LOS DATOS DEL PREPADRON AL PADRON
        $cuit = $user['cuit'];

        // INSERTA LOS DATOS DE PREBUENAFE EN LA TABLA BUENAFE SEGUN EL CUIT
        $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod) SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod  FROM prebuenafe WHERE prebuenafe.cuitalta = $cuit";
        if (mysqli_query($conexion, $sql)) {
            // INSERTA LOS DATOS DE PREPATINADORES EN LA TABLA CTA CTE SEGUN EL CUIT
            $sql = "INSERT INTO ctacte (cuit, tipo_comprobante, fecha_alta, concepto, adeudado, pagado, dnipatinador, tipolicencia,dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta) SELECT cuitalta, 'Ticket', fechaalta, torneo, apagar, '0', dnibuenafe, disciplina, dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta FROM prebuenafe WHERE prebuenafe.cuitalta = $cuit";
            if (mysqli_query($conexion, $sql)) {
                // BORRA LOS DATOS DE LA TABLA PATINADORES SEGUN EL CUIT
                $sql = "DELETE FROM prebuenafe WHERE prebuenafe.cuitalta = $cuit";
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('No pudo eliminarse los patinadores de Inscripciones Provisorias!');
                };
            } else {
                echo json_encode('No se pudo generar la deuda en Cta Cte!');
            };
        } else {
            echo json_encode('No se pudo reguistrar las inscripciones!');
        };

        break;

    case 13:
        // MUEVE LOS DATOS DEL PREBUENAFE A LA TABLA BUENAFE por ID
        $id = $_GET['id'];


        // INSERTA LOS DATOS DE PREBUENAFE EN LA TABLA BUENAFE SEGUN EL ID
        $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod) SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod  FROM prebuenafe WHERE prebuenafe.id = $id";
        if (mysqli_query($conexion, $sql)) {
            // INSERTA LOS DATOS DE PREPATINADORES EN LA TABLA CTA CTE SEGUN EL ID
            $sql = "INSERT INTO ctacte (cuit, tipo_comprobante, fecha_alta, concepto, adeudado, pagado, dnipatinador, tipolicencia,dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta) SELECT cuitalta, 'Ticket', fechaalta, torneo, apagar, '0', dnibuenafe, disciplina, dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta FROM prebuenafe WHERE prebuenafe.id = $id AND apagar <> 0";
            if (mysqli_query($conexion, $sql)) {
                // BORRA LOS DATOS DE LA TABLA PATINADORES SEGUN EL ID
                $sql = "DELETE FROM prebuenafe WHERE prebuenafe.id = $id";
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('No pudo eliminarse la inscripción del registro de Inscripciones Provisorias!');
                };
            } else {
                echo json_encode('No se pudo generar la deuda en Cta Cte!');
            };
        } else {
            echo json_encode('No se pudo reguistrar la modificación en la inscripción!');
        };
        break;

    case 14:

        // MUEVE LOS DATOS DEL PREBUENAFE A LA TABLA BUENAFE por ID PARA DISCIPLINAS CON COMBINADAS (PROGRAMA 1 y/o PROGRAMA 2)
        $id = $_GET['id'];
        // $programa1 = $_GET['programa1'];
        // $programa2 = $_GET['programa2'];

        // en caso que tengra PROGRAMAS por COMBINADA ** GENERA TRES REGISTROS: Disciplina - Programa1 y Programa2 **
        // RGISTRA LA DISCIPLINA PRINCIPAL
        $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, id_combinada, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod) SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina,CONCAT(id, 'combinada'), apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod  FROM prebuenafe WHERE prebuenafe.id = $id";
        if (mysqli_query($conexion, $sql)) {
            // INSERTA LOS DATOS DE PREPATINADORES EN LA TABLA CTA CTE SEGUN EL ID
            $sql = "INSERT INTO ctacte (cuit, tipo_comprobante, fecha_alta, concepto, adeudado, pagado, dnipatinador, tipolicencia,dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta) SELECT cuitalta, 'Ticket', fechaalta, torneo, apagar, '0', dnibuenafe, disciplina, dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta FROM prebuenafe WHERE prebuenafe.id = $id AND apagar <> 0";
            if (mysqli_query($conexion, $sql)) {
                // RGISTRA el PROGRAMA 1 DE LA DISCIPLINA PRINCIPAL
                $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, id_combinada, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod) SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, CONCAT(id, 'combinada'), '0', pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod  FROM prebuenafe WHERE prebuenafe.id = $id";
                if (mysqli_query($conexion, $sql)) {
                    // RGISTRA el PROGRAMA 2 DE LA DISCIPLINA PRINCIPAL
                    $sql = "INSERT INTO buenafe (dnibuenafe, divisional, eficiencia, categoria, disciplina, programa1, id_combinada, apagar, pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod) SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, programa2, CONCAT(id, 'combinada'), '0', pagado, torneo, posicion, ordensalida, fechatorneo, horatorneo, podiotorneo, puntospatinador, puntosclub, estado, observaciones, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta, dnimod, nombremod, apellidomod, cuitmod, institucionmod, fechamod  FROM prebuenafe WHERE prebuenafe.id = $id";
                    if (mysqli_query($conexion, $sql)) {
                        // BORRA LOS DATOS DE LA TABLA PATINADORES SEGUN EL ID
                        $sql = "DELETE FROM prebuenafe WHERE prebuenafe.id = $id";
                        if (mysqli_query($conexion, $sql)) {
                            echo json_encode('1');
                        } else {
                            echo json_encode('No pudo eliminarse la inscripción del registro de Inscripciones Provisorias!');
                        };
                    } else {
                        echo json_encode('No se pudo incribirse el PROGRAMA 2 de la disciplina combinada!');
                    };
                } else {
                    echo json_encode('No se pudo incribirse el PROGRAMA 1 de la disciplina combinada!');
                };
            } else {
                echo json_encode('No se pudo generar la deuda en Cta Cte!');
            };
        } else {
            echo json_encode('No se pudo generar la disciplina!');
        };
        break;
}
mysqli_close($conexion);
