<?php include('../../modulos/encabezado_user_admin.php'); ?>


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
  <!-- CSS loading -->
  <link rel="stylesheet" href="../../assets/css/loading.css" />
  <!-- fontawesome PRO -->
  <script src="../../fw_pro.js" crossorigin="anonymous"></script>
  <!-- DataTable -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.1.0/css/searchPanes.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.5.0/css/select.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.6.1/css/colReorder.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" />
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/rowgroup/1.3.0/css/rowGroup.dataTables.min.css">
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="../../assets/rio_logo.png">
  <title>Rioplatense - Registro de Ingresos</title>
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
  .form-floating>.form-control {
    height: calc(1.5em + 2.25rem + 4px);
  }

  /*oculta boton de ALTA  */
  .opciones .mas {
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

  <!-- toma el tipo de acceso y password del usuario -->
  <div class="ocultarInputOpcion">
    <input name="tipoAcceso" id="tipoAcceso" type="text" value="<?php echo $user['acceso'] ?>">
    <input type="text" name="userPass" id="userPass" value="<?php echo $user['password'] ?>">
  </div>


  <!-- [ Main Content ] start -->
  <div class="pcoded-main-container mt-4">
    <div class="text-center">
      <h1>Movimientos de Ingresos</h1>
    </div>
    <div class="col-lg-12">
      <div class="table-responsive">
        <table id="tablaClientes" class="display responsive nowrap compact table-bordered">
          <thead class="text-center">
            <tr>
              <th>DNI/ID</th>
              <th>Nombre</th>
              <th>Institucion</th>
              <th>Fecha Ingreso</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- [ Main Content ] end -->

  <!-- FROMULARIO MODAL BORRAR INGRESOS -->
  <form class="modal fade" id="formModalBorrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h1 class="modal-title text-rigth" id="exampleModalLabel">Eliminar Ingresos</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="col-lg-12 modal-body">
          <!-- si el usuario es administrador se pregunta si elimina todo o algun club en particular -->
          <?php if ($user['acceso'] == 'administrador') : ?>
            <p class="ml-4 font-weight-bold text-danger">Esta por eliminar registros de INGRESOS. Podrá eliminar TODOS o SOLO los que seleccione:</p>
            <div class="form-group col-md-12 form-floating">
              <select name="yearbaja" class="form-control form-control-user" id="yearbaja">
                <option value=""></option>
                <option value="0">Eliminar TODOS</option>
                <?php
                $select = mysqli_query($con, "SELECT EXTRACT(YEAR 
                FROM ingresos.fechaingreso) FROM ingresos GROUP BY EXTRACT(YEAR 
                FROM ingresos.fechaingreso) ORDER BY EXTRACT(YEAR 
                FROM ingresos.fechaingreso)");
                while ($torneo = mysqli_fetch_row($select)) { ?>
                  <option value="<?php echo $torneo[0] ?>"><?php echo $torneo[0] ?></option>
                <?php  }
                ?>
              </select>
              <label for="floatingSelect">Seleccionar opción</label>
            </div>
          <?php endif; ?>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">
              Cancel
            </button>
            <button class="btn btn-primary" type="submit">Aceptar</button>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!-- FIN FROMULARIO MODAL BORRAR INGRESOS -->

  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
  <!-- libreria para mover columnas -->
  <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.datatables.net/searchpanes/2.1.0/js/dataTables.searchPanes.min.js"></script>
  <script src="https://cdn.datatables.net/select/1.5.0/js/dataTables.select.min.js"></script>
  <script src="https://cdn.datatables.net/colreorder/1.6.1/js/dataTables.colReorder.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/rowgroup/1.3.0/js/dataTables.rowGroup.min.js"></script>
  <!-- Librerias para exportar la tabla a distintos documentos -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

  <script src="../../js/logout.js"></script>

  <script>
    var opcion = '';
    var userPass = $("#userPass").val();
    var tipoAcceso = $("#tipoAcceso").val();
    // === CARGA LA TABLA CON DATOS ===
    $(document).ready(function() {
      opcion = 0;
      // Tabla Responsive y Exporta la tabla a EXCEL, PDF y PRINT
      fetch(`../../api/registros_ingresos.php?opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          console.log(datos);
          // Recorre la ARRAY
          for (var dato of datos) {
            consultarDatosATabla(dato);
          }
          $("#tablaClientes").DataTable({
            dom: '"Bfrtilp"',
            language: {
              lengthMenu: "Mostrar _MENU_ registros por página",
              zeroRecords: "No se encuentran registros - disculpe!",
              info: "Mostrando pagina _PAGE_ de _PAGES_",
              infoEmpty: "No records available",
              infoFiltered: "(filtrado de _MAX_ registros totales)",
              search: "Buscar:",
              paginate: {
                next: "Siguiente",
                previous: "Previo",
              },
            },
            "order": [
              [3, 'des'],
            ],
            buttons: ["excelHtml5", "pdfHtml5", "print"],
          });
        });
    });

    // Accede y vuelca los datos del array en la tabla
    function consultarDatosATabla(dato) {
      $("#tablaClientes tbody").append(
        `<tr>
              <td>${dato.dniingreso}</td>
              <td>${dato.nombreingreso} ${dato.apellidoingreso}</td>
              <td>${dato.institucioningreso}</td>
              <td>${dato.fechaingreso}</td>
        </tr>`
      );
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===

    // ELIMINAR ARCHIVO
    function eliminarTodos() {
      $(".form-control").prop('disabled', false);
      // aviso previo antes de eliminar todos los usuarios
      Swal.fire({
        title: 'Esta seguro?',
        text: "Esta por depurar REGISTROS de INGRESOS. A continuación se le solicitará su password y luego deberá seleccionar el año a eliminar!!!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
      }).then((result) => {
        if (result.isConfirmed) {
          eliminar()
        };
      });
    }

    // Eliminacion por el Administrador
    async function eliminar() {

      // solicita password para eliminar
      const {
        value: checkPassword
      } = await Swal.fire({
        title: 'Entre su Password',
        input: 'password',
        inputLabel: 'Ingrese su Password para validar',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar',
        inputPlaceholder: 'Entre su password',
        inputAttributes: {
          maxlength: 50,
          autocapitalize: 'off',
          autocorrect: 'off'
        }
      })
      if (checkPassword == userPass) {
        $('#formModalBorrar').modal('show');
      } else if (checkPassword == '') {
        Swal.fire({
          icon: 'info',
          title: 'Info..!',
          text: 'Debe introducir su password para poder eliminar',
        });
      } else {
        Swal.fire({
          icon: 'error',
          title: 'Ups..!',
          text: 'La password es incorrecta!',
        });
      };
    }

    // var formularioEliminar = document.getElementById('formModalBorrar');
    document.getElementById('formModalBorrar').addEventListener('submit', function(e) {
      e.preventDefault();
      //     var datos = new FormData(formularioEliminar);
      $('#formModalBorrar').modal('hide');
      opcion = 1;
      var yearbaja = $("#yearbaja").val();
      if (yearbaja === '') {
        Swal.fire({
          icon: 'error',
          title: 'Ups..!',
          text: 'Debe seleccionar una opción a ejecutar!',
        });
      } else {
        fetch(
            `../../api/registros_ingresos.php?opcion=${opcion}&yearbaja=${yearbaja}`, {
              method: 'GET',
              headers: {
                Accept: "application/json",
                "Content-Type": "application/json",
              },
            },
          )
          .then((respuesta) => respuesta.json())
          .then((datos) => {
            if (datos == 1) {
              Swal.fire({
                icon: 'success',
                title: 'Ok!',
                text: 'Los reguistros fueron eliminados!!',
              }).then((result) => {
                window.location.reload();
              });
            } else {
              Swal.fire({
                icon: 'error',
                title: 'Ups..!',
                text: datos,
              });
            };
          });
      }
    });
    // === FIN ELIMINAR TODO ===
  </script>
</body>

</html>