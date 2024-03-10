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
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
  <link rel="stylesheet" href="../../assets/css/stylesplus.css" />
  <!-- fontawesome PRO -->
  <script src="../../fw_pro.js" crossorigin="anonymous"></script>
  <!-- DataTable -->
  <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
  <link href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="../../assets/logoDataSkt.png">
  <title>Rioplatense - Instituciones</title>
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
  .btn-info {
    color: #fff;
  }

  .card-header {
    padding: 0;
    background-color: #F8F8FF;
  }

  .card {
    border-top: 3px solid rgb(0, 0, 255, 0.2);
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
    <div class="text-center">
      <h1>Instituciones</h1>
    </div>
    <div class="col-lg-12">
      <div class="table-responsive">
        <table id="tablaClientes" class="display responsive nowrap compact table-bordered" style="width: 100%">
          <thead class="text-center">
            <tr>
              <th class="text-center">CUIT/CUIL/ID</th>
              <th class="text-center">Nombre Institución</th>
              <th class="text-center">Dirección</th>
              <th class="text-center">Localidad</th>
              <th class="text-center">Telefono</th>
              <th class="text-center">EMAIL</th>
              <th class="text-center">WEB</th>
              <th class="text-center">Tipo Afiliaciones</th>
              <th class="text-center">id</th>
              <th class="text-center">Acciones</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- [ Main Content ] end -->

  <!-- FROMULARIO MODAL CONSULTA/EDICION -->
  <form class="modal fade" id="modalConsulta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLabel">Informacion Institucion</h4>
          <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="col-lg-12">
          <div class="form-group classid">
            <input name="id" type="number" class="form-control form-control-user ocultarID" id="consultarID" placeholder="id" />
          </div>
          <div class="form-group form-floating">
            <input name="cuit" type="number" class="form-control form-control-user" id="consultarCuit" placeholder="CUIT" />
            <label for="floatingInput">CUIT/CUIL</label>
          </div>

          <div class="form-group form-floating">
            <input name="institucion" type="text" class="form-control form-control-user" id="consultarInstitucion" placeholder="Nombre Institucion" required />
            <label for="floatingInput">Nombre Institucion</label>
          </div>
          <div class="form-group form-floating">
            <input name="direccion" type="text" class="form-control form-control-user" id="consultarDireccion" placeholder="Direccion" required />
            <label for="floatingInput">Direccion</label>
          </div>

          <div class="form-group form-floating">
            <input name="localidad" type="text" class="form-control form-control-user" id="consultarLocalidad" required />
            <label for="floatingInput">Localidad</label>
          </div>

          <div class="form-row">
            <div class="form-group col-md-5 form-floating">
              <input name="telefono" type="number" class="form-control form-control-user" id="consultarTelefono" placeholder="Telefono" />
              <label for="floatingInput">Telefono</label>
            </div>
            <div class="form-group col-md-7 form-floating">
              <input name="email" type="email" class="form-control form-control-user" id="consultarEmail" placeholder="Email" />
              <label for="floatingInput">Email</label>
            </div>
          </div>

          <div class="form-group form-floating">
            <input name="web" type="text" class="form-control form-control-user" id="consultarWeb" placeholder="Pagina WEB o Red Social" />
            <label for="floatingInput">Pagina WEB o Red Social</label>
          </div>

          <div class="form-group form-floating">
            <select name="afiliaciones" class="form-select" id="consultarafiliaciones" required>
              <?php //Completa el SELECT on los datos de la tabla CLUBS
              $select = mysqli_query($con, "SELECT * FROM afiliacionclub ORDER BY tipoafiliacion");
              while ($afiliacion = mysqli_fetch_row($select)) {
              ?>
                <option value="<?php echo $afiliacion[1] ?>"><?php echo $afiliacion[1] ?></option>
              <?php } ?>
            </select>
            <label for="floatingSelect">Seleccionar tipo de Afiliaciones</label>
          </div>

          <div>
            <label class="labelDatosAdicionales mb-0"><b>Alta:</b>
              <input name="datosAlta" type="text" class="datosAdicionales" id="datosAlta" disabled />
            </label>
            <label class="labelDatosAdicionales"><b>Ultima modificación:</b>
              <input name="datosMod" type="text" class="datosAdicionales" id="datosMod" disabled />
            </label>
          </div>

          <div class="ocultarInputOpcion">
            <input name="opcion" type="text" value="2">
          </div>

          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-bs-dismiss="modal" id="botonCancel">
              Cancelar
            </button>
            <button class="btn btn-primary btn-modificar" type="submit" id="botonAceptar">Aceptar</button>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!-- END CONSULTA/EDICION -->

  <!-- FROMULARIO MODAL ALTA -->
  <form class="modal fade" id="formAlta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLabel">Alta Institucion</h4>
          <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="col-lg-12">
          <div class="form-group classid">
            <!-- <input name="id" type="number" class="form-control form-control-user ocultarID" id="consultarID" placeholder="id" /> -->
          </div>
          <div class="form-group form-floating">
            <input name="cuit" type="number" class="form-control form-control-user" id="altaCuit" placeholder="CUIT" required />
            <label for="floatingInput">CUIT/CUIL/ID</label>
          </div>

          <div class="form-group form-floating">
            <input name="institucion" type="text" class="form-control form-control-user" id="altaInstitucion" placeholder="Nombre Institucion" required />
            <label for="floatingInput">Nombre Institucion</label>
          </div>

          <div class="form-group form-floating">
            <input name="direccion" type="text" class="form-control form-control-user" id="altaDireccion" placeholder="Direccion" required />
            <label for="floatingInput">Direccion</label>
          </div>

          <div class="form-group form-floating">
            <input name="localidad" type="text" class="form-control form-control-user" id="altaLocalidad" placeholder="Localidad" required />
            <label for="floatingInput">Localidad</label>
          </div>

          <div class="form-row">
            <div class="form-group col-md-5 form-floating">
              <input name="telefono" type="number" class="form-control form-control-user" id="altaTelefono" placeholder="Telefono" />
              <label for="floatingInput">Telefono</label>
            </div>
            <div class="form-group col-md-7 form-floating">
              <input name="email" type="email" class="form-control form-control-user" id="altaEmail" placeholder="Email" />
              <label for="floatingInput">Email</label>
            </div>
          </div>

          <div class="form-group form-floating">
            <input name="web" type="text" class="form-control form-control-user" id="altaWeb" placeholder="Pagina WEB o Red Social" />
            <label for="floatingInput">Pagina WEB o Red Social</label>
          </div>

          <div class="form-group form-floating">
            <select name="afiliaciones" class="form-select" id="altaAfiliaciones" required>
              <option value=""></option>
              <?php //Completa el SELECT on los datos de la tabla CLUBS
              $select = mysqli_query($con, "SELECT * FROM afiliacionclub ORDER BY tipoafiliacion");
              while ($afiliacion = mysqli_fetch_row($select)) {
              ?>
                <option value="<?php echo $afiliacion[1] ?>"><?php echo $afiliacion[1] ?></option>
              <?php } ?>
            </select>
            <label for="floatingSelect">Seleccionar tipo de Afiliaciones</label>
          </div>

          <div class="ocultarInputOpcion">
            <input name="opcion" type="text" value="4">
          </div>

          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-bs-dismiss="modal" id="botonCancel">
              Cancelar
            </button>
            <button class="btn btn-primary btn-alta" type="submit" id="botonAceptar">Aceptar</button>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!-- FIN FROMULARIO MODAL ALTA -->

  <!-- Modal REGISTRO DE INSTITUCIONES-->
  <div class="modal fade" id="modalRegistro" data-bs-backdrop="static" data-bs-keyboard="false">
    <!-- <div class="modal-dialog modal-fullscreen"> -->
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title h4" id="exampleModalFullscreenLabel">Registro de Instituciones</h5>
          <button type="button" class="btn-close" onclick="borrarDatos()" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div>
            <h4>Datos del Club</h4>
            <div class="row col-12" id="datosClub" style="justify-content: center;"></div>
          </div>

          <div>
            <h4>Tecnicos</h4>
            <div class="row col-12" id="datosTecnicos" style="justify-content: center;"></div>
          </div>

          <div>
            <h4>Delegados</h4>
            <div class="row col-12" id="datosDelegados" style="justify-content: center;"></div>
          </div>

          <div>
            <h4>Información adicional del Club</h4>
            <div class="card support-bar badge-light-light shadow">
              <div class="card-body pb-0">
                <div>
                  <h2 class="m-0 text-muted num" data-val="" id="cantPadron"></h2>
                </div>
                <h6 class="text-muted">Patinadores Empadronados</h6>
              </div>
              <div class="card-footer bg-info text-white opacity-75">
                <div class="row text-center" id="licencias">
                </div>
              </div>
            </div>

            <div class="card support-bar badge-light-light shadow">
              <div class="card-body pb-0">
                <div>
                  <h2 class="m-0 text-muted num" data-val="" id="cantInscriptos"></h2>
                </div>
                <h6 class="text-muted">Patinadores Inscriptos en Torneos</h6>
              </div>
              <div class="card-footer bg-info text-white opacity-75">
                <div class="row text-center" id="torneos">
                </div>
              </div>
            </div>
          </div>

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="borrarDatos()">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- FIN Modal REGIDTRO DE INSTITUCIONES-->

  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>

  <!-- Required Js -->
  <script src="../../assets/js/vendor-all.min.js"></script>
  <script src="../../assets/js/plugins/bootstrap.min.js"></script>
  <script src="../../assets/js/pcoded.min.js"></script>

  <!-- Apex Chart -->
  <script src="../../assets/js/plugins/apexcharts.min.js"></script>

  <!-- custom-chart js -->
  <script src="../../assets/js/pages/dashboard-main.js"></script>

  <!-- Datatable -->
  <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>

  <!-- Librerias para exportar la tabla a distintos documentos -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

  <!-- Boostrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="js/lecturaTabla_general.js"></script> -->
  <script src="../../js/editarDatos_general.js"></script>
  <script src="../../js/altas_general.js"></script>
  <script src="../../js/eliminarByID.js"></script>
  <script src="../../js/eliminaTodo.js"></script>
  <script src="../../js/logout.js"></script>

  <script>
    var id = 0;
    var opcion = '';
    var tabla = 'institucion';

    // === CARGA LA TABLA CON DATOS - LECTURA TABLA GENERAL ===
    // Accede y vuelca los datos del array en la tabla
    $(document).ready(function() {
      listar();
    });

    // Accede y vuelca los datos del array en la tabla
    var listar = function() {
      opcion = 0;
      table = $("#tablaClientes").DataTable({
        ajax: {
          method: "GET",
          url: "../../api/clubs.php",
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
            data: "direccion"
          },
          {
            data: "localidad"
          },
          {
            data: "telefono"
          },
          {
            data: "email"
          },
          {
            data: "web"
          },
          {
            data: "tipoafiliacion"
          },
          {
            data: "id"
          },
          {
            defaultContent: "<button type='button' class='btn btn-info btn-circle btn-sm btnInfo'><i class='fas fa-info-circle'></i></button>	<button type='button' class='btn btn-primary btn-circle btn-sm btnEdit'><i class='fas fa-edit'></i></button></button>	<button type='button' class='btn btn-danger btn-circle btn-sm btnDel'><i class='fas fa-trash'></i></button></button></button>	<button type='button' class='btn btn-secondary btn-circle btn-sm btnVer'><i class='fas fa-eye'></i></button>"
          }
        ],
        // ESTILOS DE LA TABLA
        dom: '"Bfrtilp"',
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
        columnDefs: [
          // oculta columnas
          {
            targets: [8],
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
        createdRow: function(row, data, index) {
          $("td", row).eq(0).css({
            "text-align": "center",
          });
          $("td", row).eq(5).css({
            "text-align": "center",
          });
          $("td", row).eq(8).css({
            "text-align": "center",
          });
        }
      });
      obtener_data_editar("#tablaClientes tbody", table);
      obtener_data_info("#tablaClientes tbody", table);
      obtener_data_borrar("#tablaClientes tbody", table);
      obtener_data_registro("#tablaClientes tbody", table);
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===


    // Obtiene el ID para mostrar datos
    var obtener_data_info = function(tbody, table) {
      $(tbody).on("click", "button.btnInfo", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id'];
        consultarUnItem(id);
      });
    }

    // Obtiene el ID para editar datos
    var obtener_data_editar = function(tbody, table) {
      $(tbody).on("click", "button.btnEdit", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id'];
        consultarUnItem(id);
      });
    }

    // Obtiene el ID para Eliminar un dato
    var obtener_data_borrar = function(tbody, table) {
      $(tbody).on("click", "button.btnDel", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id'];
        eliminarCliente(id);
      });
    }

    // Obtiene el ID para Eliminar un dato
    var obtener_data_registro = function(tbody, table) {
      $(tbody).on("click", "button.btnVer", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id'];
        cuit = data['cuit'];
        registroInstituciones(id);
        registroTecnicos(id);
        registroDelegados(id);
        cantidadEmpadronados(cuit);
        licenciasEmpadronados(cuit);
        cantidadBuenaFe(cuit);
        patinadoresPorTorneo(cuit);
      });
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===

    // === CONSULTAR DATOS ===
    function consultarUnItem(id) {
      opcion = 1;
      $('#modalConsulta').modal('show');

      // Mustra formulario modo Info
      $(document).on("click", ".btnInfo", function() {
        $(".form-control").prop('disabled', true);
        $(".form-select").prop('disabled', true);
        $('#botonAceptar').hide();
        $(".labelDatosAdicionales").show();
      });

      // Muestra formulario modo Edición
      $(document).on("click", ".btnEdit", function() {
        $(".form-control").prop('disabled', false);
        $(".form-select").prop('disabled', false);
        $("#consultarCuit").prop('disabled', true);
        $(".labelDatosAdicionales").hide();
        $('#botonAceptar').show();
      });
      // consulta a base de datos según ID y opcion
      fetch(
          `../../api/clubs.php?id=${id}&opcion=${opcion}`, {
            method: 'GET',
            headers: {
              Accept: "application/json",
              "Content-Type": "application/json",
            },

          },
        )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          // Carga el formulario con los datos obtenidos
          $("#consultarID").val(datos[0].id);
          $("#consultarCuit").val(datos[0].cuit);
          $("#consultarInstitucion").val(datos[0].institucion);
          $("#consultarDireccion").val(datos[0].direccion);
          $("#consultarLocalidad").val(datos[0].localidad);
          $("#consultarTelefono").val(datos[0].telefono);
          $("#consultarEmail").val(datos[0].email);
          $("#consultarWeb").val(datos[0].web);
          $("#consultarafiliaciones").val(datos[0].tipoafiliacion);

          var alta = datos[0].nombrealta + ' ' + datos[0].apellidoalta + ' - ' + datos[0].newfechaalta
          if (datos[0].nombrealta === null || datos[0].nombrealta === '') {
            alta = "by System"
            $("#datosAlta").val(alta);
          } else {
            $("#datosAlta").val(alta);
          }

          var modificado = datos[0].nombremod + ' ' + datos[0].apellidomod + ' - ' + datos[0].newfechamod
          if (datos[0].nombremod === null || datos[0].nombremod === '') {
            modificado = "Sin modificacion"
            $("#datosMod").val(modificado);
          } else {
            $("#datosMod").val(modificado);
          }
        });
    }
    // === FIN CONSULTAR DATOS ===

    // === ACTUALIZA LOS DATOS en la BD ===
    var urlEdit = '../../api/clubs.php';
    // === FIN ACTUALIZAR DATOS ===

    // === ALTAS ===
    var urlAlta = '../../api/clubs.php';
    // === FIN Alta USUARIO ===

    // === Muestra el MODAL con la información de REGISTRO DE INSTITUCIONES ===
    //  === MUESTRA DATOS DEL CLUB ===
    function registroInstituciones(id) {
      opcion = 6;
      fetch(`../../api/clubs.php?id=${id}&opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          // console.log(datos)
          consultarDatosClub(datos);
        });
    }

    function consultarDatosClub(datos) {
      $("#datosClub").append(
        `<div class="col-md-3 col-xl-5">
                    <div class="card" style="font-size: larger;">
                        <div class="card-header">
                        <h4 class="card-title">Club: ${datos[0].institucion}</h4>
                        </div>
                        <div class="card-body">
                            <span>Dirección: ${datos[0].direccion}</span><br>
                            <span>Telefono: ${datos[0].telefono}</span><br>
                            <span>Web: ${datos[0].web}</span><br>
                            <span>Email: ${datos[0].email}</span>
                        </div>
                        </div>
                </div>`
      );
    }
    //  === FIN MUESTRA DATOS DEL CLUB ===

    // === MUESTRA DATOS DE LOS TECNICOS ===
    function registroTecnicos(id) {
      opcion = 7;
      fetch(`../../api/clubs.php?id=${id}&opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((resultado) => {
          // Recorre la ARRAY
          for (var tecnico of resultado) {
            consultarDatosTecnicos(tecnico);
          }
        });
    }

    function consultarDatosTecnicos(tecnico) {
      $("#datosTecnicos").append(
        `<div class="col-md-3 col-xl-6">
                    <div class="card" style="font-size: larger;">
                        <div class="card-header">
                        <h4 class="card-title"> ${tecnico.nombretecnico} ${tecnico.apellidotecnico}</h4>
                        </div>
                        <div class="card-body">
                            <span>Telefono: ${tecnico.telefono}</span><br>
                            <span>Email: ${tecnico.emailtecnico}</span><br>
                            <span>Cat.Licencia: ${tecnico.categoriatecnico}</span><br>
                        </div>
                        </div>
                </div>`
      );
    }
    // === FIN MUESTRA DATOS DE LOS TECNICOS ===

    // === MUESTRA DATOS DE LOS DELEGADOS ===
    function registroDelegados(id) {
      opcion = 8;
      fetch(`../../api/clubs.php?id=${id}&opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((result) => {
          // Recorre la ARRAY
          for (var delegado of result) {
            consultarDatosDelegados(delegado);
          }
        });
      $('#modalRegistro').modal('show');
    }

    function consultarDatosDelegados(delegado) {
      $("#datosDelegados").append(
        `<div class="col-md-3 col-xl-6">
                    <div class="card" style="font-size: larger;">
                        <div class="card-header">
                        <h4 class="card-title"> ${delegado.nombre} ${delegado.apellido}</h4>
                        </div>
                        <div class="card-body">
                            <span>Telefono: ${delegado.telefono}</span><br>
                            <span>Email: ${delegado.email}</span><br>
                            <span>Cargo: ${delegado.tipo}</span><br>
                        </div>
                        </div>
                </div>`
      );
    }
    // === FIN MUESTRA DATOS DE LOS DELEGADOS ===

    // === MUESTRA DATOS DE EMPADRONADOS ===
    function cantidadEmpadronados(cuit) {
      opcion = 9;
      fetch(`../../api/clubs.php?cuit=${cuit}&opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((resultado) => {
          var cantPadron = document.getElementById('cantPadron');
          cantPadron.innerHTML = resultado;
        });
    }

    function licenciasEmpadronados(cuit) {
      opcion = 10;
      fetch(`../../api/clubs.php?cuit=${cuit}&opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((result) => {
          for (var licencia of result) {
            $("#licencias").append(
              `   <div class="col">
                    <h4 class="m-0 text-white num" data-val=" ${licencia.cantidad}">${licencia.cantidad}</h4>
                    <span>${licencia.tipolicencia}</span>
                  </div>`
            );
          }
        });
    }
    // === FIN MUESTRA DATOS DE EMPADRONADOS ===

    // === MUESTRA CNTIDADA DE PATINADORES EN BUENA FE ===
    function cantidadBuenaFe(cuit) {
      opcion = 11;
      fetch(`../../api/clubs.php?cuit=${cuit}&opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((resultado) => {
          var cantPadron = document.getElementById('cantInscriptos');
          cantPadron.innerHTML = resultado;
        });
    }

    function patinadoresPorTorneo(cuit) {
      opcion = 12;
      fetch(`../../api/clubs.php?cuit=${cuit}&opcion=${opcion}`, {
          method: "GET",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        })
        .then((respuesta) => respuesta.json())
        .then((result) => {
          for (var torneos of result) {
            $("#torneos").append(
              `   <div class="col">
                    <h4 class="m-0 text-white num" data-val=" ${torneos.cantidad}">${torneos.cantidad}</h4>
                    <span>${torneos.torneo}</span>
                  </div>`
            );
          }
        });
    }

    // === FIN MUESTRA CNTIDADA DE PATINADORES EN BUENA FE ===


    function borrarDatos() {
      // Obtener el elemento del div por su ID
      var datosClubDiv = document.getElementById('datosClub');
      var datosTecnicosDiv = document.getElementById('datosTecnicos');
      var datosDelegadosDiv = document.getElementById('datosDelegados');
      var cantPadronDiv = document.getElementById('cantPadron');
      var licencaiasDiv = document.getElementById('licencias');
      var cantPadronDiv = document.getElementById('cantInscriptos');
      var cantTorneoDiv = document.getElementById('torneos');
      // Borrar el contenido del div
      datosClubDiv.innerHTML = '';
      datosTecnicosDiv.innerHTML = '';
      datosDelegadosDiv.innerHTML = '';
      cantPadronDiv.innerHTML = '';
      licencaiasDiv.innerHTML = '';
      cantPadronDiv.innerHTML = '';
      cantTorneoDiv.innerHTML = '';
      // Cerrar el modal (opcional, dependiendo de tus necesidades)
      $('#modalRegistro').modal('hide');
    }
    // === FIN Muestra el MODAL con la información de REGISTRO DE INSTITUCIONES ===


    function refresh() {
      table.ajax.reload(null, false);
    }
  </script>
</body>

</html>