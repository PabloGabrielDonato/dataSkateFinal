<?php include('../../modulos/encabezado_user.php'); ?>

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
  <link rel="stylesheet" href="../../assets/css/stylesplus.css" />
  <!-- fontawesome PRO -->
  <script src="../../fw_pro.js" crossorigin="anonymous"></script>
  <!-- DataTable -->
  <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" rel="stylesheet" />
  <link href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" rel="stylesheet" />
  <!-- <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.dataTables.min.css"> -->
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.2.0/css/searchPanes.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.7.0/css/select.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/searchbuilder/1.6.0/css/searchBuilder.dataTables.min.css">
  <!-- <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.5.1/css/dataTables.dateTime.min.css"> -->
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="../../assets/rio_logo.png">
  <title>Rioplatense - Cta Cte usuarios</title>
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
  .encabezado {
    background: gainsboro;
  }

  .detalle td,
  .encabezado th {
    font-size: 14px;
  }

  .dtrg-start td {
    background-color: #F0FFF0 !important;
    font-weight: 700;
  }

  .dtrg-start :hover {
    background-color: #F0FFFF !important;
    cursor: pointer;
  }

  .delete {
    display: none;
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
  <div class="pcoded-main-container mt-4">
    <div class="text-center pb-3">
      <h1>Cuenta Corriente: <span><?php echo $user['institucion'] ?></span></h1>
    </div>

    <div class="encabezado">
      <div class="d-flex justify-content-center">
        <h5 class="institucionTexto p-3"></h5>
        <h5 class="CUITTexto p-3"></h5>
        <h5 class="saldoTexto p-3"></h5>
      </div>
    </div>

    <div class="col-lg-12 ms-auto me-auto">
      <div class="table-responsive">
        <table id="detalleCtaCte" class="display responsive nowrap compact table-bordered" style="width: 100%">
          <thead class="text-center encabezado">
            <tr>
              <th class="text-center">Instirucion</th>
              <th class="text-center">Concepto</th>
              <th class="text-center">Tipo Comp</th>
              <th class="text-center">N° Transaccion</th>
              <th class="text-center">Fecha Comp</th>
              <th class="text-center">Fecha Pago</th>
              <th class="text-center">Forma Pago</th>
              <th class="text-center">Comp. Pago</th>
              <th class="text-center">DNI</th>
              <th class="text-center">Nombre</th>
              <th class="text-center">Referencia</th>
              <th class="text-center">Adeudado</th>
              <th class="text-center">Pagado</th>
              <th class="text-center">CUIT</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- [ Main Content ] end -->

  <script src=" https://code.jquery.com/jquery-3.7.0.js"></script>

  <!-- Boostrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Required Js -->
  <script src="../../assets/js/vendor-all.min.js"></script>
  <script src="../../assets/js/plugins/bootstrap.min.js"></script>
  <script src="../../assets/js/pcoded.min.js"></script>

  <!-- Apex Chart -->
  <script src="../../assets/js/plugins/apexcharts.min.js"></script>

  <!-- custom-chart js -->
  <script src="../../assets/js/pages/dashboard-main.js"></script>

  <!-- Datatable -->
  <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.datatables.net/searchpanes/2.2.0/js/dataTables.searchPanes.min.js"></script>
  <script src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.min.js"></script>
  <script src="https://cdn.datatables.net/colreorder/1.6.1/js/dataTables.colReorder.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/rowgroup/1.3.0/js/dataTables.rowGroup.min.js"></script>
  <script src="https://cdn.datatables.net/searchbuilder/1.4.0/js/dataTables.searchBuilder.min.js"></script>
  <!-- <script src="https://cdn.datatables.net/datetime/1.5.1/css/dataTables.dateTime.min.css"></script> -->

  <!-- Librerias para exportar la tabla a distintos documentos -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

  <script src="../../js/logout.js"></script>


  <script>
    var id = '';
    // var cuit = localStorage.almacenarCuit_CtaCte; //obtiene el valor del LOCAL STORAGE
    var cuit = <?php echo $user['cuit'] ?>;
    var opcion = '';
    var saldo = 0;
    var tabla = 'ctacte';
    var table;
    var tipoCbte = '';

    $(document).ready(function() {
      detalle();
    });

    // === CARGA LA TABLA CON DATOS - LECTURA TABLA GENERAL ===
    // Accede y vuelca los datos del array en la tabla
    var detalle = function() {
      opcion = 1;
      // muestra el resumen de la CtaCte
      var collapsedGroups = {};

      table = $("#detalleCtaCte").DataTable({
        destroy: true,
        ajax: {
          method: "GET",
          url: "../../api/ctacte.php?",
          data: {
            opcion: opcion,
            cuit: cuit,
          },
        },
        columns: [{
            data: "institucion"
          }, {
            data: "concepto"
          },
          {
            data: "tipo_comprobante"
          },
          {
            data: "id"
          },
          {
            data: "fecha_alta"
          },
          {
            data: "fecha_pago"
          },
          {
            data: "forma_pago"
          },
          {
            data: "num_comp_pago"
          },
          {
            data: "dnipatinador"
          },
          {
            data: "nombrepatinador"
          },
          {
            data: "tipolicencia"
          },
          {
            data: "adeudado"
          },
          {
            data: "pagado"
          },
          {
            data: "cuit"
          },
        ],
        // dom: '"QBfrt"',
        dom: '"QBfrtil"',
        buttons: ["excelHtml5", "pdfHtml5", "print"],
        language: {
          zeroRecords: "No se encontraron resultados",
          lengthMenu: "Mostrar _MENU_ registros",
          infoFiltered: "(filtrado de un total de _MAX_ registros)",
          info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
          zeroRecords: "No se encontraron resultados",
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
        },
        // Estilo a las celdas
        createdRow: function(row, data, index) {
          $("td", row).eq(0).css({
            "text-align": "center",
          });
          $("td", row).eq(1).css({
            "text-align": "center",
          });
          $("td", row).eq(2).css({
            "text-align": "center",
          });
          $("td", row).eq(3).css({
            "text-align": "center",
          });
          $("td", row).eq(6).css({
            "text-align": "center",
          });
          $("td", row).eq(8).css({
            "text-align": "lefht",
          });
          $("td", row).eq(9).css({
            "text-align": "right",
          });
          $("td", row).eq(10).css({
            "text-align": "right",
          });
          $("td", row).eq(11).css({
            "text-align": "center",
          });
        },
        // Oculta columnas
        columnDefs: [{
            targets: [0, 1, 13],
            visible: false,
          },
          // fija la columna acciones en la tabla
          {
            responsivePriority: 1,
            targets: 0
          },
          {
            responsivePriority: 2,
            targets: -2
          },
          {
            responsivePriority: 3,
            targets: -3
          },
        ],
        fixedHeader: {
          header: true,
        },
        lengthMenu: [
          [200, 500, -1],
          [200, 500, "All"],
        ], //indica opciones de renglon en pantalla
        // Scrool de pantalla
        deferRender: true,
        scrollX: true,
        scrollY: 700,
        scrollCollapse: true,
        scroller: true,
        // Tabla responsive
        responsive: true,
        // Ordenamiento por columna
        orderFixed: [1, 'asc'],

        rowGroup: {
          dataSrc: [0],
          // agrupamiento de filas

          startRender: function(rows, group) {
            var collapsed = !!collapsedGroups[group];

            // verifica si las filas estan colapsadas
            rows.nodes().each(function(r) {
              r.style.display = 'none';
              if (collapsed) {
                r.style.display = '';
              }
            });

            // suma la columna deuda
            var deuda = rows
              .data()
              .pluck(6)
              .reduce(function(a, b) {
                return a + b.replace(/[^\d]/g, '') * 1;
              }, 0) / 100;

            // suma la columna pago
            var pago = rows
              .data()
              .pluck(7)
              .reduce(function(a, b) {
                return a + b.replace(/[^\d]/g, '') * 1;
              }, 0) / 100;
            // obtiene el saldo de la CtaCte
            var saldo = deuda - pago;
            // muestra información en el renglon agrupado
            if ((deuda - pago) != 0) {
              return $('<tr/>')
                .append('<td colspan="12">' + group + ' - Saldo: ' + $.fn.dataTable.render.number(',', '.', 2).display(saldo) + ' (' + rows.count() + ')' + '<span style="color: #CD5C5C; font-size:20px; margin-left: 1%;"><i class="fas fa-times"></i></span>' + '</td>')
                .attr('data-name', group)
                .toggleClass('collapsed', collapsed);
            } else {
              return $('<tr/>')
                .append('<td colspan="12">' + group + ' - Saldo: ' + $.fn.dataTable.render.number(',', '.', 2).display(saldo) + ' (' + rows.count() + ')' + '<span style="color:green; font-size:20px; margin-left: 1%;"><i class="fas fa-check"></i></span>' + '</td>')
                .attr('data-name', group)
                .toggleClass('collapsed', collapsed);
            }
          },
        },
      });

      consultarSaldo()

      // agrupa o desagrupa cuando se hace click sobre el encabezado del grupo
      $('#detalleCtaCte tbody').on('click', 'tr.dtrg-start', function() {
        var name = $(this).data('name');
        collapsedGroups[name] = !collapsedGroups[name];
        table.draw(true);
      });
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===

    // === CONSULTA SALDO EN CTACTE DE LA INSTITUCION ===
    function consultarSaldo() {
      opcion = 2;
      fetch(
          `../../api/ctacte.php?cuit=${cuit}&opcion=${opcion}`, {
            method: 'GET',
            headers: {
              Accept: "application/json",
              "Content-Type": "application/json",
            },

          },
        )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          // Muestra el saldo segun el CUIT en el encabezado del MODAL
          const saldoTexto = document.querySelector(".saldoTexto");
          saldoTexto.innerHTML = "SALDO TOTAL: " + '<span id="saldo" style="font-size: 20px;">' + datos[0]['saldo'] + '</span>';

          if (datos[0]['saldo'] > '0') {
            document.querySelector('#saldo').style.color = 'red';
          } else {
            document.querySelector('#saldo').style.color = 'green';
          }
        });
    }
    // === FIN CONSULTA SALDO EN CTACTE DE LA INSTITUCION ===

    function refresh() {
      table.ajax.reload(null, false);
    }
  </script>

</body>

</html>