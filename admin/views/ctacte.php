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
  <link rel="stylesheet" href="../../assets/css/stylesplus.css" />
  <!-- fontawesome PRO -->
  <script src="../../fw_pro.js" crossorigin="anonymous"></script>
  <!-- DataTable -->
  <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" rel="stylesheet" />
  <link href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.2.0/css/searchPanes.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.7.0/css/select.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/searchbuilder/1.6.0/css/searchBuilder.dataTables.min.css">
  <!-- <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.5.1/css/dataTables.dateTime.min.css"> -->
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="../../assets/rio_logo.png">
  <title>Rioplatense - Cta Cte</title>
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
      <h1>Cuenta Corriente</h1>
    </div>
    <div class="col-lg-8 ms-auto me-auto">
      <div class="table-responsive">
        <table id="tablaClientes" class="display responsive nowrap compact table-bordered" style="width: 100%">
          <thead class="text-center">
            <tr>
              <th class="text-center">CUIT/CUIL/ID</th>
              <th class="text-center">Nombre Institución</th>
              <th class="text-center">Adeudado</th>
              <th class="text-center">ID</th>
              <th class="text-center">Detalle</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- [ Main Content ] end -->

  <!-- FROMULARIO MODAL ALTA -->
  <!-- <form class="modal fade" id="formAlta" action="api/ctacte.php" method="POST"> -->
  <form class="modal fade" id="formAlta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLabel">Alta Comprobantes</h4>
          <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>

        <div class="col-lg-12">
          <div class="modal-body">
            <div class="form-group form-floating">
              <select name="cuit" class="form-select" id="altaCuit" required>
                <option value=""></option>
                <?php //Completa el SELECT on los datos de la tabla CLUBS
                $select = mysqli_query($con, "SELECT * FROM clubs ORDER BY institucion");
                while ($clubs = mysqli_fetch_row($select)) {
                ?>
                  <option value="<?php echo $clubs[1] ?>"><?php echo $clubs[2] ?></option>
                <?php } ?>
              </select>
              <label for="floatingSelect">Club</label>
            </div>

            <div class="form-group form-floating">
              <select name="tipoComprobante" class="form-select" id="altaTipoComprobante" onchange="desabilita(value)" required>
                <option value=""></option>
                <option value="Ticket">Ticket - Generar deuda</option>
                <option value="Recibo">Recibo - Cancelar deuda</option>
                <option value="Debito">Debito - Aumenta deuda</option>
                <option value="Credito">Credito - Disminuye deuda</option>
              </select>
              <label for="floatingSelect">Tipo Comprobante</label>
            </div>

            <div class="form-floating mb-3">
              <input type="date" class="form-control" name="fechaAlta" value="<?php echo date('Y-m-d') ?>" id="altaFechaAlta" placeholder="Fecha del comprobante" required>
              <label for="floatingInput">Fecha del comprobante</label>
            </div>

            <div class="form-group form-floating">
              <select name="concepto" class="form-select" id="concepto" required>
                <option value=""></option>
                <option value="AFILIACION">AFILIACION</option>
                <option value="AFILIACION">AFILIACION CLUB</option>
                <option value="AFILIACION">AFILIACION LIGA</option>
                <option value="LICENCIAS">LICENCIAS</option>
                <option value="PASES">PASES</option>
                <?php //Completa el SELECT on los datos de la tabla CLUBS
                $select = mysqli_query($con, "SELECT * FROM torneo ORDER BY nombretorneo");
                while ($torneo = mysqli_fetch_row($select)) {
                ?>
                  <option value="<?php echo $torneo[1] ?>"><?php echo $torneo[1] ?></option>
                <?php } ?>
              </select>
              <label for="floatingSelect">Concepto</label>
            </div>
            <div class="form-floating mb-3">
              <input type="number" class="form-control" name="monto" id="altaMonto" placeholder="Monto" required>
              <label for="floatingInput">Monto</label>
            </div>

            <!-- datos CtaCte -->
            <div class="SeccionCtaCte form-row">
              <div class="form-group form-floating col-md-6">
                <select name="forma_pago" class="form-select recibos" id="altaForma_pago" required>
                  <option value=""></option>
                  <option value="Depsito">Deposito</option>
                  <option value="Efectivo">Efectivo</option>
                  <option value="Transferencia">Transferencia</option>
                </select>
                <label for="floatingSelect">Forma de pago</label>
              </div>

              <div class="form-floating mb-3 col-md-6">
                <input type="text" class="form-control recibos" name="num_comp_pago" id="altaNum_comp_pago" placeholder="Numero comprobante">
                <label for="floatingInput">Numero comprobante</label>
              </div>

              <div class="form-floating mb-3 col-md-6">
                <input type="date" class="form-control recibos" name="fecha_pago" id="altaFecha_pago" placeholder="Fecha de pago" required>
                <label for="floatingInput">Fecha de pago</label>
              </div>

              <div class="form-floating mb-3 col-md-6">
                <input type="text" class="form-control recibos" name="entidad_pago" id="altaEntidad_pago" placeholder="Monto">
                <label for="floatingInput">Entidad</label>
              </div>
              <div class="form-floating mb-3 col-md-6">
                <input type="text" class="form-control recibos" name="id_depositante" id="consultarId_depositante" placeholder="CUIT/CUIL a facturar">
                <label for="floatingInput">CUIT/CUIL a facturar</label>
              </div>

              <div class="form-floating mb-3 col-md-6">
                <input type="text" class="form-control recibos" name="num_recibo" id="consultarNum_recibo" placeholder="N° de Recibo Oficial">
                <label for="floatingInput">N° de Recibo Oficial</label>
              </div>
            </div>

            <!-- ACTUALIZAR y VER FOTO -->
            <div class="custom-file mb-2">
              <input type="file" class="custom-file-input recibos" name="archivo" id="consultaSubirfoto" onChange="onLoadConsultaImage(event.target.files)" accept="image/jpeg,image/png,image/jpg,.pdf">
              <label class=" custom-file-label" for="consultaSubirfoto" id="nombreConsultaArchivo">Elija comprobante de pago JPEG-JPG-PNG-PDF</label>
            </div>

            <div class="form-floating mb-3 col-md-13">
              <textarea name="comentarios" class="form-control" placeholder="altaComentarios" id="altaComentario" style="height: 100px"></textarea>
              <label for="altaComentario">Comentarios</label>
            </div>

          </div>

          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-bs-dismiss="modal" id="botonCancel">
              Cancelar
            </button>
            <button class="btn btn-primary btn-alta" type="submit" id="botonAceptar">Aceptar</button>
          </div>

          <div class="ocultarInputOpcion">
            <input name="opcion" type="text" value="4">
          </div>

        </div>
      </div>
    </div>
  </form>
  <!-- FIN FROMULARIO MODAL ALTA -->


  <!-- <script src="https://code.jquery.com/jquery-3.6.1.js"></script> -->
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
  <script src="  https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
  <!-- <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script> -->
  <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
  <!-- <script src="https://cdn.datatables.net/searchpanes/2.1.0/js/dataTables.searchPanes.min.js"></script> -->
  <script src="https://cdn.datatables.net/searchpanes/2.2.0/js/dataTables.searchPanes.min.js"></script>
  <!-- <script src="https://cdn.datatables.net/select/1.5.0/js/dataTables.select.min.js"></script> -->
  <script src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.min.js"></script>
  <script src="https://cdn.datatables.net/colreorder/1.6.1/js/dataTables.colReorder.min.js"></script>
  <!-- <script src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script> -->
  <script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/rowgroup/1.3.0/js/dataTables.rowGroup.min.js"></script>
  <script src="https://cdn.datatables.net/searchbuilder/1.4.0/js/dataTables.searchBuilder.min.js"></script>
  <!-- <script src="https://cdn.datatables.net/datetime/1.5.1/css/dataTables.dateTime.min.css"></script> -->


  <!-- Librerias para exportar la tabla a distintos documentos -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <!-- <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script> -->
  <!-- <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script> -->
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>


  <script src="../../js/logout.js"></script>

  <script>
    var id = '';
    var cuit = 0;
    var opcion = '';
    var saldo = 0;
    var tabla = 'ctacte';
    var table;
    var institucion = '';
    var tipoCbte = '';

    $(document).ready(function() {
      listar();
      // detalle();
    });

    // === CARGA LA TABLA CON DATOS - LECTURA TABLA GENERAL ===
    // Accede y vuelca los datos del array en la tabla
    var listar = function() {
      opcion = 0;
      table = $("#tablaClientes").DataTable({
        ajax: {
          method: "GET",
          url: "../../api/ctacte.php",
          data: {
            opcion: opcion
          },
        },
        columns: [{
            data: "cuit"
          },
          {
            data: "institucion"
          },
          {
            data: "saldo"
          },
          {
            data: "id"
          },
          {
            defaultContent: "<button type='button' class='btn btn-info btn-circle btn-sm btnInfo'><i class='fas fa-info-circle'></i></button>	<button type='button' class='btn btn-danger btn-circle btn-sm btnDel'><i class='fas fa-trash'></i></button>"
          }
        ],
        // ESTILOS DE LA TABLA
        dom: '"QBfrtilp"',
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
          buttons: {
            colvis: "Seleccionar Columnas",
          },
        },
        columnDefs: [{
            targets: [3],
            visible: false,
          },
          // fija la columna acciones en la tabla
          {
            responsivePriority: 1,
            targets: 0
          },
          {
            responsivePriority: 2,
            targets: -1
          },
        ],

        // Ordenamiento por columna
        order: [1, 'asc'],

        createdRow: function(row, data, index) {
          $("td", row).eq(0).css({
            "text-align": "center",
          });
          $("td", row).eq(2).css({
            "text-align": "end",
          });
          $("td", row).eq(3).css({
            "text-align": "center",
          });
        },
      });
      obtener_data_info("#tablaClientes tbody", table);
      obtener_data_borrar("#tablaClientes tbody", table);
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===


    // Obtiene el ID para mostrar datos
    var obtener_data_info = function(tbody, table) {
      $(tbody).on("click", "button.btnInfo", function() {
        var data = table.row($(this).parents("tr")).data();
        // obtiene los valore para CIUT e INSTITUCION y SALDO
        cuit = data['cuit'];
        institucion = data['institucion'];
        // Almacena las variable en el LOCAL STORAGE
        var cuit_localStorage = cuit;
        var institucion_localStorage = institucion;
        localStorage.almacenarCuit_CtaCte = cuit_localStorage;
        localStorage.almacenarInstitucion_CtaCte = institucion_localStorage;

        location.href = "ctacte_detalle.php";
      });
    }

    // Obtiene el ID para Eliminar un dato
    var obtener_data_borrar = function(tbody, table) {
      $(tbody).on("click", "button.btnDel", function() {
        var data = table.row($(this).parents("tr")).data();
        cuit = data['cuit'];
        eliminarCtaCte(cuit);
      });
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===


    // === ALTA de DATOS ===
    function altaNuevo() {
      // borra el formulario

      document
        .getElementById('nombreConsultaArchivo')
        .innerHTML = 'comprobante de pago JPEG-JPG-PNG-PDF';

      $("#formAlta").trigger("reset");
      $(".form-control").prop("disabled", false);
      $(".form-select").prop("disabled", false);
      $("#botonAceptar").show();
      $("#formAlta").modal("show");
    }
    var formularioAlta = document.getElementById("formAlta");
    document.getElementById("formAlta").addEventListener("submit", function(e) {

      e.preventDefault();

      var datos = new FormData(formularioAlta);
      // envia los datos a crear en la base de datos
      fetch('../../api/ctacte.php', {
          method: "POST",
          body: datos,
          headers: {
            Accept: "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          $("#formAlta").modal("hide");
          if (datos == 1) {
            Swal.fire({
              icon: "success",
              title: "Ok!",
              text: "Dato ingresados con exito!",
            }).then((result) => {
              refresh()
            });
          } else {
            Swal.fire({
              icon: "error",
              title: "Ups..!",
              text: datos,
            });
          }
        })
        .catch((error) => {
          $("#formAlta").modal("hide");
          console.error("Error en la solicitud:", error);
          Swal.fire({
            icon: "error",
            title: "Error",
            text: "Hubo un error SQL al intentar el alta!. Por favor, inténtalo de nuevo.",
          });
        });
    });

    // Desabilita determinado inputs dependiendo si es LBF o Recibo
    function desabilita(value) {
      if (value == 'Ticket' || value == 'Debito' || value == 'Credito') {
        $(".recibos").prop('disabled', true);
      } else if (value == 'Recibo') {
        $(".recibos").prop('disabled', false);
      }
    }

    // == ELIMINAR UNA CTACTE ==
    var nombre = '';
    async function eliminarCtaCte(cuit) {
      var userPass = <?php echo $user['password'] ?>;
      opcion = 1;
      // consulta la institución a eliminar
      await fetch(`../../api/ctacte.php?cuit=${cuit}&opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          // Selecciona la variable INSTITUCION segun tabla ===
          nombre = datos['data'][0].institucion;
        });

      // solicita password para eliminar
      const {
        value: checkPassword
      } = await Swal.fire({
        icon: "warning",
        title: 'Atención!',
        text: "Esta por borrar la Cta Cte de: " + nombre,
        input: 'password',
        inputLabel: 'Ingrese su Password para eliminar',
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
        // BORRA CTA CTE
        opcion = 8;
        fetch(`../../api/ctacte.php?cuit=${cuit}&opcion=${opcion}`, {
            method: "GET",
            headers: {
              Accept: "application/json",
              "Content-Type": "application/json",
            },
          })
          .then((respuesta) => respuesta.json())
          .then((datos) => {
            if (datos == 1) {
              Swal.fire({
                icon: "success",
                title: "Ok!",
                text: "Eliminación con exito!",
              }).then((result) => {
                refresh();
              });
            } else {
              Swal.fire({
                icon: "error",
                title: "Ups..!",
                text: "El dato seleccionado no pudo eliminarse!",
              });
            }
          })
      } else if (checkPassword == '' || checkPassword != userPass) {
        Swal.fire({
          icon: 'info',
          title: 'Info..!',
          text: 'La password es incorrecta!',
        });
      }
    }
    // == FIN ELIMINAR UNA CTACTE ==

    // == CARGAR ARCHIVO COMPROBANTES ==
    function onLoadConsultaImage(files) {
      if (files[0].name && files[0]) {
        document
          .getElementById('nombreConsultaArchivo')
          .innerHTML = files[0].name;
      }
    }
    // == FIN CARGAR ARCHIVO COMPROBANTES ==

    function refresh() {
      table.ajax.reload(null, false);
    }

    // function recargarPagina() {
    //   window.location.reload();
    // }
  </script>
</body>

</html>