<?php
include('../../modulos/encabezado_user_admin.php');

//--------- Cnatidad de patinadores por Club --------------
$sql = "SELECT clubs.institucion, COUNT(patinadores.dnipatinador) AS cantidad FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit GROUP BY institucion";
$nombreClub = [];
$cantidadPatinadores = [];

if ($result = mysqli_query($conexion, $sql)) {
  while ($linea = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    $nombreClub[] = "'{$linea['institucion']}'";
    $cantidadPatinadores[] = $linea['cantidad'];
  }
  $nombreClub = implode(',', $nombreClub);
  $cantidadPatinadores = implode(',', $cantidadPatinadores);
}

// cuenta cantidad de patinadores EMPADRONADOS (TOTAL), que estan en lista de buena fe
$sql = "SELECT patinadores.dnipatinador FROM patinadores GROUP BY patinadores.dnipatinador";
if ($result = mysqli_query($conexion, $sql)) {
  $patinadoresEmpadronados = mysqli_num_rows($result);
}


//---------- Cnatidad de patinadores ACTIVOS por Club ----------
$sql = "SELECT COUNT(DISTINCT buenafe.dnibuenafe) AS cantidad, clubs.institucion FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit LEFT JOIN users ON buenafe.dnialta = users.dni WHERE buenafe.estado='ACTIVO' GROUP BY clubs.institucion";

$nombreClubActivos = [];
$cantidadPatinadoresActivos = [];

if ($resultActivos = mysqli_query($conexion, $sql)) {
  while ($linea = mysqli_fetch_array($resultActivos, MYSQLI_ASSOC)) {
    $nombreClubActivos[] = "'{$linea['institucion']}'";
    $cantidadPatinadoresActivos[] = $linea['cantidad'];
  }
  $nombreClubActivos = implode(',', $nombreClubActivos);
  $cantidadPatinadoresActivos  = implode(',', $cantidadPatinadoresActivos);
}

// cuenta cantidad de patinadores Activos (TOTAL), que estan en lista de buena fe
$sql = "SELECT buenafe.dnibuenafe FROM buenafe GROUP BY buenafe.dnibuenafe";
if ($result = mysqli_query($conexion, $sql)) {
  $patinadoresBuenaFeActivos = mysqli_num_rows($result);
}

//---------- Pagado por toneo ACTIVO ----------
$sql = "SELECT torneo, SUM(pagado) AS pagado FROM buenafe WHERE pagado<>1 GROUP BY torneo";

$nombreTorneo = [];
$valorPagado = [];

if ($result = mysqli_query($conexion, $sql)) {
  while ($linea = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    $nombreTorneo[] = "'{$linea['torneo']}'";
    $valorPagado[] = $linea['pagado'];
  }
  $nombreTorneo = implode(',', $nombreTorneo);
  $valorPagado = implode(',',  $valorPagado);
}

//---------- Suma de PODIOS por CLUB ----------
$sql = "SELECT IFNULL(clubs.institucion, 0) AS institucion, COUNT(buenafe.podiotorneo) AS sumapodios FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit LEFT JOIN users ON buenafe.dnialta = users.dni WHERE buenafe.podiotorneo <> 0 AND buenafe.estado='ACTIVO' GROUP BY institucion ORDER BY institucion";

$nombreClubPodios = [];
$cantidadPodios = [];

if ($result = mysqli_query($conexion, $sql)) {
  while ($linea = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    $nombreClubPodios[] = "'{$linea['institucion']}'";
    $cantidadPodios[] = $linea['sumapodios'];
  }
  $nombreClubPodios = implode(',',  $nombreClubPodios);
  $cantidadPodios = implode(',', $cantidadPodios);
}


//---------- Cantidad de patinadores ACTIVOS por Torneo ----------
$sql = "SELECT buenafe.torneo, COUNT(DISTINCT buenafe.dnibuenafe) AS cantidad FROM buenafe WHERE buenafe.estado='ACTIVO' GROUP BY buenafe.torneo";

$nombreTorneo1 = [];
$cantidadTorneo1 = [];

if ($result = mysqli_query($conexion, $sql)) {
  while ($linea = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    $nombreTorneo1[] = "'{$linea['torneo']}'";
    $cantidadTorneo1[] = $linea['cantidad'];
  }
  $nombreTorneo1 = implode(',', $nombreTorneo1);
  $cantidadTorneo1 = implode(',',  $cantidadTorneo1);
}

//---------- Cantidad de patinadores BAJA por Torneo ----------
$sql = "SELECT buenafe.torneo, COUNT(DISTINCT buenafe.dnibuenafe) AS cantidad FROM buenafe WHERE buenafe.estado='BAJA' GROUP BY buenafe.torneo";

$nombreTorneo2 = [];
$cantidadTorneo2 = [];

if ($result = mysqli_query($conexion, $sql)) {
  while ($linea = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    $nombreTorneo2[] = "'{$linea['torneo']}'";
    $cantidadTorneo2[] = $linea['cantidad'];
  }
  $nombreTorneo2 = implode(',', $nombreTorneo2);
  $cantidadTorneo2 = implode(',',  $cantidadTorneo2);
}

//---------- Total de puntos por CLUB ----------
$sql = "SELECT clubs.institucion, SUM(buenafe.puntosclub) AS sumapuntos FROM buenafe LEFT JOIN patinadores ON buenafe.dnibuenafe = patinadores.dnipatinador LEFT JOIN clubs ON patinadores.cuit = clubs.cuit LEFT JOIN users ON buenafe.dnialta = users.dni WHERE clubs.institucion<>'' GROUP BY clubs.institucion";

$nombreClubPuntos = [];
$sumaPuntos = [];

if ($result = mysqli_query($conexion, $sql)) {
  while ($linea = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
    $nombreClubPuntos[] = "'{$linea['institucion']}'";
    $sumaPuntos[] = $linea['sumapuntos'];
  }
  $nombreClubPuntos = implode(',',  $nombreClubPuntos);
  $sumaPuntos = implode(',', $sumaPuntos);
}

// cierra conexion
mysqli_close($conexion);


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

  <meta http-equiv="Expires" content="0" />
  <meta http-equiv="Last-Modified" content="0" />
  <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate" />
  <meta http-equiv="Pragma" content="no-cache" />

  <!-- Boostrap Style -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- vendor css -->
  <link rel="stylesheet" href="../../assets/css/styles.css" />
  <!-- CSS adicional - propio -->
  <link rel="stylesheet" href="../../assets/css/stylesplus.css" />
  <!-- fontawesome PRO -->
  <script src="../../fw_pro.js" crossorigin="anonymous"></script>
  <!-- DataTable -->
  <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
  <link href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="../../assets/rio_logo.png">
  <title>Rioplatense - Graficas</title>
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
  /* Oculta agregar y eliminat del menu lateral */
  .pcoded-navbar .pcoded-inner-navbar li.pcoded-menu-caption:first-child {
    display: none;
  }

  .opciones {
    display: none;
  }

  .form-group {
    margin-bottom: 0;
  }

  .btn {
    border-radius: 5px;
  }
</style>

<body class="">

  <!-- [ Header ] start -->
  <?php include('../../modulos/header.php'); ?>
  <!-- [ Header ] end -->

  <!-- [ navigation menu ] start -->
  <?php include('../../modulos/navmenu_tablas.php'); ?>
  <!-- [ navigation menu ] end -->

  <!-- LOGOUT MPODAL-->
  <?php include('../../modulos/logout.php'); ?>
  <!-- End LOGOUT -->

  <!-- [ Main Content ] start -->
  <div class="pcoded-main-container">
    <div class="pcoded-content">
      <!-- [ breadcrumb ] start -->
      <div class="col-md-12">
        <div class="page-header-title">
          <h3 class="m-b-10">Graficas Informativas</h3>
        </div>
      </div>
      <!-- [ breadcrumb ] end -->
      <!-- [ Main Content ] start -->
      <div class="row">
        <!-- [ variant-chart ] start -->
        <div class="col-md-6">
          <div class="card shadow bg-body rounded">
            <div class="card-header">
              <h5>Patinadores Empadronados por Club: <span><?= $patinadoresEmpadronados ?> patinadores</span></h5>
            </div>
            <div class="card-body">
              <div id="bar-chart-1"></div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card shadow bg-body rounded">
            <div class="card-header">
              <h5>Patinadores (ACTIVOS) por Club: <span><?= $patinadoresBuenaFeActivos ?> patinadores</span></h5>
            </div>
            <div class="card-body">
              <div id="bar-chart-2"></div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card shadow bg-body rounded">
            <div class="card-header">
              <h5>Inscripciones pagadas por Torneo</h5>
            </div>
            <div class="card-body">
              <div id="bar-chart-3"></div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card shadow bg-body rounded">
            <div class=" card-header">
              <h5>Patinadores (BAJAS) por Torneos </h5>
            </div>
            <div class="card-body">
              <div id="bar-chart-7" style="width:100%"></div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="card shadow bg-body rounded">
            <div class=" card-header">
              <h5>Patinadores (ACTIVOS) por Torneos </h5>
            </div>
            <div class="card-body">
              <div id="bar-chart-5" style="width:100%"></div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="card shadow bg-body rounded">
            <div class=" card-header">
              <h5>Podios Anuales</h5>
            </div>
            <div class="card-body row">
              <div class="form-group col-md-6 form-floating">
                <select class="form-select" name="podioanual" id="podioAnual" onchange="podioanual()">
                  <option value=""></option>
                  <?php //Completa el SELECT on los datos de la tabla CLUBS
                  $select = mysqli_query($con, "SELECT podioanual FROM podios GROUP BY podioanual ORDER BY podioanual");
                  while ($podioAnual = mysqli_fetch_row($select)) {
                  ?>
                    <option value="<?php echo ($podioAnual[0]) ?>"><?php echo ($podioAnual[0]) ?></option>
                  <?php } ?>
                </select>
                <label for="floatingSelect">Sleccione el Podio Anual</label>
              </div>
              <!-- <button type="button" class="btn btn-outline-primary btn-sm col-md-1 ml-4" onclick="podioanual()">Mostrar</button> -->
              <div id="bar-chart-6" style="width:100%"></div>
            </div>
          </div>
        </div>

        <!-- [ variant-chart ] end -->

      </div>
      <!-- [ Main Content ] end -->
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
  <!-- Boostrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Required Js -->
  <script src="../../assets/js/vendor-all.min.js"></script>
  <script src="../../assets/js/plugins/bootstrap.min.js"></script>
  <script src="../../assets/js/pcoded.min.js"></script>

  <!-- Apex Chart -->
  <!-- <script src="assets/js/plugins/apexcharts.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->

  <!-- custom-chart js -->
  <script src="../../assets/js/pages/dashboard-main.js"></script>

  <script src="../../js/logout.js"></script>

  <script>
    // $(document).ready(function() {
    //   setTimeout();
    // });
    setTimeout(function() {
      $(function() {
        var options = {
          chart: {
            height: 350,
            type: 'bar',
          },
          plotOptions: {
            bar: {
              dataLabels: {
                position: 'top', // top, center, bottom
              },
            }
          },
          // pone los valores por encima de las barras
          dataLabels: {
            enabled: true,
            offsetY: -20,
            style: {
              fontSize: '12px',
              colors: ["#304758"]
            }
          },
          // -------
          colors: ["#03A9F4"],
          series: [{
            name: 'Cant.Patinadores',
            data: [<?= $cantidadPatinadores ?>]
          }],
          xaxis: {
            categories: [<?= $nombreClub ?>],
          },
          yaxis: {
            title: {
              text: 'Cantidad Patinadores'
            }
          },
          fill: {
            opacity: 1

          },
        }
        var chart = new ApexCharts(
          document.querySelector("#bar-chart-1"),
          options
        );
        chart.render();
      });

      $(function() {
        var options = {
          chart: {
            height: 350,
            type: 'bar',
          },
          plotOptions: {
            bar: {
              dataLabels: {
                position: 'top', // top, center, bottom
              },
            }
          },
          // pone los valores por encima de las barras
          dataLabels: {
            enabled: true,
            offsetY: -20,
            style: {
              fontSize: '12px',
              colors: ["#304758"]
            }
          },
          // ----------
          colors: ["#f1c40f"],
          series: [{
            name: 'Cant.Patinadores',
            data: [<?= $cantidadPatinadoresActivos ?>]
          }],
          xaxis: {
            categories: [<?= $nombreClubActivos ?>],
          },
          yaxis: {
            title: {
              text: 'Cantidad Patinadores'
            }
          },
          fill: {
            opacity: 1

          },
        }
        var chart = new ApexCharts(
          document.querySelector("#bar-chart-2"),
          options
        );
        chart.render();
      });

      $(function() {
        var options = {
          chart: {
            height: 350,
            type: 'bar',
          },
          plotOptions: {
            bar: {
              dataLabels: {
                position: 'top', // top, center, bottom
              },
            }
          },
          // pone los valores por encima de las barras
          dataLabels: {
            enabled: true,
            offsetY: -20,
            style: {
              fontSize: '12px',
              colors: ["#304758"]
            }
          },
          // ----------
          // colors: ["#1abc9c"],
          series: [{
            name: 'Pagado',
            data: [<?= $valorPagado ?>]
          }],
          xaxis: {
            categories: [<?= $nombreTorneo ?>],
          },
          yaxis: {
            title: {
              text: 'Valor Pagado'
            }
          },
          fill: {
            opacity: 1,
            type: 'gradient',
            gradient: {
              shade: 'light',
              type: "vertical",
              shadeIntensity: 0.25,
              gradientToColors: ["#c24eff", "#8731ff", "#1410f8", "#0002e2", "#0012cf"],
              inverseColors: true,
              opacityFrom: 0.85,
              opacityTo: 0.85,
              stops: [0, 100]
            },
          }
        }
        var chart = new ApexCharts(
          document.querySelector("#bar-chart-3"),
          options
        );
        chart.render();
      });

      $(function() {
        var options = {
          chart: {
            height: 350,
            type: 'bar',
          },
          plotOptions: {
            bar: {
              dataLabels: {
                position: 'top', // top, center, bottom
              },
            }
          },
          // pone los valores por encima de las barras
          dataLabels: {
            enabled: true,
            offsetY: -20,
            style: {
              fontSize: '12px',
              colors: ["#304758"]
            }
          },
          // ----------
          colors: ["#8B008B"],
          series: [{
            name: 'Cant.Patinadores',
            data: [<?= $cantidadTorneo1 ?>]
          }],
          xaxis: {
            categories: [<?= $nombreTorneo1 ?>],
          },
          yaxis: {
            title: {
              text: 'Cantidad Patinadores'
            }
          },
          fill: {
            opacity: 1

          },
        }
        var chart = new ApexCharts(
          document.querySelector("#bar-chart-5"),
          options
        );
        chart.render();
      });

      $(function() {
        var options = {
          chart: {
            height: 350,
            type: 'bar',
          },
          plotOptions: {
            bar: {
              dataLabels: {
                position: 'top', // top, center, bottom
              },
            }
          },
          // pone los valores por encima de las barras
          dataLabels: {
            enabled: true,
            offsetY: -20,
            style: {
              fontSize: '12px',
              colors: ["#304758"]
            }
          },
          // ----------
          colors: ["#26A69A"],
          series: [{
            name: 'Cant.Patinadores',
            data: [<?= $cantidadTorneo2 ?>]
          }],
          xaxis: {
            categories: [<?= $nombreTorneo2 ?>],
          },
          yaxis: {
            title: {
              text: 'Cantidad Patinadores'
            }
          },
          fill: {
            opacity: 1

          },
        }
        var chart = new ApexCharts(
          document.querySelector("#bar-chart-7"),
          options
        );
        chart.render();
      });
    }, 500);



    var options1 = '';

    function podioanual() {
      var podiosanuales = $("#podioAnual").val()

      $.ajax({
        url: '../../api/graficos.php',
        type: 'POST',
        data: {
          podiosanuales
        },
      }).done(function(data) {
        var data = JSON.parse(data);
        var institucion = [];
        var puntosClub = [];
        var podioAnual = [];
        for (var i = 0; i < data.length; i++) {
          institucion.push(data[i]['institucion']);
          puntosClub.push(data[i]['puntosclub']);
          podioAnual.push(data[i]['podioanual']);
        }
        cargarGrafico(institucion, puntosClub);
      })
    }

    function cargarGrafico(institucion, puntosClub) {
      var tituloPodio = $("#podioAnual").val();

      options1 = {
        chart: {
          height: 350,
          type: 'bar',
        },
        plotOptions: {
          bar: {
            dataLabels: {
              position: 'top', // top, center, bottom
            },
          }
        },
        // pone los valores por encima de las barras
        dataLabels: {
          enabled: true,
          offsetY: -20,
          style: {
            fontSize: '12px',
            colors: ["#304758"]
          }
        },
        // ----------
        colors: ["#4169E1"],
        series: [{
          name: 'Puntos',
          data: puntosClub
        }],
        xaxis: {
          categories: institucion,
          title: {
            text: 'Clubs ' + tituloPodio,
          }
        },
        yaxis: {
          title: {
            text: 'Puntos'
          }
        },
        fill: {
          opacity: 0.7
        },
      }
      var chart = new ApexCharts(
        document.querySelector("#bar-chart-6"),
        options1
      );
      chart.render();
      chart.resetSeries();
    }
  </script>

</body>

</html>