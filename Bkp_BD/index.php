<?php
session_start();

require '../database.php';

// Toma los datos del usuario para mostrar en el encabezado de la pagina
if (isset($_SESSION['user_id'])) {
  $records = $conn->prepare('SELECT users.*, clubs.institucion, clubs.cuit FROM users, clubs WHERE users.cuit = clubs.cuit AND users.id= :id');
  $records->bindParam(':id', $_SESSION['user_id']);
  $records->execute();
  $results = $records->fetch(PDO::FETCH_ASSOC);

  $user = null;

  if (count($results) > 0) {
    $user = $results;
  }
}

// verifica si el usuario esta logeado
if (!isset($user)) {
  header("Location: ../index.php");
}

// Verifica que el accso sea de ADMINISTRADORES
if ($user['acceso'] != 'administrador') {
  $valorAcceso = 0;
  $mensajeAcceso = 'No tiene acceso a esta sección';
  $_SESSION['valorAcceso'] = $valorAcceso;
  $_SESSION['mensajeAcceso'] = $mensajeAcceso;
  header("Location: ../users_home.php");
} ?>

<!-- Fin PHP -->


<!DOCTYPE html>
<html lang="es">

<head>
  <!-- Meta -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="description" content="" />
  <meta name="keywords" content="" />

  <meta http-equiv="Expires" content="0" />
  <meta http-equiv="Last-Modified" content="0" />
  <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <!-- Boostrap Style -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Favicon icon -->
  <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon" />
  <!-- vendor css -->
  <link rel="stylesheet" href="../assets/css/styles.css" />
  <link rel="stylesheet" href="../assets/css/stylesplus.css" />
  <!-- Boostrap Style -->
  <!-- <link rel="stylesheet" href="assets/css/plugins/bootstrap.min.css"> -->
  <!-- fontawesome PRO -->
  <script src="fw_pro.js" crossorigin="anonymous"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="assets/rio_logo.png">
  <title>Rio - Backup</title>
</head>

<style>
  .card {
    backdrop-filter: blur(5px);
  }

  img {
    width: 5%;
  }

  @media screen and (max-width: 1360px) {
    span {
      font-size: 10px;
    }
  }
</style>

<body class="">

  <!-- [ Header ] start -->
  <?php include('../modulos/header.php') ?>
  <!-- [ Header ] end -->

  <!-- [ navigation menu ] start -->
  <?php include('../modulos/navmenu_bkp.php') ?>
  <!-- [ navigation menu ] end -->

  <!-- LOGOUT MPODAL-->
  <?php include('../modulos/logout.php'); ?>
  <!-- End LOGOUT -->


  <!-- [ Main Content ] start -->
  <div class="pcoded-main-container container-home mt-4">
    <a href="./Backup.php"><img src="../assets/backup.png" alt="backup" class="mb-3"> Realizar copia de seguridad</a>
    <form action="./Restore.php" method="POST">
      <img src="../assets/restore.png" alt="restore">
      <label>Selecciona un punto de restauración</label><br>
      <select name="restorePoint">
        <option value="" disabled="" selected="">Selecciona un punto de restauración</option>
        <?php
        include_once './Connet.php';
        $ruta = BACKUP_PATH;
        if (is_dir($ruta)) {
          if ($aux = opendir($ruta)) {
            while (($archivo = readdir($aux)) !== false) {
              if ($archivo != "." && $archivo != "..") {
                $nombrearchivo = str_replace(".sql", "", $archivo);
                $nombrearchivo = str_replace("-", ":", $nombrearchivo);
                $ruta_completa = $ruta . $archivo;
                if (is_dir($ruta_completa)) {
                } else {
                  echo '<option value="' . $ruta_completa . '">' . $nombrearchivo . '</option>';
                }
              }
            }
            closedir($aux);
          }
        } else {
          echo $ruta . " No es ruta válida";
        }
        ?>
      </select>
      <button type="submit" class="btn btn-primary btn-sm">Restaurar</button>
    </form>
  </div>
  <!-- [ Main Content ] end -->


  <!-- Required Js -->
  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
  <!-- Boostrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Required Js -->
  <script src="../assets/js/vendor-all.min.js"></script>
  <script src="../assets/js/plugins/bootstrap.min.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>

  <!-- Apex Chart -->
  <script src="assets/js/plugins/apexcharts.min.js"></script>

  <!-- custom-chart js -->
  <script src="assets/js/pages/dashboard-main.js"></script>

</body>

</html>