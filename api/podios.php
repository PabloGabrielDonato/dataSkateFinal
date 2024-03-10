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
        $asistencia = $_POST['asistencia'];
        $podioTorneo = $_POST['podio'];
        $puntospatinador = $_POST['puntosPatinador'];
        $puntosclub = $_POST['puntosClub'];
    }
}

switch ($opcion) {

    case 0:
        // Completa la tabla de los podios anules
        $cuit = $user['cuit'];

        $sql = "SELECT
        patinadores.apellidopatinador,
        patinadores.nombrepatinador,
        podios.dnibuenafe,
        podios.institucion,
        podios.edad,
        podios.podioanual,
        podios.podiotorneo,
        podios.disciplina,
        podios.divisional,
        podios.eficiencia,
        podios.categoria,
        podios.asistencia,
        podios.puntospatinador,
        podios.puntosclub,
        CONCAT_WS(
            ' - ',
            podios.disciplina,
            podios.divisional,
            podios.eficiencia,
            podios.categoria
        ) AS nivel,
        podios.id
    FROM
        podios
    LEFT JOIN patinadores ON podios.dnibuenafe = patinadores.dnipatinador
    ORDER BY
        nivel, podios.podiotorneo";

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        echo json_encode($arreglo);
        break;

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT
        podios.*,
        DATE_FORMAT(podios.fechaalta, '%d/%m/%Y') AS newfechaalta,
        DATE_FORMAT(podios.fechamod, '%d/%m/%Y') AS newfechamod,
        IFNULL(
            patinadores.nombrepatinador,
            '**SIN EMPADRONAR PREVIAMENTE**'
        ) AS nombrepatinador,
        IFNULL(patinadores.apellidopatinador, '') AS apellidopatinador,
        patinadores.fechanacpatinador,
        IFNULL(
            DATE_FORMAT(
                patinadores.fechanacpatinador,
                '%d/%m/%Y'
            ),
            '**'
        ) AS fechanacimiento,
        IFNULL(
            YEAR(CURDATE()) - YEAR(patinadores.fechanacpatinador),
            '**') AS edad,
            IFNULL(patinadores.tipolicencia, '**') AS tipolicencia,
            IFNULL(patinadores.sexopatinador, '**') AS sexopatinador,
            clubs.institucion,
            clubs.cuit
        FROM
            podios
        LEFT JOIN patinadores ON podios.dnibuenafe = patinadores.dnipatinador
        LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
        WHERE
            podios.id = $id";

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

        $sql = "UPDATE podios SET asistencia='$asistencia', podiotorneo='$podioTorneo', puntospatinador='$puntospatinador', puntosclub='$puntosclub', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE podios.id = $id;";

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
        $recicledtabla = 'Podios';

        //Guardar el podio anual a ELIMINAR en la tabla RECICLED
        $sql = "INSERT INTO recicled(
            recicleddni,
            reciclednombre,
            recicledapellido,
            recicledinstitucion,
            otro,
            recicledtabla,
            dnibaja,
            nombrebaja,
            apellidobaja,
            institucionbaja,
            fechabaja
        )
        VALUES(
            (
            SELECT
                podios.dnibuenafe AS recicleddni
            FROM
                podios
            WHERE
                podios.id = $id
        ),
        (
            SELECT
                IFNULL(
                    patinadores.nombrepatinador,
                    '**EMPADRONAR**'
                ) AS reciclednombre
            FROM
            podios
            LEFT JOIN patinadores ON podios.dnibuenafe = patinadores.dnipatinador
            WHERE
                podios.id = $id
        ),
        (
            SELECT
                IFNULL(
                    patinadores.apellidopatinador,
                    '**'
                ) AS recicledapellido
            FROM
                podios
            LEFT JOIN patinadores ON podios.dnibuenafe = patinadores.dnipatinador
            WHERE
                podios.id = $id
        ),
        (
            SELECT
                IFNULL(
                    clubs.institucion,
                    podios.institucionalta
                ) AS institucion
            FROM
                podios
            LEFT JOIN patinadores ON podios.dnibuenafe = patinadores.dnipatinador
            LEFT JOIN clubs ON patinadores.cuit = clubs.cuit
            LEFT JOIN users ON podios.dnialta = users.dni
            WHERE
                podios.id = $id
        ),
        (
            SELECT
                podios.podioanual
            FROM
                podios
            WHERE
                podios.id = $id
        ),
        '$recicledtabla',
        '$dnibaja',
        '$nombrebaja',
        '$apellidobaja',
        '$institucionbaja',
        CURRENT_DATE())";

        if (mysqli_query($conexion, $sql)) {
            //borra el reguistro en la tabala especificada
            $sql = "DELETE FROM podios WHERE podios.id = $id;";
            $query = mysqli_query($conexion, $sql);
            echo json_encode('1');
        } else {
            echo json_encode('El patinador no pudo eliminarse!');
        };

        break;

    case 4:
        // Verifica si hay datos a volcar en la tabla
        $sql = "SELECT podios.podioanual FROM podios";
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

    case 5:
        //ELIMINAR PODIOS
        $podioanual = $_GET['podioanual'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Podios';

        //Guardar el usuario a ELIMINAR en la tabla RECICLED
        if ($podioanual == 0) {
            //BORRA TODOS los datos en tabla BUENA FE
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, otro, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
                SELECT podios.dnibuenafe, patinadores.nombrepatinador, patinadores.apellidopatinador, podios.institucion,'$recicledtabla', podios.podioanual ,'$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM podios, patinadores WHERE podios.dnibuenafe=patinadores.dnipatinador;";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM podios;";
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        } else if ($podioanual != 0) {
            // BORRA PODIO ANUAL SELECCIONADO
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledapellido, recicledinstitucion, recicledtabla, otro, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja)
                SELECT podios.dnibuenafe, patinadores.nombrepatinador, patinadores.apellidopatinador, podios.institucion, '$recicledtabla', podios.podioanual ,'$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM podios, patinadores WHERE podios.dnibuenafe = patinadores.dnipatinador AND podios.podioanual='$podioanual';";

            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE podios.* FROM podios WHERE podios.podioanual='$podioanual';";
                $query = mysqli_query($conexion, $sql);
                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                };
            } else {
                echo json_encode('No se pudo eliminar los datos!');
            }
        }

        break;
}
mysqli_close($conexion);
