<?php include('modulos/encabezado_user.php'); ?>

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
  <link rel="stylesheet" href="assets/css/styles.css" />
  <!-- CSS adicional - propio -->
  <link rel="stylesheet" href="assets/css/stylesplus.css" />
  <!-- CSS loading -->
  <link rel="stylesheet" href="assets/css/loading.css" />
  <!-- fontawesome PRO -->
  <script src="fw_pro.js" crossorigin="anonymous"></script>
  <!-- DataTable -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.1.0/css/searchPanes.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.5.0/css/select.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.6.1/css/colReorder.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/rowgroup/1.3.0/css/rowGroup.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/searchbuilder/1.4.0/css/searchBuilder.dataTables.min.css">
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="assets/rio_logo.png">
  <title>Rioplatense - Libro Torneo Usuarios</title>
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

<!-- Estilos para esta pagina -->
<style>
  .form-floating>.form-control {
    height: calc(1.5em + 1.25rem + 14px);
  }

  .accordion-collapse {
    background-color: white;
  }

  /* estilo tabla */

  .sorting {
    text-align: center !important;
  }

  th {
    font-size: 10px;
  }

  td {
    font-size: 12px;
  }

  /* estili imputs y selects */
  input,
  select {
    font-weight: 700 !important;
  }

  #contenedor {
    display: none;
  }

  .textoLoading {
    color: white !important;
    text-align: center !important;
  }

  div.dtsp-panesContainer {
    /* width: 100%; */
    background-color: white;
    padding: 7px;
    border-radius: 5px;
    border: 1px solid grey;
    margin-left: auto;
    margin-right: auto;
    /* display: none; */
  }

  .dtrg-group th {
    color: black;

  }

  .dtrg-level-0 th {
    color: whitesmoke;
    font-size: 13px;
    background-color: rgb(133, 130, 130) !important;
  }

  .dtrg-level-1 th {
    background-color: rgb(173, 169, 169) !important;
  }

  .dt-buttons :hover {
    background: rgba(132, 131, 131, 0.7);
  }

  /* Oculta agregar y eliminat del menu lateral */
  .opciones {
    display: none;
  }

  .acciones {
    display: none;
  }

  .pcoded-navbar .pcoded-inner-navbar li.pcoded-menu-caption {
    margin-top: 0;
  }
</style>
<!-- FIN Estilos para esta pagina -->

<body class="">

  <!-- [ Header ] start -->
  <?php include('modulos/header.php'); ?>
  <!-- [ Header ] end -->

  <!-- [ navigation menu ] start -->
  <?php include('modulos/navmenu_tablas.php'); ?>
  <!-- [ navigation menu ] end -->

  <!-- LOGOUT MPODAL-->
  <?php include('modulos/logout.php'); ?>
  <!-- End LOGOUT -->

  <!-- LOADING -->
  <?php include('modulos/loading.php'); ?>
  <!-- END LOADING -->

  <!-- [ Main Content ] start -->
  <div class="pcoded-main-container mt-4">
    <div class="text-center">
      <h1>Libro Programación Torneo : <?php echo $user['institucion'] ?></h1>
    </div>

    <!-- toma el tipo de acceso y password del usuario -->
    <div class="ocultarInputOpcion">
      <input name="tipoAcceso" id="tipoAcceso" type="text" value="<?php echo $user['acceso'] ?>">
      <input type="text" name="userPass" id="userPass" value="<?php echo $user['password'] ?>">
    </div>


    <section id="contenedor"></section>
    <!-- local -->
    <div class="col-lg-12 row mb-0 mt-4 pb-2" id="altaExcel">
      <!-- Filtros y Grupos de la Tabla -->
      <div class="form-row col-md-3 m-0">
        <div class="form-group mb-0">
          <button class="btn btn-secondary mostrarFiltros" id="mostrarFiltros" name="filtros" onclick="mostrarFiltros()" title="Filtros DESACTIVADOS"><i class="fas fa-filter"></i></button>
          <button class="btn btn-success ocultarFiltros" id="ocultarFiltros" name="filtros" onclick="ocultarFiltros()" title="Filtros ACTIVADOS"><i class="fas fa-filter"></i></button>
        </div>
      </div>
      <!-- FIN Filtros y Grupos de la Tabla -->
    </div>


    <div class="col-lg-12 mt-2">
      <div class="table-responsive">
        <table id="tablaClientes" class="display responsive nowrap compact table-bordered" style="width: 100%">
          <thead class="text-center">
            <tr>
              <th>Apellido</th>
              <th>Nombres</th>
              <th>DNI</th>
              <th>Fecha Nacimiento</th>
              <th>Edad</th>
              <th>Torneo</th>
              <th>Institución</th>
              <th>Orden Salida</th>
              <th>Día</th>
              <th>Hora</th>
              <th>Podio</th>
              <th>Nivel</th>
              <th>Observaciones</th>
              <th>Disciplina</th>
              <th>Divisional</th>
              <th>Eficiencia</th>
              <th>Categoria</th>
              <th>Estado</th>
              <th>ID</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- [ Main Content ] end -->


  <!-- SCRIPTS -->

  <!-- <script src="https://code.jquery.com/jquery-3.6.1.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <!-- Boostrap -->
  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
  <!-- Required Js -->
  <script src="assets/js/vendor-all.min.js"></script>
  <script src="assets/js/plugins/bootstrap.min.js"></script>
  <script src="assets/js/pcoded.min.js"></script>
  <!-- Apex Chart -->
  <script src="assets/js/plugins/apexcharts.min.js"></script>
  <!-- custom-chart js -->
  <script src="assets/js/pages/dashboard-main.js"></script>
  <!-- Datatable -->
  <!-- libreria para mover columnas -->
  <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.datatables.net/searchpanes/2.1.0/js/dataTables.searchPanes.min.js"></script>
  <script src="https://cdn.datatables.net/select/1.5.0/js/dataTables.select.min.js"></script>
  <script src="https://cdn.datatables.net/colreorder/1.6.1/js/dataTables.colReorder.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/rowgroup/1.3.0/js/dataTables.rowGroup.min.js"></script>
  <script src="https://cdn.datatables.net/searchbuilder/1.4.0/js/dataTables.searchBuilder.min.js"></script>
  <!-- Librerias para exportar la tabla a distintos documentos -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

  <script src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.colVis.min.js"></script>

  <!-- <script src="js/lecturaTabla_general.js"></script> -->
  <script src="js/logout.js"></script>

  <script>
    // === CARGA LA TABLA CON DATOS ===
    var opcion = '';
    var userPass = $("#userPass").val();
    var tipoAcceso = $("#tipoAcceso").val();
    var opcionDataTable = 'libroTorneo';

    $(document).ready(function() {
      listar();
    });

    // === CARGA LA TABLA CON DATOS ===
    // Accede y vuelca los datos del array en la tabla
    var listar = function() {
      opcion = 8;
      table = $("#tablaClientes").DataTable({
        ajax: {
          method: "GET",
          url: "api/buenafe.php",
          data: {
            opcion: opcion
          },
        },
        columns: [{
            data: "apellidopatinador"
          },
          {
            data: "nombrepatinador"
          },
          {
            data: "dnibuenafe"
          },
          {
            data: "fechanacimiento"
          },
          {
            data: "edad"
          },
          {
            data: "torneo"
          },
          {
            data: "institucion"
          },
          {
            data: "ordensalida"
          },
          {
            data: "fechatorneo"
          },
          {
            data: "horatorneo"
          },
          {
            data: "podiotorneo"
          },
          {
            data: "nivel" // NIVEL: disciplina - divisional - eficiencia - categoria - horatorneo
          },
          {
            data: "observaciones"
          },
          {
            data: "disciplina"
          },
          {
            data: "divisional"
          },
          {
            data: "eficiencia"
          },
          {
            data: "categoria"
          },
          {
            data: "estadotorneo"
          },
        ],

        // ESTILOS DE LA TABLA
        responsive: true,
        //configura cantidad de lineas por pantala
        lengthMenu: [
          [10, 25, 50, -1],
          [10, 25, 50, "All"],
        ],
        // paneles de busqueda filtros
        searchPanes: {
          viewTotal: true,
          layout: "columns-5",
          initCollapsed: true,
        },
        // definicion de columnas en el filtro
        columnDefs: [{
            searchPanes: {
              // columnas que participan del filtro
              show: true,
            },
            targets: [4, 5, 6, 8, 9, 10, 13, 14, 15, 16],
          },
          {
            // columnas fuera del filtro
            searchPanes: {
              show: false,
            },
            targets: [0, 1, 2, 3, 7, 11, 12],
          },
          {
            // oculta columnas
            targets: [3, 5, 8, 9, 11, 13, 14, 15, 16, 17, 18],
            visible: false,
          },
          // === fija la columna acciones en la tabla ===
          {
            responsivePriority: 1,
            targets: 0
          },
          {
            responsivePriority: 2,
            targets: -1
          },
        ],
        // columnas a ordenar
        order: [
          [5, "asc"],
          [8, "asc"],
          [9, "asc"],
          [7, "asc"],
        ],
        // columnas de agrupamiento
        rowGroup: {
          dataSrc: [5, 8, 11],
          // cuenat la cantidad de filas de cada grupo
          startRender: function(rows, group) {
            return group + " (" + rows.count() + ")";
          },
        },
        colReorder: true, // drag and drop columnas de la tabla
        dom: '"PBfrtilp"', // Filtro Si agregamos una P en el don aparece el buscar
        language: {
          lengthMenu: "Mostrar _MENU_ registros",
          zeroRecords: "No se encontraron resultados",
          emptyTable: "Ningún dato disponible en esta tabla",
          infoFiltered: "(filtrado de un total de _MAX_ registros)",
          info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
          infoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
          search: "Buscar:",
          paginate: {
            next: "Siguiente",
            previous: "Anterior",
          },
          searchPanes: {
            clearMessage: "Borrar todo",
            title: "Filtros Activos - %d",
            showMessage: "Mostrar Todo",
            collapseMessage: "Ocultar Todo",
          },
          buttons: {
            colvis: "Seleccionar Columnas",
          },
        },
        // Tabla con scroll
        scrollY: 500,
        scrollCollapse: true,
        scroller: true,
        paging: false, // Paginación de la taba
        // Botenes de la tabla y columnas visibles
        buttons: [
          "excelHtml5",
          // {
          //   extend: 'print',
          //   exportOptions: {
          //     columns: ':visible'
          //   }
          // },
          "colvis",
        ],
        createdRow: function(row, data, index) {
          //pintar una celda
          if (data[12] !== "null" && data[12].length !== 0) {
            //pinta una fila
            $("td", row).css({
              "background-color": "#FFE4C4",
              // color: "white",
              // "border-style": "solid",
              // "border-color": "#bdbdbd",
            });
          }
          if (data[1] == "**EMPADRONAR**") {
            //pinta una fila
            $("td", row).css({
              "background-color": "#ff5252",
              color: "white",
              "border-style": "solid",
              "border-color": "#bdbdbd",
            });
          }
          // Estilo a la celda
          $("td", row).eq(0).css({
            "font-size": "14px",
          });
          $("td", row).eq(1).css({
            "font-size": "14px",
          });
          $("td", row).eq(2).css({
            "text-align": "center",
            "font-size": "14px",
          });
          $("td", row).eq(3).css({
            "text-align": "center",
          });
          $("td", row).eq(5).css({
            "text-align": "center",
          });
          $("td", row).eq(6).css({
            "text-align": "center",
          });
          $("td", row).eq(8).css({
            "text-align": "center",
          });
        },
      });
      filtros();
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===


    // === MOSTRAR - OCULTAR FILTRO ===
    var valorFiltro = localStorage.users_mostrarFiltro_libroTorneo;

    function filtros() {
      if (valorFiltro == 1) {


        mostrarFiltros()
      } else {

        ocultarFiltros()
      }
    }

    function mostrarFiltros() {
      var users_mostrarFiltro_libroTorneo = 1;
      localStorage.users_mostrarFiltro_libroTorneo = users_mostrarFiltro_libroTorneo;
      $('#mostrarFiltros').hide();
      $('#ocultarFiltros').show();
      $('.dtsp-panesContainer').show();
      $('.dtsb-searchBuilde').show();
    }

    function ocultarFiltros() {
      var users_mostrarFiltro_libroTorneo = 0;
      localStorage.users_mostrarFiltro_libroTorneo = users_mostrarFiltro_libroTorneo;
      $('#mostrarFiltros').show();
      $('#ocultarFiltros').hide();
      $('.dtsp-panesContainer').hide();
      $('.dtsb-searchBuilder').hide();
    }

    // === FIN MOSTRAR - OCULTAR FILTRO ===
  </script>
</body>

</html>