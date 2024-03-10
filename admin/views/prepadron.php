<?php include('modulos/encabezado_user_admin.php');
// === CONSULTA EL ESTADO DEL PADRON (ABIERTO O CERRADO)
$records = $conn->prepare('SELECT * FROM estadopadron');
$records->execute();
$results1 = $records->fetch(PDO::FETCH_ASSOC);

$estado = null;

if (count($results1) > 0) {
  $estado = $results1;
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
  <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.1.0/css/searchPanes.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/searchbuilder/1.4.0/css/searchBuilder.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.5.0/css/select.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.6.1/css/colReorder.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" />

  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="assets/logoDataSkt.png">
  <title>Rioplatense - Padrón Usuarios</title>
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

  th {
    text-align: center !important;
  }

  input,
  select {
    font-weight: 700 !important;
  }

  .userPass {
    display: none;
  }

  .ocultarInputOpcion,
  .ocultarFiltros {
    display: none;
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
    display: none;
  }

  .dtsb-searchBuilder {
    display: none;
  }

  .dt-buttons :hover {
    background: rgba(132, 131, 131, 0.7);
  }
</style>
<!-- FIN Estilos para esta pagina -->

<body class="">

  <!-- [ Header ] start -->
  <?php include('modulos/header.php'); ?>
  <!-- [ Header ] end -->

  <!-- [ navigation menu ] start -->
  <?php include('modulos/navmenu.php') ?>
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
      <h1>Padron PROVISORIO</h1>
      <h3>Estado del Padrón PROVISORIO: <?php echo $estado['estado'] ?></h3>
      <h4 class="saldoTexto p-3"></h4>
    </div>

    <!-- CARGA VIA EXCEL -->
    <div class="col-lg-12 row mb-0 mt-4 pb-2" id="altaExcel">
      <!-- Filtros y Grupos de la Tabla -->
      <div class="form-row col-md-3 m-0">
        <div class="form-group mb-0">
          <button class="btn btn-secondary mostrarFiltros" id="mostrarFiltros" name="filtros" onclick="mostrarFiltros()" title="Filtros DESACTIVADOS"><i class="fas fa-filter"></i></button>
          <button class="btn btn-success ocultarFiltros" id="ocultarFiltros" name="filtros" onclick="ocultarFiltros()" title="Filtros ACTIVADOS"><i class="fas fa-filter"></i></button>
        </div>
      </div>

    </div>
    <!-- FIN CARGA VIA EXCEL -->

    <div class="col-lg-12">
      <div class="table-responsive">
        <table id="tablaClientes" class="display responsive nowrap compact table-bordered" style="width: 100%">
          <thead class="text-center">
            <tr>
              <th>Apellido</th>
              <th>Nombres</th>
              <th>DNI</th>
              <th>Fecha Nacimiento</th>
              <th>Edad</th>
              <th>Sexo</th>
              <th>Nacionalidad</th>
              <th>Domicilio</th>
              <th>Provincia</th>
              <th>Localidad</th>
              <th>CP</th>
              <th>Función</th>
              <th>Tipo Licencia</th>
              <th>Telefono</th>
              <th>Institución</th>
              <th>Tipo afiliacion Club</th>
              <th>id</th>
              <th>Fecha Alta</th>
              <th>Valor Licencia</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <!-- [ Main Content ] end -->

  <!-- FROMULARIO MODAL CONSULTA/EDICION USUARIO -->
  <form class="modal fade" id="modalConsulta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <!-- cabecera del modal -->
        <div class="modal-header text-center">
          <h1 class="modal-title text-rigth" id="exampleModalLabel">Información Patinador/a</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <!-- cuerpo del modal -->
        <div class="col-lg-12 modal-body">

          <div class="accordion" id="accordionExample1">
            <!-- Acordeon 1 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  Datos Personlaes
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-group classid">
                    <input name="id" type="number" class="form-control form-control-user ocultarID" id="consultarID" placeholder="id" />
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-5 form-floating">
                      <input name="dni" type="number" class="form-control" id="consultarDni" placeholder="DNI" />
                      <label for="floatingInput">DNI</label>
                    </div>
                    <div class="form-group col-md-4 form-floating">
                      <input name="fechanacimiento" type="date" class="form-control" id="consultarFechaNacimeinto" placeholder="Fecha Nacimeinto" required />
                      <label for="floatingInput">Fecha Nacimiento</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="nacionalidad" type="text" class="form-control form-control-user" id="consultarNacionalidad" placeholder="Nacionalidad" required />
                      <label for="floatingInput">Nacionalidad</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-5 form-floating">
                      <input name="nombre" type="text" class="form-control" id="consultarFirstName" placeholder="Nombre" required />
                      <label for="floatingInput">Nombre</label>
                    </div>
                    <div class="form-group col-md-7 form-floating">
                      <input name="apellido" type="text" class="form-control" id="consultarLastName" placeholder="Apellido" required />
                      <label for="floatingInput">Apellido</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-2 form-floating">
                      <select name="sexo" class="form-control form-select" id="consultarSexo" required>
                        <!-- <option value="vacio"></option> -->
                        <option value="M">Masculino</option>
                        <option value="F">Femenino</option>
                        <option value="X">Binario</option>
                      </select>
                      <label for="floatingSelect">Sexo</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="telefono" type="number" class="form-control form-control-user" id="consultarTelefono" placeholder="Telefono" />
                      <label for="floatingInput">Telefono</label>
                    </div>
                    <div class="form-group col-md-7 form-floating">
                      <input name="email" type="email" class="form-control form-control-user" id="consultarEmail" placeholder="Email" />
                      <label for="floatingInput">Email</label>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <!-- Acordeon 2 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  Domicilio
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-row">
                    <div class="form-group col-md-12 form-floating">
                      <input name="domicilio" type="text" class="form-control form-control-user" id="consultarDomicilio" placeholder="Domicilio" required />
                      <label for="floatingInput">Domicilio</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <input name="localidad" type="text" class="form-control form-control-user" id="consultarLocalidad" placeholder="Localidad" required />
                      <label for="floatingInput">Localidad</label>
                    </div>
                    <div class="form-group col-md-6 form-floating">
                      <input name="partido" type="text" class="form-control form-control-user" id="consultarPartido" placeholder="Partido" required />
                      <label for="floatingInput">Partido</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <input name="cp" type="text" class="form-control form-control-user" id="consultarCP" placeholder="Cód. Postal" required />
                      <label for="floatingInput">Cód. Postal</label>
                    </div>
                    <div class="form-group col-md-6 form-floating">
                      <input name="provincia" type="text" class="form-control form-control-user" id="consultarProvincia" placeholder="Provincia" required />
                      <label for="floatingInput">Provincia</label>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <!-- Acordeon 3 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  Datos del Club
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-row">
                    <div class="form-group col-md-12 form-floating">
                      <select name="cuit" class="form-control form-control-user" id="consultarCuit" required>
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
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <select name="licencia" class="form-control form-control-user" id="consultarLicencia" onchange="valorConsultaLicenciaID()" required>
                        <?php //Completa el SELECT on los datos de la tabla
                        $select = mysqli_query($con, "SELECT * FROM tipolicencias ORDER BY tipolicencia");
                        while ($licencia = mysqli_fetch_row($select)) {
                        ?>
                          <option value="<?php echo ($licencia[1]) ?>"><?php echo ($licencia[1]) ?></option>
                        <?php } ?>
                      </select>
                      <label for="floatingSelect">Licencia</label>
                    </div>

                    <div class="form-group col-md-6 form-floating">
                      <input name="valorLicencia" type="number" class="form-control form-control-user" id="consultarValorLicencia" placeholder="Valor Licencia" />
                      <label for="floatingInput">Valor Licencia</label>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <!-- Acordeon 4 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                  Datos de los padres
                </button>
              </h2>
              <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-row">
                    <div class="form-group col-md-7 form-floating">
                      <input name="nombrePadre" type="text" class="form-control" id="consultarNamePadre" placeholder="Nombre del Padre" />
                      <label for="floatingInput">Nombre del Padre</label>
                    </div>
                    <div class="form-group col-md-5 form-floating">
                      <input name="dniPadre" type="number" class="form-control" id="consultarDniPadre" placeholder="DNI del Padre" />
                      <label for="floatingInput">DNI del Padre</label>
                    </div>
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-7 form-floating">
                      <input name="nombreMadre" type="text" class="form-control" id="consultarNameMadre" placeholder="Nombre de la Madre" />
                      <label for="floatingInput">Nombre de la Madre</label>
                    </div>
                    <div class="form-group col-md-5 form-floating">
                      <input name="dniMadre" type="number" class="form-control" id="consultarDniMadre" placeholder="DNI de la Madre" />
                      <label for="floatingInput">DNI de la Madre</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>

          <div class="ocultarInputOpcion">
            <input name="opcion" type="text" value="2">
            <input name="valorLicencia" type="text" id="consultarValorLicencia2">
          </div>

          <div>
            <label class="labelDatosAdicionales mb-0"><b>Alta:</b>
              <input name="datosAlta" type="text" class="datosAdicionales" id="datosAlta" disabled />
            </label>
            <label class="labelDatosAdicionales"><b>Ultima modificación:</b>
              <input name="datosMod" type="text" class="datosAdicionales" id="datosMod" disabled />
            </label>
          </div>
          <!-- Footer del modal -->
          <div class="modal-footer form-row">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="botonCancel">Cancelar</button>
            <button class="btn btn-primary btn-modificar" type="submit" id="botonAceptar" onclick="validarFormularioConsulta()">Aceptar</button>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!-- END CONSULTA/EDICION USUARIO -->



  <!-- SCRIPTS -->

  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
  <!-- Boostrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Required Js -->
  <script src="assets/js/vendor-all.min.js"></script>
  <script src="assets/js/plugins/bootstrap.min.js"></script>
  <script src="assets/js/pcoded.min.js"></script>
  <!-- Apex Chart -->
  <script src="assets/js/plugins/apexcharts.min.js"></script>
  <!-- custom-chart js -->
  <script src="assets/js/pages/dashboard-main.js"></script>
  <!-- Datatable -->
  <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
  <script src="https://cdn.datatables.net/searchpanes/2.1.0/js/dataTables.searchPanes.min.js"></script>
  <script src="https://cdn.datatables.net/select/1.5.0/js/dataTables.select.min.js"></script>
  <script src="https://cdn.datatables.net/searchbuilder/1.4.0/js/dataTables.searchBuilder.min.js"></script>
  <script src="https://cdn.datatables.net/colreorder/1.6.1/js/dataTables.colReorder.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.colVis.min.js"></script>


  <!-- Librerias para exportar la tabla a distintos documentos -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

  <script src="js/logout.js"></script>

  <script>
    var id = 0;
    var opcion = '';
    var CtaCteCUIT = <?php echo $user['cuit'] ?>;
    var tabla = 'pre_padron';
    saldo_institucion = '';

    $(document).ready(function() {
      consultarSaldo()
      listar();
    });

    // === CARGA LA TABLA CON DATOS ===
    // Accede y vuelca los datos del array en la tabla
    var listar = function() {
      opcion = 0;
      table = $("#tablaClientes").DataTable({
        ajax: {
          method: "GET",
          url: "api/pre_padron.php",
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
            data: "dnipatinador"
          },
          {
            data: "fechanacpatinador"
          },
          {
            data: "edad"
          },
          {
            data: "sexopatinador"
          },
          {
            data: "nacionalidadpatinador"
          },
          {
            data: "domiciliopatinador"
          },
          {
            data: "provinciapatinador"
          },
          {
            data: "localidadpatinador"
          },
          {
            data: "cppatinador"
          },
          {
            data: "funcionpatinador"
          },
          {
            data: "tipolicencia"
          },
          {
            data: "telefonopatinador"
          },
          {
            data: "institucion"
          },
          {
            data: "tipoafiliacion"
          },
          {
            data: "id"
          },
          {
            data: "fechaalta"
          },
          {
            data: "valorLicencia"
          },
          {
            defaultContent: "<button type='button' class='btn btn-info btn-circle btn-sm btnInfo'><i class='fas fa-info-circle'></i></button>"
          },
        ],
        // ESTILOS DE LA TABLA
        //configura cantidad de lineas por pantala
        lengthMenu: [
          [10, 25, 50, 100, -1],
          [10, 25, 50, 100, "All"],
        ],
        searchPanes: {
          viewTotal: true,
          layout: "columns-5",
          initCollapsed: true,
        },
        columnDefs: [{
            searchPanes: {
              show: true,
            },
            targets: [4, 5, 12, 15, 18],
          },
          {
            searchPanes: {
              show: false,
            },
            // targets: [0, 1, 2, 6, 8, 9, 7, 10, 11, 13],
            targets: [0, 1, 2, 6, 8, 9, 7, 10, 11, 13, 14],
          },
          // === Oculta columnas ===
          {
            // targets: [6, 7, 8, 9, 10, 13, 15, 16, 17],
            targets: [6, 7, 8, 9, 10, 13, 15, 16, 17],
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

        // pinta en rojo la celda de pago licencia en 0
        createdRow: function(row, data, index) {
          if (
            (data[18] == 0 || data[18] == "null")
          ) {
            //Pinta en rojo una celda
            $("td", row).eq(9).css({
              "background-color": "#ff5252",
              color: "white",
            });
          }
          $("td", row).eq(2).css({
            "text-align": "center",
          });
          $("td", row).eq(3).css({
            "text-align": "center",
          });
          $("td", row).eq(4).css({
            "text-align": "center",
          });
          $("td", row).eq(5).css({
            "text-align": "center",
          });
          $("td", row).eq(9).css({
            "text-align": "right",
          });
          $("td", row).eq(10).css({
            "text-align": "center",
          });
        },
        // === permite reordenar las columnas ===
        colReorder: true,
        dom: '"QPBfrtilp"',
        // buttons: [
        //   // === Oculta columnas ===
        //   {
        //     extend: "excelHtml5",
        //     exportOptions: {
        //       columns: ":visible",
        //     },
        //   },
        //   "colvis",
        // ],
        language: {
          lengthMenu: "Mostrar _MENU_ registros",
          infoEmpty: "No hay resultados disponibles",
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
      });
      filtros();
      obtener_data_info("#tablaClientes tbody", table);
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===


    // Obtiene el ID para mostrar datos
    var obtener_data_info = function(tbody, table) {
      $(tbody).on("click", "button.btnInfo", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id'];
        consultarUnCliente(id);
      });
    }

    // === CONSULTAR DATOS ===
    function consultarUnCliente(id) {
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
        $("#consultarDni").prop('disabled', true);
        $("#consultarValorLicencia").prop('disabled', true);
        $(".labelDatosAdicionales").hide();
        $('#botonAceptar').show();
      });
      // consulta a base de datos según ID y opcion
      fetch(
          `api/pre_padron.php?id=${id}&opcion=${opcion}`, {
            method: 'GET',
            headers: {
              Accept: "application/json",
              "Content-Type": "application/json",
            },

          },
        )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          $("#consultarID").val(datos[0].id);
          $("#consultarDni").val(datos[0].dnipatinador);
          $("#consultarFechaNacimeinto").val(datos[0].fechanacpatinador);
          $("#consultarNacionalidad").val(datos[0].nacionalidadpatinador);
          $("#consultarFirstName").val(datos[0].nombrepatinador);
          $("#consultarLastName").val(datos[0].apellidopatinador);
          $("#consultarSexo").val(datos[0].sexopatinador);
          $("#consultarTelefono").val(datos[0].telefonopatinador);
          $("#consultarEmail").val(datos[0].emailpatinador);
          $("#consultarDomicilio").val(datos[0].domiciliopatinador);
          $("#consultarLocalidad").val(datos[0].localidadpatinador);
          $("#consultarPartido").val(datos[0].partidopatinador);
          $("#consultarCP").val(datos[0].cppatinador);
          $("#consultarProvincia").val(datos[0].provinciapatinador);
          $("#consultarCuit").val(datos[0].cuit);
          $("#consultarLicencia").val(datos[0].tipolicencia);
          $("#consultarNamePadre").val(datos[0].nombrepadre);
          $("#consultarDniPadre").val(datos[0].dnipadre);
          $("#consultarNameMadre").val(datos[0].nombremadre);
          $("#consultarDniMadre").val(datos[0].dnimadre);
          $("#consultarValorLicencia").val(datos[0].valorLicencia);
          // $("#consultarPagoLicencia").val(datos[0].pagoLicencia);

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


    // === MOSTRAR - OCULTAR FILTRO ===
    var valorFiltro = localStorage.mostrarFiltro_padron;

    function filtros() {
      if (valorFiltro == 1) {
        mostrarFiltros()
      } else {
        ocultarFiltros()
      }
    }

    function mostrarFiltros() {
      var mostrarFiltro_padron = 1;
      localStorage.mostrarFiltro_padron = mostrarFiltro_padron;
      $('#mostrarFiltros').hide();
      $('#ocultarFiltros').show();
      $('.dtsp-panesContainer').show();
      $('.dtsb-searchBuilde').show();
    }

    function ocultarFiltros() {
      var mostrarFiltro_padron = 0;
      localStorage.mostrarFiltro_padron = mostrarFiltro_padron;
      $('#mostrarFiltros').show();
      $('#ocultarFiltros').hide();
      $('.dtsp-panesContainer').hide();
      $('.dtsb-searchBuilder').hide();
    }
    // === FIN MOSTRAR - OCULTAR FILTRO ===

    // === CONSULTA VALOR DE LA LICENCIA PARA LAS ALTAS ===
    function valorAltaLicenciaID() {
      opcion = 6;
      $("#altaValorLicencia").prop('disabled', true);
      var nombreAltaLicencia = $("#altaLicencia").val();

      var urlLicencia = `api/licencias.php?nombreLicencia=${nombreAltaLicencia}&opcion=${opcion}`;

      fetch(urlLicencia, {
          method: 'GET',
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        }, )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          console.log(datos)
          $("#altaValorLicencia").val(datos[0].valor);
          $("#altaValorLicencia2").val(datos[0].valor);
        })
    }

    function valorConsultaLicenciaID() {
      opcion = 6;
      var nombreEditLicencia = $("#consultarLicencia").val();

      var urlLicencia = `api/licencias.php?nombreLicencia=${nombreEditLicencia}&opcion=${opcion}`;

      fetch(urlLicencia, {
          method: 'GET',
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
        }, )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          $("#consultarValorLicencia").val(datos[0].valor);
          $("#consultarValorLicencia2").val(datos[0].valor);
        })
    }
    // === FIN CONSULTA VALOR DE LA LICENCIA PARA LAS ALTAS ===


    // === CONSULTA SALDO DE LA CTA CTE === 
    function consultarSaldo() {
      saldo_institucion = 'padron_users'
      opcion = 6;
      fetch(
          `api/pre_padron.php?opcion=${opcion}`, {
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
          if (datos && datos.length > 0) {
            saldoTexto.innerHTML = "Valorización Padron Provisorio: " + '<span id="saldo" style="font-size: 20px;">$ ' + datos[0]['valorLicencia'] + '</span>';

            if (datos[0]['valorLicencia'] > '0') {
              document.querySelector('#saldo').style.color = 'red';
            } else {
              document.querySelector('#saldo').style.color = 'green';
            }
          } else {
            saldoTexto.innerHTML = "Saldo Cta Cte: " + '<span id="saldo" style="font-size: 20px;">' + "0,00" + '</span>';
          }
        });
    }
    // === FIN CONSULTA SALDO DE LA CTA CTE === 
  </script>
</body>

</html>