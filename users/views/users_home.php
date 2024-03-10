<?php
include('../../modulos/encabezado_user.php');

// Saldo de Cta Cte
$sql = "SELECT SUM(ctacte.adeudado - ctacte.pagado) AS saldo FROM ctacte WHERE ctacte.cuit= $valorCuit GROUP BY ctacte.cuit";

$result = mysqli_query($conexion, $sql);

$datos = array();
while ($fila = mysqli_fetch_array($result)) {
  array_push($datos, $fila);
}

// Cuenta los tipo de licencias empadronadas
// $sql = "SELECT patinadores.dnipatinador, clubs.tipoafiliacion FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit AND (clubs.tipoafiliacion='AFILIADO-RIO' OR clubs.tipoafiliacion='INVITADO') GROUP BY patinadores.dnipatinador";
// if ($result = mysqli_query($conexion, $sql)) {
//   $patinadoresEmpadronadosNL = mysqli_num_rows($result);
// }
$sql = "SELECT patinadores.dnipatinador, clubs.tipoafiliacion FROM patinadores, clubs WHERE patinadores.cuit=$valorCuit AND (clubs.tipoafiliacion='AFILIADO-RIO' OR clubs.tipoafiliacion='INVITADO') GROUP BY patinadores.dnipatinador";
if ($result = mysqli_query($conexion, $sql)) {
  $patinadoresEmpadronadosNL = mysqli_num_rows($result);
}


// $sql = "SELECT patinadores.tipolicencia, COUNT(patinadores.dnipatinador) AS cantidad FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit AND (clubs.tipoafiliacion='AFILIADO-RIO' OR clubs.tipoafiliacion='INVITADO') GROUP BY patinadores.tipolicencia
// ";
$sql = "SELECT patinadores.tipolicencia, COUNT(patinadores.dnipatinador) AS cantidad FROM patinadores WHERE patinadores.cuit=$valorCuit GROUP BY patinadores.tipolicencia";
$result_3 = mysqli_query($conexion, $sql);

// cierra conexion
mysqli_close($conexion);
?>

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
  <link rel="icon" href="../../assets/images/favicon.ico" type="image/x-icon" />
  <!-- vendor css -->
  <link rel="stylesheet" href="../../assets/css/styles.css" />
  <link rel="stylesheet" href="../../assets/css/stylesplus.css" />
  <!-- Boostrap Style -->
  <!-- <link rel="stylesheet" href="assets/css/plugins/bootstrap.min.css"> -->
  <!-- fontawesome PRO -->
  <script src="../../fw_pro.js" crossorigin="anonymous"></script>
  <!-- DataTable -->
  <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
  <link href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" rel="stylesheet" />
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="../../assets/rio_logo.png">
  <title>Rioplatense - Home usuarios</title>
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
  .card {
    backdrop-filter: blur(5px);
  }

  .badge-light-primary {
    background: rgba(30, 144, 255, 0.5);
    border-color: #F0F8FF;
    color: #0000FF;
  }

  .text-c-blue {
    color: #0000FF;
  }

  .bg-primary {
    background: rgba(0, 0, 139, 0.7) !important;
  }

  .pcoded-navbar .pcoded-inner-navbar li.active>a,
  .pcoded-navbar .pcoded-inner-navbar li:focus>a,
  .pcoded-navbar .pcoded-inner-navbar li:hover>a {
    color: #00BFFF;
  }

  .pcoded-navbar .pcoded-inner-navbar li.pcoded-menu-caption {
    color: #00BFFF;
  }

  .flat-card .row-table i {
    font-size: 60px;
  }

  @media screen and (max-width: 1360px) {
    span {
      font-size: 10px;
    }
  }
</style>

<body class="">

  <!-- [ Header ] start -->
  <?php include('../../modulos/header.php') ?>
  <!-- [ Header ] end -->

  <!-- [ navigation menu ] start -->
  <?php include('../../modulos/navmenu.php') ?>
  <!-- [ navigation menu ] end -->

  <!-- LOGOUT MPODAL-->
  <?php include('../../modulos/logout.php'); ?>
  <!-- End LOGOUT -->




  <!-- [ Main Content ] start -->
  <div class="pcoded-main-container container-home">
    <h1 class="mb-2 text-center">Federación de Patín Rioplatense</h1>
    <div class="pcoded-content">

      <!-- Patinadores activos -->
      <div class="col-xl-3">
        <div class="card flat-card badge-light-primary shadow" id="saldo">
          <div class="row-table">
            <div class="col-sm-3 card-body text-green">
              <!-- <i class="fas fa-trophy"></i> -->
              <i class="fas fa-usd-circle"></i>
            </div>
            <div class="col-sm-9">
              <!-- Verifica si el saldo es VACIO para no mostrar ERROR -->
              <?php if (!empty($datos[0]['saldo'])) { ?>
                <h4 class="text-c-blue" id="valor"><?php echo  $datos[0]['saldo'] ?></h4>
              <?php } else { ?>
                <h4 class="text-c-blue" id="valor">0</h4>
              <?php } ?>
              <h6 class="text-c-blue">Saldo Cuenta Corriente</h6>
            </div>
          </div>
        </div>
      </div>

      <div class="d-flex justify-content-between">
        <!-- Patinadores Empadronados NO LEPAA-->
        <div class="col-xl-5">
          <div class="card support-bar badge-light-light shadow">
            <div class="card-body pb-0">
              <div>
                <h2 class="m-0 text-c-blue num" data-val="<?php echo  $patinadoresEmpadronadosNL ?>">0</h2>
              </div>
              <span class="text-c-blue">Patinadores Empadronados</span>
            </div>
            <div id="support-chart"></div>
            <div class="card-footer bg-primary text-white">
              <div class="row text-center">
                <?php
                if (mysqli_num_rows($result_3) > 0) {
                  foreach ($result_3 as $tipolicencia) {
                ?>
                    <div class="col">
                      <h4 class="m-0 text-white num" data-val="<?php echo $tipolicencia['cantidad'] ?>">0</h4>
                      <span><?php echo $tipolicencia['tipolicencia']; ?></span>
                    </div>
                <?php
                  }
                }
                ?>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>

  <!-- [ Main Content ] end -->


  <!-- Mensaje de error de Acceso a SYSTEM LEPA -->
  <?php if (!empty($_SESSION['mensajeAcceso'])) : ?>
    <?php if ($_SESSION['valorAcceso'] == 0) : ?>
      <p><?= '<script>Swal.fire("","' .  $_SESSION['mensajeAcceso'] . '","error");</script>'; ?></p>
      <?php $_SESSION['mensajeAcceso'] = '' ?>
    <?php endif; ?>
  <?php endif; ?>
  <!-- END de error de Acceso a SYSTEM LEPA -->

  <!-- Boostrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Required Js -->
  <script src="../../assets/js/vendor-all.min.js"></script>
  <script src="../../assets/js/plugins/bootstrap.min.js"></script>
  <script src="../../assets/js/pcoded.min.js"></script>
  <script src="../../js/logout.js"></script>

  <script>
    function logoutModal() {
      $('#logoutModal').modal('show');
    }

    // === Muestra el saldo de la CTA CTE del club en el inicio ===
    // Obtén el valor del saldo y almacénalo en una variable JavaScript
    var saldo = <?php echo $datos[0]['saldo'] ?>;
    // da formato al numero
    var saldoFormateado = Number(saldo).toLocaleString();
    document.getElementById('valor').innerHTML = saldoFormateado;
    // Obtén la etiqueta h4 por su id
    var saldoElement = document.getElementById('saldo');
    // Verifica si el saldo es positivo
    if (saldo > 0) {
      // Aplica la clase para pintar el fondo de rojo
      saldoElement.style.background = '#FF4500';
      saldoElement.style.borderColor = '#FFD700';
    } else {
      saldoElement.style.background = '#66CDAA';
    }
    // === FIN Muestra el saldo de la CTA CTE del club en el inicio ===


    // animacion de numeros
    let valueDisplays = document.querySelectorAll(".num");
    let interval = 500; //velocidad de los numeros

    valueDisplays.forEach((valueDisplay) => {
      let startValue = 0;
      let endValue = parseInt(valueDisplay.getAttribute("data-val"));
      // console.log(endValue);
      if (endValue != 0) {
        let duration = Math.floor(interval / endValue);
        let counter = setInterval(function() {
          startValue += 1;
          valueDisplay.textContent = startValue;
          if (startValue == endValue) {
            clearInterval(counter);
          }
        }, duration);
      };
    });
  </script>
</body>

</html>