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
    $id_disciplina = $_POST['id_disciplina'];
    $programa1 = $_POST['programa1'];
    $programa2 = $_POST['programa2'];
}

switch ($opcion) {
    case 0:
        // consulta SQL
        $sql = "SELECT combinadas.Programa1, combinadas.Programa2, disciplinas.disciplina, combinadas.id FROM combinadas, disciplinas WHERE id_disciplina=disciplinas.id;";
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

    case 1:
        // Consulta by ID
        $id = $_GET['id'];

        $sql = "SELECT combinadas.*, disciplinas.disciplina, DATE_FORMAT(combinadas.fechaalta, '%d/%m/%Y') AS newfechaalta, DATE_FORMAT(combinadas.fechamod, '%d/%m/%Y') AS newfechamod  FROM combinadas, disciplinas where combinadas.id = $id AND combinadas.id_disciplina=disciplinas.id";
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

            $sql = "UPDATE combinadas SET id_disciplina = '$id_disciplina', programa1='$programa1', programa2='$programa2', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE combinadas.id = $id;";

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
        // Eliminar by ID
        $id = $_GET['id'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Combinadas';

        if (isset($id)) {
            //Guardar el usuario a ELIMINAR en la tabla RECICLED
            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) VALUES (
                    (SELECT combinadas.id FROM combinadas WHERE combinadas.id=$id),
                    (SELECT disciplinas.disciplina FROM disciplinas, combinadas WHERE combinadas.id=$id AND combinadas.id_disciplina=disciplinas.id),
                    (SELECT concat_ws(' - ',combinadas.programa1, combinadas.programa2) AS programas FROM combinadas WHERE combinadas.id=$id),                  '$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE())";

            //borra el reguistro en la tabala especificada
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM combinadas WHERE combinadas.id = $id;";
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
        // Altas
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        // Verifica si existe la categoria
        $sentenciaSQL = $conn->prepare("SELECT * FROM combinadas WHERE (combinadas.id_disciplina=:id_disciplina AND combinadas.programa1=:programa1 AND combinadas.programa2=:programa2)");
        $sentenciaSQL->bindParam("id_disciplina", $_POST['id_disciplina'], PDO::PARAM_STR);
        $sentenciaSQL->bindParam("programa1", $_POST['programa1'], PDO::PARAM_STR);
        $sentenciaSQL->bindParam("programa2", $_POST['programa2'], PDO::PARAM_STR);
        $sentenciaSQL->execute();
        $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario

        //si no existe registra
        if ($numeroRegistros == 0) {

            $sql = "INSERT INTO combinadas (id_disciplina, programa1, programa2, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$id_disciplina', '$programa1', '$programa2', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('La Combinada no pudo registrarse!');
            };
        } else {
            echo json_encode('La Combinada ya existe');
        };
        break;

    case 5:
        //ELIMINAR TODOS
        $password = $_GET['password'];
        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'Combinadas';

        //Guardar el usuario a ELIMINAR en la tabla RECICLED
        if ($password == $user['password']) {

            $sql = "INSERT INTO recicled (recicleddni, reciclednombre, recicledinstitucion, recicledtabla, dnibaja, nombrebaja, apellidobaja, institucionbaja, fechabaja) 
                    SELECT combinadas.id, disciplinas.disciplina, concat_ws(' - ',combinadas.programa1, combinadas.programa2) AS programas, '$recicledtabla','$dnibaja', '$nombrebaja', '$apellidobaja', '$institucionbaja', CURRENT_DATE() FROM combinadas, disciplinas WHERE combinadas.id_disciplina=disciplinas.id";

            // Elimina todos los datotos de la tabla
            if (mysqli_query($conexion, $sql)) {
                $sql = "DELETE FROM combinadas;";

                if (mysqli_query($conexion, $sql)) {
                    echo json_encode('1');
                } else {
                    echo json_encode('No se pudo borrar las Disciplinas');
                };
            } else {
                echo json_encode('No se pudo borrar las Disciplinas');
            };
        } else {
            echo json_encode('Las passwords no coinciden');
        }
        break;

    case 6:
        // Consulta by ID
        $id_disciplina = $_GET['id_disciplina'];

        $sql = "SELECT combinadas.programa1, combinadas.programa2, disciplinas.disciplina FROM combinadas, disciplinas where combinadas.id_disciplina = $id_disciplina AND combinadas.id_disciplina=disciplinas.id";
        $result = mysqli_query($conexion, $sql);
        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;
}
mysqli_close($conexion);
