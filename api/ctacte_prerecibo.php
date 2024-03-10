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
    $cuit = $_POST['cuit'];
    $tipo_comprobante = $_POST['tipoComprobante'];
    $fecha_alta = $_POST['fechaAlta'];
    $concepto = $_POST['concepto'];
    $comentarios = $_POST['comentarios'];
    if ($tipo_comprobante == 'Ticket' || $tipo_comprobante == 'Debito') {
        $pagado = 0;
        $adeudado = $_POST['monto'];
    } else if ($tipo_comprobante == 'Credito') {
        $pagado = $_POST['monto'];
        $adeudado = 0;
    } else {
        $forma_pago = $_POST['forma_pago'];
        $num_comp_pago = $_POST['num_comp_pago'];
        $fecha_pago = $_POST['fecha_pago'];
        $entidad_pago = $_POST['entidad_pago'];
        $id_depositante = $_POST['id_depositante'];
        $num_recibo = $_POST['num_recibo'];
        $pagado = $_POST['monto'];
        $adeudado = 0;
    };
}

switch ($opcion) {
    case 0:

        break;

    case 1:
        /// Carga la tabla cta cte general (detalle)

        if ($user['acceso'] != 'administrador') {
            $cuit = $_GET['cuit'];

            $sql = "SELECT
            prerecibos.concepto,
            prerecibos.tipo_comprobante,
            prerecibos.id,
            DATE_FORMAT(prerecibos.fecha_alta, '%d-%m-%Y') AS fecha_alta,
            IF(
                prerecibos.fecha_pago <> '',
                DATE_FORMAT(prerecibos.fecha_pago, '%d-%m-%Y'),
                '-'
            ) AS fecha_pago,
            IFNULL(prerecibos.num_comp_pago,'-') AS num_comp_pago,
            FORMAT(prerecibos.adeudado, 2) AS adeudado,
            FORMAT(prerecibos.pagado, 2) AS pagado,
            clubs.institucion,
            clubs.cuit,
            IFNULL(prerecibos.dnipatinador,'-') AS dnipatinador,
            IFNULL(prerecibos.forma_pago,'-') AS forma_pago,
            IFNULL(prerecibos.tipolicencia,'-') AS tipolicencia,
            IFNULL(CONCAT(patinadores.nombrepatinador,' ',patinadores.apellidopatinador),'-') AS nombrepatinador,
            IFNULL(prerecibos.id_depositante,'-') AS id_depositante,
            IFNULL(prerecibos.num_recibo,'-') AS num_recibo
            FROM
                prerecibos
            LEFT JOIN patinadores ON prerecibos.dnipatinador = patinadores.dnipatinador
            LEFT JOIN clubs ON prerecibos.cuit = clubs.cuit
            WHERE
                prerecibos.cuit = $cuit";
        } else {
            $sql = "SELECT
            prerecibos.concepto,
            prerecibos.tipo_comprobante,
            prerecibos.id,
            DATE_FORMAT(prerecibos.fecha_alta, '%d-%m-%Y') AS fecha_alta,
            IF(
                prerecibos.fecha_pago <> '',
                DATE_FORMAT(prerecibos.fecha_pago, '%d-%m-%Y'),
                '-'
            ) AS fecha_pago,
            IFNULL(prerecibos.num_comp_pago,'-') AS num_comp_pago,
            FORMAT(prerecibos.adeudado, 2) AS adeudado,
            FORMAT(prerecibos.pagado, 2) AS pagado,
            clubs.institucion,
            clubs.cuit,
            IFNULL(prerecibos.dnipatinador,'-') AS dnipatinador,
            IFNULL(prerecibos.forma_pago,'-') AS forma_pago,
            IFNULL(prerecibos.tipolicencia,'-') AS tipolicencia,
            IFNULL(CONCAT(patinadores.nombrepatinador,' ',patinadores.apellidopatinador),'-') AS nombrepatinador,
            IFNULL(prerecibos.id_depositante,'-') AS id_depositante,
            IFNULL(prerecibos.num_recibo,'-') AS num_recibo
            FROM
                prerecibos
            LEFT JOIN patinadores ON prerecibos.dnipatinador = patinadores.dnipatinador
            LEFT JOIN clubs ON prerecibos.cuit = clubs.cuit
            WHERE
                prerecibos.cuit = clubs.cuit";
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

    case 2:

        $sql = "SELECT prerecibos.id FROM prerecibos";
        if ($result = mysqli_query($conexion, $sql)) {
            $cantidaRecibos = mysqli_num_rows($result);
        }

        echo json_encode($cantidaRecibos);

        break;

    case 3:
        // Baja comprobantes by ID
        $id = $_GET['id'];

        $sql = "SELECT prerecibos.foto FROM prerecibos WHERE prerecibos.id = '$id'";
        $result = mysqli_query($conexion, $sql);
        $row = mysqli_fetch_assoc($result);

        if (mysqli_query($conexion, $sql)) {
            if (!empty($row['foto'])) {                 //verifica si exsite nombre de archivo en la tabla
                $filePath = '../foto/' . $row['foto'];  // establece la ruta del archivo
                if (file_exists($filePath)) {           // verifica si esxite el archivo físico
                    unlink($filePath);                  // elimina archivo físico
                }
            }
        } else {
            echo json_encode("0");
        }

        // Elimina el registro de la tabla
        $sql = "DELETE FROM prerecibos WHERE prerecibos.id = '$id';";
        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('0');
        };
        break;

    case 4:
        // Altas comprobantes

        // carga el archivo de imagen del comprobante a la carpeta UPLOADS
        if (!empty($_FILES["archivo"]["name"])) {

            $fileName = basename($_FILES["archivo"]["name"]);
            $targetDirectory = '../foto/';
            $fileType = pathinfo($fileName, PATHINFO_EXTENSION);

            $allowTypes = array('jpg', 'png', 'jpeg', 'pdf', 'JPG', 'PNG', 'JPEG', 'PDF'); //topo de archivos permitidos

            if (in_array($fileType, $allowTypes)) {
                $randomFileName = uniqid() . '_' . rand(1000, 9999) . '.' . $fileType; // Genera un nombre de archivo único aleatorio
                $targetFilePath = $targetDirectory . $randomFileName;

                if (move_uploaded_file($_FILES["archivo"]["tmp_name"], $targetFilePath)) { // Utiliza move_uploaded_file para mover y renombrar el archivo
                    $uploadedFile = $randomFileName; // Asigna el nombre del archivo subido
                } else {
                    echo json_encode("Error al subir el archivo.");
                    break;
                }
            } else {
                echo json_encode("Solo se permiten archivos JPG, JPEG, PNG y PDF.");
                break;
            }
        } else {
            $uploadedFile = '';
        }
        // FIN carga el archivo de imagen del comprobante a la carpeta UPLOADS

        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        if ($tipo_comprobante == 'Ticket' || $tipo_comprobante == 'Debito' || $tipo_comprobante == 'Credito') {
            $sql = "INSERT INTO prerecibos (cuit, tipo_comprobante, fecha_alta, concepto, adeudado, pagado, comentarios, dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta) VALUES ('$cuit', '$tipo_comprobante', '$fecha_alta', '$concepto', '$adeudado', '$pagado', '$comentarios', '$dnialta', '$apellidoalta', '$nombrealta', '$cuitalta', '$institucionalta', '$fechaalta')";
        } else {
            $sql = "INSERT INTO prerecibos (cuit, tipo_comprobante, fecha_alta, concepto, forma_pago, num_comp_pago, entidad_pago, pagado, adeudado, fecha_pago, comentarios, id_depositante, num_recibo, dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta, foto) VALUES ('$cuit', '$tipo_comprobante', '$fecha_alta', '$concepto', '$forma_pago', '$num_comp_pago', '$entidad_pago', '$pagado', '$adeudado', '$fecha_pago', '$comentarios', '$id_depositante', '$num_recibo', '$dnialta', '$apellidoalta', '$nombrealta', '$cuitalta', '$institucionalta', '$fechaalta', '$uploadedFile')";
        };

        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('El comprobante no pudo registrarse!');
        };

        break;

    case 5:
        // MUEVE LOS DATOS DEL PREPADRON AL PADRON por CUIT
        $id = $_GET['id'];

        // INSERTA LOS DATOS DE PRERECIBOS EN LA TABLA CTACTE SEGUN EL CUIT
        $sql = "INSERT INTO ctacte (cuit, tipo_comprobante, fecha_alta, concepto, forma_pago, num_comp_pago, entidad_pago, pagado, adeudado, fecha_pago, comentarios, id_depositante, num_recibo, dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta, foto) SELECT cuit, tipo_comprobante, fecha_alta, concepto, forma_pago, num_comp_pago, entidad_pago, pagado, adeudado, fecha_pago, comentarios, id_depositante, num_recibo, dnialta, apellidoalta, nombrealta, cuitalta, institucionalta, fechaalta, foto FROM prerecibos WHERE prerecibos.id = $id";

        if (mysqli_query($conexion, $sql)) {
            // BORRA EL COMPROBANTE DE LA TABLA PRERECIBOS SEGUN EL ID
            $sql = "DELETE FROM prerecibos WHERE prerecibos.id = $id";
            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('No pudo quitarse el Recibo Provisorio de la tabla!');
            };
        } else {
            echo json_encode('No se pudo ingresar su pago en la Cta Cte!');
        };

        break;

    case 6:
        //consulta detalle cta cte segun ID
        $id = $_GET['id'];

        $sql = "SELECT prerecibos.*, DATE_FORMAT(prerecibos.fecha_alta, '%Y-%m-%d') AS fecha_alta, IF(prerecibos.fecha_pago<>'', DATE_FORMAT(prerecibos.fecha_pago, '%Y-%m-%d'),'-') AS fecha_pago, clubs.institucion, DATE_FORMAT(prerecibos.fechaalta, '%d-%m-%Y') AS newfechaalta, DATE_FORMAT(prerecibos.fechamod, '%d-%m-%Y') AS newfechamod FROM prerecibos, clubs WHERE prerecibos.cuit=clubs.cuit AND prerecibos.id=$id;";

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 7:
        // Actualiza los datos
        $id = $_POST['id'];

        // carga el archivo de imagen del comprobante a la carpeta UPLOADS
        if (!empty($_FILES["archivo"]["name"])) {

            // Borra el archivo que se reemplaza
            $sql = "SELECT prerecibos.foto FROM prerecibos WHERE id = $id";
            $result = mysqli_query($conexion, $sql);
            $row = mysqli_fetch_assoc($result);

            // Verifica si el reguistro a modificar tine asignada una image, si no la tiene no borra el archivo
            if (!empty($row['foto'])) {
                $filePath = '../foto/' . $row['foto'];
                unlink($filePath);
            }

            $fileName = basename($_FILES["archivo"]["name"]);
            $targetDirectory = '../foto/';
            $fileType = pathinfo($fileName, PATHINFO_EXTENSION);

            $allowTypes = array('jpg', 'png', 'jpeg', 'pdf', 'JPG', 'PNG', 'JPEG', 'PDF'); //topo de archivos permitidos

            if (in_array($fileType, $allowTypes)) {
                $randomFileName = uniqid() . '_' . rand(1000, 9999) . '.' . $fileType; // Genera un nombre de archivo único aleatorio
                $targetFilePath = $targetDirectory . $randomFileName;

                if (move_uploaded_file($_FILES["archivo"]["tmp_name"], $targetFilePath)) { // Utiliza move_uploaded_file para mover y renombrar el archivo
                    $uploadedFile = $randomFileName; // Asigna el nombre del archivo subido
                } else {
                    echo json_encode("Error al subir el archivo.");
                    break;
                }
            } else {
                echo json_encode("Solo se permiten archivos JPG, JPEG, PNG y PDF");
                break;
            }
        }
        // FIN carga el archivo de imagen del comprobante a la carpeta UPLOADS


        $dnimod = $user['dni'];
        $nombremod = $user['nombre'];
        $apellidomod = $user['apellido'];
        $cuitmod = $user['cuit'];
        $institucionmod = $user['institucion'];
        $fechamod = date('Y-m-d');

        // seleccionar si se acualiza RECIBO o LBF
        if ($tipo_comprobante === 'Ticket' || $tipo_comprobante == 'Debito' || $tipo_comprobante == 'Credito') {
            $sql = "UPDATE prerecibos SET comentarios='$comentarios', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE prerecibos.id = $id;";
        } else {
            if (!empty($uploadedFile)) {
                // se actualiza los datos o la imagen del RECIBO
                $sql = "UPDATE prerecibos SET  tipo_comprobante = '$tipo_comprobante', fecha_alta = '$fecha_alta', concepto = '$concepto', tipo_comprobante = '$tipo_comprobante', pagado='$pagado', adeudado='$adeudado', forma_pago='$forma_pago', num_comp_pago='$num_comp_pago', fecha_pago='$fecha_pago', entidad_pago='$entidad_pago', comentarios='$comentarios', id_depositante='$id_depositante', num_recibo='$num_recibo', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod', foto='$uploadedFile' WHERE prerecibos.id = $id;";
            } else {
                // si actualiza solo datos SIN la imagen del RECIBO
                $sql = "UPDATE prerecibos SET  tipo_comprobante = '$tipo_comprobante', fecha_alta = '$fecha_alta', concepto = '$concepto', tipo_comprobante = '$tipo_comprobante', pagado='$pagado', adeudado='$adeudado', forma_pago='$forma_pago', num_comp_pago='$num_comp_pago', fecha_pago='$fecha_pago', entidad_pago='$entidad_pago', comentarios='$comentarios', id_depositante='$id_depositante', num_recibo='$num_recibo', dnimod = '$dnimod', nombremod = '$nombremod', apellidomod = '$apellidomod', cuitmod = '$cuitmod', institucionmod = '$institucionmod', fechamod = '$fechamod' WHERE prerecibos.id = $id;";
            }
        }

        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('0');
        }
        break;

    case 8:
        // Baja prerecibos by CUIT
        $cuit = $_GET['cuit'];

        // Borrado de archivos fisicos de los Recibos
        // Consulta SQL para obtener la lista de nombres de archivo
        $sql = "SELECT prerecibos.foto FROM prerecibos WHERE prerecibos.cuit = '$cuit'";
        $result = mysqli_query($conexion, $sql);
        // Verificar si la consulta tuvo éxito
        if ($result) {
            // Iterar sobre los resultados y eliminar los archivos
            while ($row = mysqli_fetch_assoc($result)) {
                if (!empty($row['foto'])) {                 //verifica si exsite nombre de archivo en la tabla
                    $filePath = '../foto/' . $row['foto'];  // establece la ruta del archivo
                    if (file_exists($filePath)) {           // verifica si esxite el archivo físico
                        unlink($filePath);                  // elimina archivo físico
                    }
                }
            }
        }
        // FIN Borrado de archivos fisicos de los Recibos

        $dnibaja = $user['dni'];
        $nombrebaja = $user['nombre'];
        $apellidobaja = $user['apellido'];
        $institucionbaja = $user['institucion'];
        $recicledtabla = 'CatCte';

        $sql = "INSERT INTO recicled(
            recicleddni,
            reciclednombre,
            recicledapellido,
            recicledinstitucion,
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
                prerecibos.cuit AS recicleddni
            FROM
                prerecibos
            WHERE
                prerecibos.cuit = $cuit
            GROUP BY
                prerecibos.cuit
        ),
        '-',
        '-',
        (
            SELECT
                clubs.institucion AS recicledinstitucion
            FROM
                clubs
            WHERE
                clubs.cuit = $cuit
        ),
        '$recicledtabla',
        '$dnibaja',
        '$nombrebaja',
        '$apellidobaja',
        '$institucionbaja',
        CURRENT_DATE())";

        if (mysqli_query($conexion, $sql)) {
            $sql = "DELETE FROM prerecibos WHERE prerecibos.cuit = '$cuit';";
            if (mysqli_query($conexion, $sql)) {
                echo json_encode('1');
            } else {
                echo json_encode('0');
            };
        } else {
            echo json_encode('0');
        };
        break;
}
mysqli_close($conexion);
