<?php
session_start();

date_default_timezone_set("America/Argentina/Buenos_Aires");

require '../database.php';
require '../vendor/autoload.php';


//CONSULTA LOS DATOS DEL USUARIO LOGUEADO
if (isset($_SESSION['user_id'])) {

    $records = $conn->prepare('SELECT users.id, users.dni, users.nombre, users.apellido, users.acceso, clubs.institucion, clubs.cuit FROM users, clubs WHERE users.cuit = clubs.cuit AND users.id= :id');
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

//TOMA LOS DATOS DEL EXCEL
class MyReadFilter implements \PhpOffice\PhpSpreadsheet\Reader\IReadFilter
{

    public function readCell($columnAddress, $row, $worksheetName = '')
    {
        // Lee el archivo omitiendo la fila 1
        if ($row > 3) {
            return true;
        }
        return false;
    }
}

$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();

//Carga el archivo Excel en la variable
$inputFileName = $_FILES['excel']['tmp_name'];
// $inputFileName = '../ListaBuenaFe.xlsm';

/**  Identify the type of $inputFileName  **/
$inputFileType = \PhpOffice\PhpSpreadsheet\IOFactory::identify($inputFileName);

/**  Create a new Reader of the type that has been identified  **/
$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);

//Lee la funcion para obtener los datos de una celda específica mayores al numero colocado en la funcion, en este caso >1
$reader->setReadFilter(new MyReadFilter());

/**  Load $inputFileName to a Spreadsheet Object  **/
$spreadsheet = $reader->load($inputFileName);

// Crea un Array en la variable Cantidad
$cantidad = $spreadsheet->getActiveSheet()->toArray();

// Verifica si el archovo es Buena Fe
$archivo = ($cantidad[3][9]);

if ($archivo == 'buenafe') {
    //Lectura de cada reguistro del excel
    foreach ($cantidad as $row) {

        $dni = $row[0];
        $divisional = $row[3];
        $eficiencia = $row[4];
        $categoria = $row[5];
        $disciplina = $row[6];
        $aPagar = $row[7];
        $pagado = $row[8];
        $estado = 'ACTIVO';
        $torneo = $_SESSION['valorTorneo'];
        $posicion = 0;
        $dnialta = $user['dni'];
        $nombrealta = $user['nombre'];
        $apellidoalta = $user['apellido'];
        $cuitalta = $user['cuit'];
        $institucionalta = $user['institucion'];
        $fechaalta = date('Y-m-d');

        if (empty($torneo)) {
            $torneo = 'Sin Valor';
        } else {
            $torneo = $_SESSION['valorTorneo']; //el VlorCuit proviene de padron_excel.php
        }

        if ($dni != '') {
            $checkPatinador_duplicado = ("SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina FROM buenafe WHERE dnibuenafe='$dni' AND divisional='$divisional' AND eficiencia='$eficiencia' AND categoria='$categoria' AND disciplina='$disciplina' AND torneo='$torneo'");
            $ca_dupli = mysqli_query($conexion, $checkPatinador_duplicado);
            $patinadorDuplicado = mysqli_num_rows($ca_dupli);

            if ($patinadorDuplicado == 0) {
                // si el patinador no se duplica lo inserta en la tabla BUENAFE
                $insertar = "INSERT INTO buenafe(dnibuenafe, divisional, eficiencia, categoria, disciplina, apagar, pagado, estado,torneo, posicion, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni', '$divisional', '$eficiencia', '$categoria','$disciplina','$aPagar', '$pagado', '$estado','$torneo', '$posicion', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

                $result = $conexion->query($insertar);
            } else {
                $dnimod = $user['dni'];
                $nombremod = $user['nombre'];
                $apellidomod = $user['apellido'];
                $cuitmod = $user['cuit'];
                $institucionmod = $user['institucion'];
                $fechamod = date('Y-m-d');
                //si existe el patinador lo actualiza en la tabla BUENAFE
                $update = "UPDATE buenafe SET divisional='$divisional', eficiencia='$eficiencia' ,categoria='$categoria', disciplina='$disciplina', apagar='$aPagar', pagado='$pagado', estado='$estado',torneo='$torneo', posicion='$posicion', dnimod='$dnimod', nombremod='$nombremod', apellidomod='$apellidomod', cuitmod='cuitmod', institucionmod='$institucionmod', fechamod='$fechamod' WHERE dnibuenafe='$dni' AND divisional='$divisional' AND eficiencia='$eficiencia' AND categoria='$categoria' AND disciplina='$disciplina' AND torneo='$torneo'";

                $result = $conexion->query($update);
            };
        };
    }
    echo json_encode('1');
} else {
    echo json_encode('Archivo incorrecto! Seleccione el archivo BUENA FE');
}
