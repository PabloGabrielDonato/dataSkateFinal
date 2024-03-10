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
        if ($row > 2) {
            return true;
        }
        return false;
    }
}

$reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();

//Carga el archivo Excel en la variable
$inputFileName = $_FILES['excel']['tmp_name'];
// $inputFileName = '../LibroTorneo.xlsx';

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

$cantUpdate = 0;
//Lectura de cada reguistro del excel
foreach ($cantidad as $row) {

    $dni = $row[2];
    $torneo = $row[5];
    $ordensalida = $row[7];
    $fechatorneo1 = $row[8];
    $horatorneo = $row[9];
    $podiotorneo = $row[10];
    $observaciones = $row[12];
    $disciplina = $row[13];
    $divisional = $row[14];
    $eficiencia = $row[15];
    $categoria = $row[16];
    $puntospatinador = $row[17];
    $puntosclub = $row[18];
    $dnialta = $user['dni'];
    $nombrealta = $user['nombre'];
    $apellidoalta = $user['apellido'];
    $cuitalta = $user['cuit'];
    $institucionalta = $user['institucion'];
    $fechaalta = date('Y-m-d');

    // convierte la FECHATORNEO en formato MySQL
    $fechatorneo = date('Y-m-d', strtotime($fechatorneo1));


    if ($dni != '') {
        $checkPatinador = ("SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, torneo FROM buenafe WHERE dnibuenafe='$dni' AND divisional='$divisional' AND eficiencia='$eficiencia' AND categoria='$categoria' AND disciplina='$disciplina' AND torneo='$torneo'");
        $ca_dupli = mysqli_query($conexion, $checkPatinador);
        $patinadorExiste = mysqli_num_rows($ca_dupli);

        if ($patinadorExiste > 0) {
            // si existe el patinador lo actualiza en la tabla BUENAFE
            $dnimod = $user['dni'];
            $nombremod = $user['nombre'];
            $apellidomod = $user['apellido'];
            $cuitmod = $user['cuit'];
            $institucionmod = $user['institucion'];
            $fechamod = date('Y-m-d');

            $update = "UPDATE buenafe SET divisional='$divisional', eficiencia='$eficiencia' ,categoria='$categoria', disciplina='$disciplina', puntospatinador='$puntospatinador', puntosclub='$puntosclub', ordensalida='$ordensalida', fechatorneo='$fechatorneo', horatorneo='$horatorneo', podiotorneo='$podiotorneo', observaciones='$observaciones', dnimod='$dnimod', nombremod='$nombremod', apellidomod='$apellidomod', cuitmod='cuitmod', institucionmod='$institucionmod', fechamod='$fechamod' WHERE dnibuenafe='$dni' AND divisional='$divisional' AND eficiencia='$eficiencia' AND categoria='$categoria' AND disciplina='$disciplina' AND torneo='$torneo'";

            $result = $conexion->query($update);

            $cantUpdate++;
        };
    };
}

// echo $cantUpdate;
// print("<pre>" . print_r($cantidad, true) . "</pre>");

if ($cantUpdate == 0) {
    echo json_encode('3');
} else {
    echo json_encode('1');
}
