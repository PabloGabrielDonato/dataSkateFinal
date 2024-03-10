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
    $divisional = $_POST['divisional'];
    $disciplina = $_POST['disciplina'];
    $eficiencia = $_POST['eficiencia'];
    $categoria = $_POST['categoria'];
}

switch ($opcion) {
    case 0:
        // consulta SQL
        $sql = "SELECT
        relacion_tablas_ddec.id,
        divisional.divisional,
        disciplinas.disciplina,
        eficiencia.eficiencia,
        categorias.categoria,
        CONCAT(categorias.edad_desde,' - ',categorias.edad_hasta) AS edad
    FROM
        relacion_tablas_ddec,
        divisional,
        disciplinas,
        eficiencia,
        categorias
    WHERE
        (
            divisional.id = relacion_tablas_ddec.id_divisional
        ) AND(
            disciplinas.id = relacion_tablas_ddec.id_disciplina
        ) AND(
            eficiencia.id = relacion_tablas_ddec.id_eficiencia
        ) AND(
            categorias.id = relacion_tablas_ddec.id_categoria
        );";

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
        relacion_tablas_ddec.*,
        DATE_FORMAT(relacion_tablas_ddec.fechaalta, '%d/%m/%Y') AS newfechaalta,
        DATE_FORMAT(relacion_tablas_ddec.fechamod, '%d/%m/%Y') AS newfechamod,
        relacion_tablas_ddec.id,
        relacion_tablas_ddec.id_divisional,
        divisional.divisional,
        relacion_tablas_ddec.id_disciplina,
        disciplinas.disciplina,
        relacion_tablas_ddec.id_eficiencia,
        eficiencia.eficiencia,
        relacion_tablas_ddec.id_categoria,
        categorias.categoria,
        CONCAT(categorias.edad_desde,' - ',categorias.edad_hasta) AS edad
    FROM
        relacion_tablas_ddec,
        divisional,
        disciplinas,
        eficiencia,
        categorias
    WHERE
        (
            divisional.id = relacion_tablas_ddec.id_divisional
        ) AND(
            disciplinas.id = relacion_tablas_ddec.id_disciplina
        ) AND(
            eficiencia.id = relacion_tablas_ddec.id_eficiencia
        ) AND(
            categorias.id = relacion_tablas_ddec.id_categoria
        ) and relacion_tablas_ddec.id=$id";

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

            // Verifica si existe la relación: DICISIONAL - DISCIPLINA - EFICIENCIA - CATEGORIA
            $sentenciaSQL = $conn->prepare("SELECT * FROM relacion_tablas_ddec WHERE relacion_tablas_ddec.id_divisional=:divisional AND relacion_tablas_ddec.id_disciplina=:disciplina AND relacion_tablas_ddec.id_eficiencia=:eficiencia AND relacion_tablas_ddec.id_categoria=:categoria");
            $sentenciaSQL->bindParam("divisional", $_POST['divisional'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("disciplina", $_POST['disciplina'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("eficiencia", $_POST['eficiencia'], PDO::PARAM_STR);
            $sentenciaSQL->bindParam("categoria", $_POST['categoria'], PDO::PARAM_STR);
            $sentenciaSQL->execute();
            $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

            //si no existe registra
            if ($numeroRegistros == 0) {
                // busca las edades para la categoria seleccionada
                $sql = "SELECT categorias.edad_desde, categorias.edad_hasta FROM categorias WHERE categorias.id='$categoria'";
                $result = mysqli_query($conexion, $sql);
                $datos = array();
                while ($fila = mysqli_fetch_array($result)) {
                    array_push($datos, $fila);
                }
                $edad_desde = $datos[0]['edad_desde'];
                $edad_hasta = $datos[0]['edad_hasta'];

                // Actualiza la tabla
                $sql = "UPDATE relacion_tablas_ddec SET id_divisional = '$divisional', id_disciplina = '$disciplina', id_eficiencia = '$eficiencia', id_categoria = '$categoria', edad_desde='$edad_desde', edad_hasta='$edad_hasta', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE relacion_tablas_ddec.id = $id;";

                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('0');
                }
            } else {
                echo json_encode('La relación que intenta modificar de alta ya existe!');
            };
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
        $recicledtabla = 'Relaciones-DDEC';

        if (isset($id)) {
            //Guardar el usuario a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled (
                recicleddni,
                reciclednombre,
                recicledtabla,
                dnibaja,
                nombrebaja,
                apellidobaja,
                institucionbaja,
                fechabaja
            )
            VALUES (
                (SELECT id FROM relacion_tablas_ddec WHERE id = $id),
                (SELECT CONCAT(
                        divisional.divisional,
                        '-',
                        disciplinas.disciplina,
                        '-',
                        eficiencia.eficiencia,
                        '-',
                        categorias.categoria
                    ) AS relacion
                    FROM relacion_tablas_ddec
                    JOIN divisional ON divisional.id = relacion_tablas_ddec.id_divisional
                    JOIN disciplinas ON disciplinas.id = relacion_tablas_ddec.id_disciplina
                    JOIN eficiencia ON eficiencia.id = relacion_tablas_ddec.id_eficiencia
                    JOIN categorias ON categorias.id = relacion_tablas_ddec.id_categoria
                    WHERE relacion_tablas_ddec.id = $id
                ),
                '$recicledtabla',
                '$dnibaja',
                '$nombrebaja',
                '$apellidobaja',
                '$institucionbaja',
                CURRENT_DATE()
            );";

            //borra el reguistro en la tabala especificada
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM relacion_tablas_ddec WHERE relacion_tablas_ddec.id = $id;";
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
        //Altas
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        // Verifica si existe la relación: DICISIONAL - DISCIPLINA - EFICIENCIA - CATEGORIA
        $sentenciaSQL = $conn->prepare("SELECT * FROM relacion_tablas_ddec WHERE relacion_tablas_ddec.id_divisional=:divisional AND relacion_tablas_ddec.id_disciplina=:disciplina AND relacion_tablas_ddec.id_eficiencia=:eficiencia AND relacion_tablas_ddec.id_categoria=:categoria");
        $sentenciaSQL->bindParam("divisional", $_POST['divisional'], PDO::PARAM_STR);
        $sentenciaSQL->bindParam("disciplina", $_POST['disciplina'], PDO::PARAM_STR);
        $sentenciaSQL->bindParam("eficiencia", $_POST['eficiencia'], PDO::PARAM_STR);
        $sentenciaSQL->bindParam("categoria", $_POST['categoria'], PDO::PARAM_STR);
        $sentenciaSQL->execute();
        $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

        //si no existe registra
        if ($numeroRegistros == 0) {

            // busca las edades para la categoria seleccionada
            $sql = "SELECT categorias.edad_desde, categorias.edad_hasta FROM categorias WHERE categorias.id='$categoria'";
            $result = mysqli_query($conexion, $sql);
            $datos = array();
            while ($fila = mysqli_fetch_array($result)) {
                array_push($datos, $fila);
            }
            $edad_desde = $datos[0]['edad_desde'];
            $edad_hasta = $datos[0]['edad_hasta'];

            // inserta la relación
            $sql = "INSERT INTO relacion_tablas_ddec (id_divisional, id_disciplina, id_eficiencia, id_categoria, edad_desde, edad_hasta, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$divisional', '$disciplina', '$eficiencia', '$categoria', '$edad_desde', '$edad_hasta', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('La Disciplina no pudo registrarse!');
            };
        } else {
            echo json_encode('La relación que intenta dar de alta ya existe!');
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
        $recicledtabla = 'Relaciones-DDEC';

        //Guardar el usuario a ELIMINAR en la tabla RECICLED
        if ($password == $user['password']) {
            $sql = "INSERT INTO recicled (
                recicleddni,
                reciclednombre,
                recicledtabla,
                dnibaja,
                nombrebaja,
                apellidobaja,
                institucionbaja,
                fechabaja
            )
            SELECT
                relacion_tablas_ddec.id,
                CONCAT(
                    divisional.divisional,
                    '-',
                    disciplinas.disciplina,
                    '-',
                    eficiencia.eficiencia,
                    '-',
                    categorias.categoria
                ) AS reciclednombre,
                '$recicledtabla',
                '$dnibaja',
                '$nombrebaja',
                '$apellidobaja',
                '$institucionbaja',
                CURRENT_DATE()
            FROM
                relacion_tablas_ddec
            JOIN divisional ON divisional.id = relacion_tablas_ddec.id_divisional
            JOIN disciplinas ON disciplinas.id = relacion_tablas_ddec.id_disciplina
            JOIN eficiencia ON eficiencia.id = relacion_tablas_ddec.id_eficiencia
            JOIN categorias ON categorias.id = relacion_tablas_ddec.id_categoria;
            ";

            // Elimina todos los datotos de la tabla
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM relacion_tablas_ddec;";

                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('No se pudo borrar las Relaciones');
                };
            } else {
                echo json_encode('No se pudo borrar las Relaciones');
            };
        } else {
            echo json_encode('Las passwords no coinciden');
        }
        break;

    case 6:
        // Busacr DISCIPLINA según el DIVISIONAL seleccionado
        $divisional = $_GET['divisional'];

        $sql = "SELECT
        relacion_tablas_ddec.id_disciplina,
        disciplinas.disciplina
    FROM
        relacion_tablas_ddec,
        divisional,
        disciplinas
    WHERE
        (
            divisional.id = relacion_tablas_ddec.id_divisional
        ) AND(
            disciplinas.id = relacion_tablas_ddec.id_disciplina
        ) AND relacion_tablas_ddec.id_divisional=$divisional GROUP BY disciplinas.disciplina";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);

        break;

    case 7:
        // Busacr EFICIENCIA según el DIVISIONAL y DISCIPLINA seleccionado
        $divisional = $_GET['divisional'];
        $disciplina = $_GET['disciplina'];

        $sql = "SELECT
        relacion_tablas_ddec.id_eficiencia,
        eficiencia.eficiencia
    FROM
        relacion_tablas_ddec,
        divisional,
        disciplinas,
        eficiencia
    WHERE
        (
            divisional.id = relacion_tablas_ddec.id_divisional
        ) AND(
            disciplinas.id = relacion_tablas_ddec.id_disciplina
        ) AND(
            eficiencia.id = relacion_tablas_ddec.id_eficiencia
        ) AND relacion_tablas_ddec.id_divisional = $divisional AND relacion_tablas_ddec.id_disciplina=$disciplina GROUP BY relacion_tablas_ddec.id_eficiencia";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);

        break;

    case 8:
        $divisional = $_GET['divisional'];
        $disciplina = $_GET['disciplina'];
        $eficiencia = $_GET['eficiencia'];
        $edad = $_GET['edad'];

        $sql = "SELECT
        relacion_tablas_ddec.id_categoria,
        categorias.categoria,
        CONCAT(
            relacion_tablas_ddec.edad_desde,
            ' - ',
            relacion_tablas_ddec.edad_hasta
        ) AS edad
    FROM
        relacion_tablas_ddec,
        divisional,
        disciplinas,
        eficiencia,
        categorias
    WHERE
        (
            divisional.id = relacion_tablas_ddec.id_divisional
        ) AND(
            disciplinas.id = relacion_tablas_ddec.id_disciplina
        ) AND(
            eficiencia.id = relacion_tablas_ddec.id_eficiencia
        ) AND(
            categorias.id = relacion_tablas_ddec.id_categoria
        ) AND(
            relacion_tablas_ddec.id_divisional = $divisional AND relacion_tablas_ddec.id_disciplina = $disciplina AND relacion_tablas_ddec.id_eficiencia = $eficiencia
        ) AND $edad BETWEEN relacion_tablas_ddec.edad_desde AND relacion_tablas_ddec.edad_hasta";

        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);

        break;
}
mysqli_close($conexion);
