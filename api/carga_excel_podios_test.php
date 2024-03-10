<?php
// session_start();

date_default_timezone_set("America/Argentina/Buenos_Aires");

require 'database.php';
require 'vendor/autoload.php';


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
    };
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

// //Carga el archivo Excel en la variable
// $inputFileName = $_FILES['excel']['tmp_name'];
$inputFileName = 'podios.xlsx';

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

$cantidadDatos = count($cantidad);
// print($cantidadDatos);

$porcentaje = 0;
$cantUpdate = 0;
//Lectura de cada reguistro del excel
// foreach ($cantidad as $row) {

//     // $ordensalida = $row[7];
//     $dni = $row[2];
//     $edad = $row[3];
//     $institucion = $row[4];
//     $podioanual = $row[5];
//     $podiotorneo = $row[6];
//     $disciplina = $row[7];
//     $divisional = $row[8];
//     $eficiencia = $row[9];
//     $categoria = $row[10];
//     $asistencia = $row[11];
//     $puntospatinador = $row[12];
//     $puntosclub = $row[13];
//     $dnialta = $user['dni'];
//     $nombrealta = $user['nombre'];
//     $apellidoalta = $user['apellido'];
//     $cuitalta = $user['cuit'];
//     $institucionalta = $user['institucion'];
//     $fechaalta = date('Y-m-d');

//     // convierte la FECHATORNEO en formato MySQL
//     // $fechatorneo = date('Y-m-d', strtotime($fechatorneo1));


//     if ($dni != '') {
//         $checkPatinador = ("SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, podioanual FROM podios WHERE dnibuenafe='$dni' AND divisional='$divisional' AND eficiencia='$eficiencia' AND categoria='$categoria' AND disciplina='$disciplina' AND podioanual='$podioanual'");
//         $ca_dupli = mysqli_query($conexion, $checkPatinador);
//         $patinadorExiste = mysqli_num_rows($ca_dupli);

//         if ($patinadorExiste == 0) {
//             // si el patinador no se duplica lo inserta en la tabla PODIOS
//             $insertar = "INSERT INTO podios(dnibuenafe, edad, institucion, podioanual, podiotorneo, disciplina, divisional, eficiencia, categoria, asistencia, puntospatinador, puntosclub, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni',  '$edad', '$institucion', '$podioanual', '$podiotorneo', '$disciplina', '$divisional', '$eficiencia', '$categoria', '$asistencia','$puntospatinador', '$puntosclub', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

//             $result = $conexion->query($insertar);
//         } else {
//             //si existe el patinador lo actualiza en la tabla PODIOS
//             $dnimod = $user['dni'];
//             $nombremod = $user['nombre'];
//             $apellidomod = $user['apellido'];
//             $cuitmod = $user['cuit'];
//             $institucionmod = $user['institucion'];
//             $fechamod = date('Y-m-d');

//             $update = "UPDATE podios SET asistencia='$asistencia' ,puntospatinador='$puntospatinador', puntosclub='$puntosclub', podiotorneo='$podiotorneo', podioanual='$podioanual' , dnimod='$dnimod', nombremod='$nombremod', apellidomod='$apellidomod', cuitmod='$cuitmod', institucionmod='$institucionmod', fechamod='$fechamod' WHERE dnibuenafe='$dni' AND divisional='$divisional' AND eficiencia='$eficiencia' AND categoria='$categoria' AND disciplina='$disciplina' AND podioanual='$podioanual'";

//             $result = $conexion->query($update);
//             $cantUpdate++;
//         };
//     };
// }

// echo $cantUpdate;
// print("<pre>" . print_r($cantidad, true) . "</pre>");



?>


<!DOCTYPE html>

<body>
    <sapn><?PHP
            $numero = 0;

            foreach ($cantidad as $row) {

                $dni = $row[2];
                $edad = $row[3];
                $institucion = $row[4];
                $asistencia = $row[5];
                $podioanual = $row[6];
                $podiotorneo = $row[7];
                $disciplina = $row[8];
                $divisional = $row[9];
                $eficiencia = $row[10];
                $categoria = $row[11];
                $puntospatinador = $row[12];
                $puntosclub = $row[13];
                $dnialta = $user['dni'];
                $nombrealta = $user['nombre'];
                $apellidoalta = $user['apellido'];
                $cuitalta = $user['cuit'];
                $institucionalta = $user['institucion'];
                $fechaalta = date('Y-m-d');

                // convierte la FECHATORNEO en formato MySQL
                // $fechatorneo = date('Y-m-d', strtotime($fechatorneo1));


                if ($dni != '') {
                    $checkPatinador = ("SELECT dnibuenafe, divisional, eficiencia, categoria, disciplina, podioanual FROM podios WHERE dnibuenafe='$dni' AND divisional='$divisional' AND eficiencia='$eficiencia' AND categoria='$categoria' AND disciplina='$disciplina' AND podioanual='$podioanual'");
                    $ca_dupli = mysqli_query($conexion, $checkPatinador);
                    $patinadorExiste = mysqli_num_rows($ca_dupli);

                    if ($patinadorExiste == 0) {
                        // si el patinador no se duplica lo inserta en la tabla PODIOS
                        $insertar = "INSERT INTO podios(dnibuenafe, edad, institucion, podioanual, podiotorneo, disciplina, divisional, eficiencia, categoria, asistencia, puntospatinador, puntosclub, dnialta, nombrealta, apellidoalta, cuitalta, institucionalta, fechaalta) VALUES ('$dni',  '$edad', '$institucion', '$podioanual', '$podiotorneo', '$disciplina', '$divisional', '$eficiencia', '$categoria', '$asistencia','$puntospatinador', '$puntosclub', '$dnialta', '$nombrealta', '$apellidoalta', '$cuitalta', '$institucionalta', '$fechaalta')";

                        $result = $conexion->query($insertar);
                    } else {
                        //si existe el patinador lo actualiza en la tabla PODIOS
                        $dnimod = $user['dni'];
                        $nombremod = $user['nombre'];
                        $apellidomod = $user['apellido'];
                        $cuitmod = $user['cuit'];
                        $institucionmod = $user['institucion'];
                        $fechamod = date('Y-m-d');

                        $update = "UPDATE podios SET asistencia='$asistencia' ,puntospatinador='$puntospatinador', puntosclub='$puntosclub', podiotorneo='$podiotorneo', podioanual='$podioanual' , dnimod='$dnimod', nombremod='$nombremod', apellidomod='$apellidomod', cuitmod='$cuitmod', institucionmod='$institucionmod', fechamod='$fechamod' WHERE dnibuenafe='$dni' AND divisional='$divisional' AND eficiencia='$eficiencia' AND categoria='$categoria' AND disciplina='$disciplina' AND podioanual='$podioanual'";

                        $result = $conexion->query($update);
                        $cantUpdate++;
                        $porcentaje = (($cantUpdate) / $cantidadDatos) * 100;
                    };
                };
                echo ("<p id='contador'></p>");
                echo '<script type="text/javascript">';
                echo 'var contador = document.getElementById("contador");';
                echo 'function miFuncionJS() {';
                echo '  contador.innerHTML =' . round($porcentaje + 1, 0);
                echo '}';
                echo '</script>';

                echo '<script type="text/javascript">';
                echo 'miFuncionJS();';
                echo '</script>';
                for ($i = 1; $i <= 90000; $i++) {
                }
            }

            // if ($cantUpdate == 0) {
            //     echo json_encode('3');
            // } else {
            //     echo json_encode('1');
            // }
            ?></sapn>

</body>

</html>