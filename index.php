<?php
session_start();
require 'database.php';

date_default_timezone_set("America/Argentina/Buenos_Aires");

$message = '';
$messageRecoveryValor = 0;
$messageRecovery = '';

// ------ API referente al LOGIN ------
// Verifica usuario y contraseña
if (!empty($_POST['dni']) && !empty($_POST['password'])) {

  $records = $conn->prepare("SELECT * FROM users WHERE dni = :dni AND password=:password");
  $records->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
  $records->bindParam("password", $_POST['password'], PDO::PARAM_STR);
  $records->execute();
  $results = $records->fetch(PDO::FETCH_ASSOC);

  if ($results > 0) {
    if ($results['estadoacceso'] == 'DESBLOQUEADO') {
      //Ingresa al sistema
      $_SESSION['user_id'] = $results['id'];

      //consulta el usuario logeado
      if (isset($_SESSION['user_id'])) {
        $records = $conn->prepare('SELECT users.id, users.dni, users.nombre, users.apellido, users.acceso, clubs.institucion, clubs.cuit FROM users, clubs WHERE users.cuit = clubs.cuit AND users.id= :id');
        $records->bindParam(':id', $_SESSION['user_id']);
        $records->execute();
        $results = $records->fetch(PDO::FETCH_ASSOC);

        $user = $results;
      }
      $dniingreso = $user['dni'];
      $nombreingreso = $user['nombre'];
      $apellidoingreso = $user['apellido'];
      $institucioningreso = $user['institucion'];

      // print_r($dniingreso . " / " . $nombreingreso . " / " . $apellidoingreso . " / " . $institucioningreso);

      //Inserta en la tabla INGRESOS al usuario logeado
      $sql = "INSERT INTO ingresos (dniingreso, nombreingreso, apellidoingreso, institucioningreso, fechaingreso) VALUES ('$dniingreso', '$nombreingreso', '$apellidoingreso', '$institucioningreso', LOCALTIME())";

      $query = mysqli_query($conexion, $sql);

      //Direcciona a la pagina HOME
      if ($user['acceso'] == 'administrador') {
        // header("Location: /newproyect_Rio_v1/home.php");
        header("Location: admin/views/home.php");
      } else {
        header("Location: users/views/users_home.php");
      }
    } else {
      $message = 'USUARIO BLOQUEADO: Contactar al administrador del sistema';
    }
  } else {
    $checkUser = $conn->prepare("SELECT * FROM users WHERE dni=:dni");
    $checkUser->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
    $checkUser->execute();
    $userRegistros = $checkUser->rowCount();
    if ($userRegistros == 0) {
      $message = 'USUARIO incorrecto!';
    } else {
      $message = 'PASSWORD incorrecta!';
    }
  }
}

// API RECOVERY
if (!empty($_POST['dni']) && empty($_POST['password'])) {
  $sentenciaSQL = $conn->prepare("SELECT * FROM users WHERE dni=:dni");
  $sentenciaSQL->bindParam("dni", $_POST['dni'], PDO::PARAM_STR);
  $sentenciaSQL->execute();
  $numeroRegistros = $sentenciaSQL->rowCount(); //devuelve el nuemro de registgros coincidentes con el usuario


  if (!empty($numeroRegistros)) {
    $dni = $_POST['dni'];
    $sql = "SELECT * FROM `users` where dni = $dni";
    $result = mysqli_query($conexion, $sql);
    $fila = mysqli_fetch_array($result);

    mysqli_close($conexion);

    $enviaPara = $fila['email'];
    $mostrarPass = $fila['password'];
    $subject = 'Recuperar Password - LEPAA';
    $mensaje = 'Su password reguistrada es: ' . $mostrarPass;
    $primero = true;

    foreach ($_POST as $indice => $valor) {
      if ($primero) {
        $from = $valor;
        $primero = false;
      }
      $mensaje .= '<br><strong>' . $indice . ': </strong>';
      $mensaje .= $valor . '<br>';
      if (strpos($valor, '@') > 3 && strpos($valor, '.') > -1) {
        $from = $valor;
      }
    }
    $mail_headers  = "MIME-Version: 1.0\r\n";
    $mail_headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
    $mail_headers .= 'From: ' . $from . "\r\n";
    @mail($enviaPara, $subject, $mensaje, $mail_headers);

    $messageRecoveryValor = 1;
    $messageRecovery = "CORREO ENVIADO";
    $messageRecovery2 = "Recuerde revisar su correo SPAM";
  } else {
    $messageRecovery = "No se encuentra al usuario";
  }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <!-- Meta -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <meta name="author" content="Phoenixcoded" />
  <!-- Favicon icon -->
  <!-- <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" /> -->
  <!-- vendor css -->
  <link rel="stylesheet" href="assets/css/styles.css" />
  <!-- AOS -->
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="assets/rio_logo.png">
  <title>Rioplatense</title>
</head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-2EWVRJMP3Q"></script>
<script>
  window.dataLayer = window.dataLayer || [];

  function gtag() {
    dataLayer.push(arguments);
  }
  gtag('js', new Date());

  gtag('config', 'G-2EWVRJMP3Q');
</script>

<style>
  .fixed-button {
    display: none;
  }

  .auth-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    min-width: 100%;
    min-height: 100vh;
    background: #d6d8d9;
    background-image: url(assets/vector02.jpg);
    background-size: cover;
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
  }

  .card {
    box-shadow: 2px 2px 10px rgb(165, 165, 165);
  }
</style>

<body>
  <!-- [ auth-signin ] start -->
  <div class="auth-wrapper">
    <div class="auth-content text-center">
      <div class="card borderless" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="1000">
        <div class="row align-items-center">
          <div class="col-md-12">
            <form action="index.php" method="post">
              <div class="card-body">
                <h4 class="mb-3 f-w-400">Login RIOPLATENSE</h4>
                <hr />
                <div class="form-group mb-3">
                  <input type="text" class="form-control" name="dni" id="dni" placeholder="ID/DNI" required />
                </div>
                <div class="form-group mb-4">
                  <input type="password" class="form-control" name="password" id="password" placeholder="Password" required />
                </div>
                <button type="submit" class="btn btn-block btn-primary mb-4">Ingresar</button>
                <hr />
                <p class="mb-2 text-muted">
                  No recuerda su clave?
                  <a class="" href="#" data-toggle="modal" data-target="#formModalRecuperar">Recuperar</a>
                </p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- [ auth-signin ] end -->

  <!-- Mensaje Error de ingreso -->
  <?php if (!empty($message)) : ?>
    <p>
      <b><?= '<script>Swal.fire("","' . $message . '","error");</script>'; ?></b>
    </p>
  <?php endif; ?>
  <!-- Fin error de ingreso -->

  <!-- FROMULARIO MODAL RECUPERAR CONTRASEÑA -->
  <form class="modal fade" action="index.php" id="formModalRecuperar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" method="POST">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <!-- <img class="recoverImg" src="assets/recoverypass.png" alt="recoverypass"> -->
          <h1 class="modal-title" id="exampleModalLabel">Recuperar Clave</h1>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="col-lg-12">
          <div class="text-center">
            <h5 class="h4 text-gray-900 mb-4">Datos</h5>
          </div>
          <div class="form-group">
            <input name="dni" type="number" class="form-control form-control-user" id="modificarDni" placeholder="Ingrese numero de usuario" required />
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">
              Cancel
            </button>
            <button class="btn btn-primary" type="submit" id="btnEditarCliente">Aceptar</button>
          </div>
          <div>
            <p class="text-danger m-0">Se enviará la clave de ingreso al correo reguistrado en el sistema.</p>
            <p class="text-danger spam">VERIFIQUE SU BUZON DE SPAM</p>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!-- fin modal recovery -->

  <!-- Mensajes RECOVERY -->
  <?php if (!empty($_POST['dni']) && empty($_POST['password'])) : ?>
    <?php if ($messageRecoveryValor == 1) : ?>
      <p><?= '<script>Swal.fire("' .  $messageRecovery . '","' .  $messageRecovery2 . '","success");</script>'; ?></p>
      <?php $messageRecovery = '' ?>
    <?php endif; ?>

    <?php if ($messageRecoveryValor == 0) : ?>
      <p><?= '<script>Swal.fire("","' .  $messageRecovery . '","error");</script>'; ?></p>
      <?php $messageRecovery = '' ?>
    <?php endif; ?>
  <?php endif; ?>
  <!-- fin mensajes recovery -->

  <!-- Required Js -->
  <script src="assets/js/vendor-all.min.js"></script>
  <script src="assets/js/plugins/bootstrap.min.js"></script>
  <script src="assets/js/pcoded.min.js"></script>
  <!-- AOS -->

  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
  <script>
    // Limpia el localStorage
    localStorage.tablaValor = 0;
    localStorage.mostrarFiltro_padron = 0;
    localStorage.mostrarFiltro_buenaFe = 0;
    localStorage.mostrarFiltro_listabuenaFe = 0;
    localStorage.mostrarGrupos_buenaFe = 0;
    localStorage.mostrarFiltro_archivoBuenaFe = 0;
    localStorage.mostrarFiltro_archivolibroTorneo = 0;
    localStorage.mostrarFiltro_users_listabuenaFe = 0;
    localStorage.users_mostrarFiltro_padron = 0;
    localStorage.users_mostrarFiltro_libroTorneo = 0;
    localStorage.mostrarFiltro_users_prepadron = 0;
    localStorage.mostrarFiltro_prepadron = 0
    localStorage.mostrarFiltro_users_prebuenaFe = 0;
  </script>
</body>

</html>