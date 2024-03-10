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
    if ($tipo_comprobante == 'Ticket') {
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
        // Carga la tabla cta cte general (resumen)
        $cuit = $user['cuit'];

        if ($user['acceso'] != 'administrador') {
            $sql = "SELECT ctacte.cuit, clubs.institucion, FORMAT(SUM(ctacte.adeudado - ctacte.pagado), 2) AS saldo, ctacte.id FROM ctacte, clubs WHERE ctacte.cuit=clubs.cuit AND ctacte.cuit=$cuit GROUP BY ctacte.cuit";
        } else {
            $sql = "SELECT ctacte.cuit, clubs.institucion, FORMAT(SUM(ctacte.adeudado - ctacte.pagado), 2) AS saldo, ctacte.id FROM ctacte, clubs WHERE ctacte.cuit=clubs.cuit GROUP BY ctacte.cuit;";
        };

        $result = mysqli_query($conexion, $sql);
        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        if (empty($arreglo)) {
            echo json_encode($array = [
                "cuit" => "-",
                "institucion" => "-",
                "saldo" => "-",
                "id" => "-",
            ]);
        } else {
            echo json_encode($arreglo);
        }

        break;

    case 1:
        //consulta detalle cta cte segun CUIT
        $cuit = $_GET['cuit'];
        // $sql = "SELECT ctacte.concepto, ctacte.tipo_comprobante, ctacte.id ,DATE_FORMAT(ctacte.fecha_alta, '%d-%m-%Y') AS fecha_alta, IF(ctacte.fecha_pago<>'', DATE_FORMAT(ctacte.fecha_pago, '%d-%m-%Y'),'-') AS fecha_pago, FORMAT(ctacte.adeudado, 2) AS adeudado, FORMAT(ctacte.pagado, 2) AS pagado, clubs.institucion, clubs.cuit FROM ctacte, clubs WHERE ctacte.cuit=$cuit AND ctacte.cuit=clubs.cuit";

        $sql = "SELECT
        ctacte.concepto,
        ctacte.tipo_comprobante,
        ctacte.id,
        DATE_FORMAT(ctacte.fecha_alta, '%d-%m-%Y') AS fecha_alta,
        IF(
            ctacte.fecha_pago <> '',
            DATE_FORMAT(ctacte.fecha_pago, '%d-%m-%Y'),
            '-'
        ) AS fecha_pago,
        FORMAT(ctacte.adeudado, 2) AS adeudado,
        FORMAT(ctacte.pagado, 2) AS pagado,
        ctacte.tipolicencia,
        clubs.institucion,
        clubs.cuit,
        ctacte.dnipatinador,
        patinadores.nombrepatinador,
        patinadores.apellidopatinador,
        ctacte.comentarios,
        ctacte.num_comp_pago
    FROM
        ctacte
    LEFT JOIN patinadores ON ctacte.dnipatinador = patinadores.dnipatinador
    LEFT JOIN clubs ON ctacte.cuit = clubs.cuit
    WHERE
        ctacte.cuit = $cuit";

        $result = mysqli_query($conexion, $sql);

        while ($fila = mysqli_fetch_array($result)) {
            $arreglo["data"][] = $fila;
        }
        if (empty($arreglo)) {
            echo json_encode($array = [
                "concepto" => "-",
                "tipo_comprobante" => "-",
                "id" => "-",
                "fecha_alta" => "-",
                "fecha_pago" => "-",
                "adeudado" => "-",
                "pagado" => "-",
                "tipolicencia" => "-",
                "institucion" => "-",
                "cuit" => "-",
                "dnipatinador" => "-",
                "nombrepatinador" => "-",
                "apellidopatinador" => "-",
                "comentarios" => "-"
            ]);
        } else {
            echo json_encode($arreglo);
        }
        break;

    case 2:
        // Consulta SALDO por CUIT para detalle agrupado
        $cuit = $_GET['cuit'];
        $sql = "SELECT ctacte.*, FORMAT(SUM(ctacte.adeudado), 2) AS adeudado, FORMAT(SUM(ctacte.pagado), 2) AS pagado, FORMAT(SUM(ctacte.adeudado - ctacte.pagado), 2) AS saldo FROM ctacte WHERE ctacte.cuit=$cuit GROUP BY ctacte.cuit;";

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 3:
        // Baja comprobantes by ID
        $id = $_GET['id'];
        $sql = "DELETE FROM ctacte WHERE ctacte.id = '$id';";
        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('0');
        };
        break;

    case 4:
        // Altas comprobantes
        if ($tipo_comprobante == 'Ticket') {
            $sql = "INSERT INTO ctacte (cuit, tipo_comprobante, fecha_alta, concepto, adeudado, pagado, comentarios) VALUES ('$cuit', '$tipo_comprobante', '$fecha_alta', '$concepto', '$adeudado', '$pagado', '$comentarios')";
        } else {
            $sql = "INSERT INTO ctacte (cuit, tipo_comprobante, fecha_alta, concepto, forma_pago, num_comp_pago, entidad_pago, pagado, adeudado, fecha_pago, id_depositante, num_recibo, comentarios) VALUES ('$cuit', '$tipo_comprobante', '$fecha_alta', '$concepto', '$forma_pago', '$num_comp_pago', '$entidad_pago', '$pagado', '$adeudado', '$fecha_pago', '$id_depositante', '$num_recibo', '$comentarios')";
        };

        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('El comprobante no pudo registrarse!');
        };

        break;

    case 5:
        //consulta detalle cta cte segun CUIT
        $id = $_GET['id'];
        $sql = "SELECT ctacte.*, clubs.institucion FROM ctacte, clubs WHERE ctacte.id= '$id' AND ctacte.cuit=clubs.cuit;";

        $result = mysqli_query($conexion, $sql);

        $datos = array();
        while ($fila = mysqli_fetch_array($result)) {
            array_push($datos, $fila);
        }
        echo json_encode($datos);
        break;

    case 6:
        //consulta detalle cta cte segun ID
        $id = $_GET['id'];
        $sql = "SELECT ctacte.*, DATE_FORMAT(ctacte.fecha_alta, '%Y-%m-%d') AS fecha_alta, IF(ctacte.fecha_pago<>'', DATE_FORMAT(ctacte.fecha_pago, '%Y-%m-%d'),'-') AS fecha_pago, clubs.institucion FROM ctacte, clubs WHERE ctacte.cuit=clubs.cuit AND ctacte.id=$id;";

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

        // seleccionar si se acualiza RECIBO o LBF
        if ($tipo_comprobante === 'Ticket') {
            $sql = "UPDATE ctacte SET  tipo_comprobante = '$tipo_comprobante', fecha_alta = '$fecha_alta', concepto = '$concepto', tipo_comprobante = '$tipo_comprobante', pagado='$pagado', adeudado='$adeudado', comentarios='$comentarios' WHERE ctacte.id = $id;";
        } else {
            $sql = "UPDATE ctacte SET  tipo_comprobante = '$tipo_comprobante', fecha_alta = '$fecha_alta', concepto = '$concepto', tipo_comprobante = '$tipo_comprobante', pagado='$pagado', adeudado='$adeudado', forma_pago='$forma_pago', num_comp_pago='$num_comp_pago', fecha_pago='$fecha_pago', entidad_pago='$entidad_pago', comentarios='$comentarios' WHERE ctacte.id = $id;";
        }

        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('0');
        }
        break;

    case 8:
        // Baja CtaCte by CUIT
        $cuit = $_GET['cuit'];
        $sql = "DELETE FROM ctacte WHERE ctacte.cuit = '$cuit';";
        if (mysqli_query($conexion, $sql)) {
            echo json_encode('1');
        } else {
            echo json_encode('0');
        };
        break;
}
mysqli_close($conexion);
