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
  <title>Rioplatense - Libro Torneo</title>
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

  /* th {
    font-size: 10px;
  } */

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
    background-color: rgb(95, 158, 160) !important;
    color: white;
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

  .pcoded-navbar .pcoded-inner-navbar li.pcoded-menu-caption:first-child {
    display: none;
  }

  .pcoded-navbar .pcoded-inner-navbar li.pcoded-menu-caption {
    margin-top: 0;
  }
</style>
<!-- FIN Estilos para esta pagina -->

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

  <!-- LOADING -->
  <?php include('../../modulos/loading.php'); ?>
  <!-- END LOADING -->

  <!-- [ Main Content ] start -->
  <div class="pcoded-main-container mt-4">
    <div class="text-center">
      <h1>Libro Programación Torneo</h1>
    </div>

    <!-- toma el tipo de acceso y password del usuario -->
    <div class="ocultarInputOpcion">
      <input name="tipoAcceso" id="tipoAcceso" type="text" value="<?php echo $user['acceso'] ?>">
      <input type="text" name="userPass" id="userPass" value="<?php echo $user['password'] ?>">
    </div>


    <section id="contenedor"></section>
    <!-- local -->
    <div class="col-lg-12 row mb-0 mt-4 pb-2" id="altaExcel">
      <!-- CARGA VIA EXCEL -->
      <div class="input-group col-sm-5 btn-icon-split excel">
        <div class="custom-file">
          <input type="file" name="dataCliente" id="txt_archivo" class="custom-file-input" accept=".xlsx, .xls, .xlsb, .xlsm" onChange="onLoadImage(event.target.files)">
          <label class="custom-file-label" for="inputGroupFile04" id="nombreArchivo"><b>Seleccionar EXCEL</b></label>
        </div>
        <div class="input-group-append btn-icon-split">
          <button class="btn btn-danger" type="submit" name="subir" onclick="pasarTorneo()">Grabar</button>
        </div>
      </div>
      <!-- FIN carga EXCEL -->

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
              <th>Pts Patinador</th>
              <th>Pts Club</th>
              <th>Id</th>
              <th>Estado</th>
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
  <!-- <form class="modal fade" id="modalConsulta" method="POST" action="api/buenafe.php"> -->
  <form class="modal fade" id="modalConsulta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <!-- cabecera del modal -->
        <div class="modal-header text-center">
          <h1 class="modal-title text-rigth editar" id="exampleModalLabel">Información Libro Torneo</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <!-- cuerpo del modal -->
        <div class="col-lg-12 modal-body">

          <div class="accordion" id="accordionExample">
            <!-- Acordeon 1 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  Datos Personales Patinador/a
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-group classid">
                    <input name="id" type="number" class="ocultarID" id="consultarID" placeholder="id" />
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-5 form-floating">
                      <input name="dni" type="number" class="form-control" id="consultarDni" placeholder="DNI" />
                      <label for="floatingInput">DNI</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="fechanacimiento" type="text" class="form-control" id="consultarFechaNacimiento" placeholder="Fecha Nacimeinto" required />
                      <label for="floatingInput">Fecha Nacimiento</label>
                    </div>
                    <div class="form-group col-md-2 form-floating">
                      <input name="edad" type="text" class="form-control" id="consultarEdad" placeholder="Edad" required />
                      <label for="floatingInput">Edad</label>
                    </div>
                    <div class="form-group col-md-2 form-floating">
                      <select name="sexo" class="form-control form-select" id="consultarSexo" required>
                        <option value=""></option>
                        <option value="M">Masculino</option>
                        <option value="F">Femenino</option>
                        <option value="X">Binario</option>
                      </select>
                      <label for="floatingSelect">Sexo</label>
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
                    <div class="form-group col-md-8 form-floating">
                      <select name="cuit" class="form-control" id="consultarCuit" required>
                        <option value=""></option>
                        <?php //Completa el SELECT on los datos de la tabla CLUBS
                        $select = mysqli_query($con, "SELECT * FROM clubs");
                        while ($clubs = mysqli_fetch_row($select)) {
                        ?>
                          <option value="<?php echo $clubs[1] ?>"><?php echo $clubs[2] ?></option>
                        <?php } ?>
                      </select>
                      <label for="floatingSelect">Club</label>
                    </div>

                    <div class="form-group col-md-4 form-floating">
                      <select name="licencia" class="form-control" id="consultarLicencia" required>
                        <option value=""></option>
                        <?php //Completa el SELECT on los datos de la tabla
                        $select = mysqli_query($con, "SELECT * FROM tipolicencias");
                        while ($licencia = mysqli_fetch_row($select)) {
                        ?>
                          <option value="<?php echo ($licencia[1]) ?>"><?php echo ($licencia[1]) ?></option>
                        <?php } ?>
                      </select>
                      <label for="floatingSelect">Licencia</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Acordeon 2 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                  Datos del torneo
                </button>
              </h2>
              <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                <div class="accordion-body">

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <select name="disciplina" class="form-control" id="consultarDisciplina" required>
                        <option value=""></option>
                        <!-- <option value="">Seleccionar Institucion</option> -->
                        <?php
                        $select = mysqli_query($con, "SELECT * FROM disciplinas");
                        while ($opcion = mysqli_fetch_row($select)) { ?>
                          <option value="<?php echo $opcion[1] ?>"><?php echo $opcion[1] ?></option>
                        <?php  }
                        ?>
                      </select>
                      <label for="floatingSelect">Disciplina</label>
                    </div>
                    <div class="form-group col-md-6 form-floating">
                      <select name="divisional" class="form-control" id="consultarDivisional" required>
                        <option value=""></option>
                        <!-- <option value="">Seleccionar Categoria</option> -->
                        <?php
                        $select = mysqli_query($con, "SELECT * FROM divisional");
                        while ($opcion = mysqli_fetch_row($select)) { ?>
                          <option value="<?php echo $opcion[1] ?>"><?php echo $opcion[1] ?></option>
                        <?php  }
                        ?>
                      </select>
                      <label for="floatingSelect">Divisional</label>
                    </div>
                  </div>

                  <div class="form-row">

                    <div class="form-group col-md-6 form-floating">
                      <select name="eficiencia" class="form-control" id="consultarEficiencia" required>
                        <option value=""></option>
                        <!-- <option value="">Seleccionar Categoria</option> -->
                        <?php
                        $select = mysqli_query($con, "SELECT * FROM eficiencia");
                        while ($opcion = mysqli_fetch_row($select)) { ?>
                          <option value="<?php echo $opcion[1] ?>"><?php echo $opcion[1] ?></option>
                        <?php  }
                        ?>
                      </select>
                      <label for="floatingSelect">Eficiencia</label>
                    </div>
                    <div class="form-group col-md-6 form-floating">
                      <select name="categoria" class="form-control" id="consultarCategoria" required>
                        <option value=""></option>
                        <!-- <option value="">Seleccionar Categoria</option> -->
                        <?php
                        $select = mysqli_query($con, "SELECT * FROM categorias");
                        while ($opcion = mysqli_fetch_row($select)) { ?>
                          <option value="<?php echo $opcion[1] ?>"><?php echo $opcion[1] ?></option>
                        <?php  }
                        ?>
                      </select>
                      <label for="floatingSelect">Categoria</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-3 form-floating">
                      <input name="fechaTorneo" type="date" class="form-control form-control-edit" id="consultarFechaTorneo" placeholder="Fecha" required />
                      <label for="floatingInput">Fecha</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="horaTorneo" type="time" class="form-control form-control-edit" id="consultarHoraTorneo" placeholder="Hora" required />
                      <label for="floatingInput">Hora</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="ordenSalida" type="number" class="form-control form-control-edit text-end" id="consultarOrdenSalida" placeholder="Orden de Salida" />
                      <label for="floatingInput">Orden de Salida</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="podio" type="number" class="form-control form-control-edit text-end" id="consultarPodio" placeholder="Podio" />
                      <label for="floatingInput">Podio</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <select name="torneo" class="form-control" id="consultarTorneo">
                        <option value=""></option>
                        <?php //Completa el SELECT on los datos de la tabla CLUBS
                        $select = mysqli_query($con, "SELECT * FROM torneo");
                        while ($opcion = mysqli_fetch_row($select)) {
                        ?>
                          <option value="<?php echo ($opcion[1]) ?>"><?php echo ($opcion[1]) ?></option>
                        <?php } ?>
                      </select>
                      <label for="floatingSelect">Torneo</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="puntosPatinador" type="number" class="form-control form-control-edit text-end" id="ConsultarPuntosPatinador" placeholder="Puntos Patinador" />
                      <label for="floatingInput">Puntos Patinador</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="puntosClub" type="number" class="form-control form-control-edit text-end" id="ConsultarPuntosClub" placeholder="Puntos Club" />
                      <label for="floatingInput">Puntos Club</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-12 form-floating">
                      <textarea name="observaciones" id="observaciones" class="form-control form-control-edit" placeholder="Observaciones" style="height: 70px"></textarea>
                      <label for="floatingTextarea2">Observaciones</label>
                    </div>
                  </div>
                </div>
              </div>

            </div>
            <!-- Fin acordeon -->

            <div class="ocultarInputOpcion">
              <input name="opcion" type="text" value="2">
              <input name="libroTorneo" type="text" value="1">
              <input name="estado" type="text" id="consultarEstado2">
              <input name="programa1_2" type="text" id="programa1_2" value="">
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
              <button class="btn btn-primary btn-modificar" type="submit" id="botonAceptar">Aceptar</button>
            </div>
          </div>
        </div>
      </div>
  </form>
  <!-- END CONSULTA/EDICION USUARIO -->


  <!-- SCRIPTS -->

  <!-- <script src="https://code.jquery.com/jquery-3.6.1.js"></script> -->
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
  <script src="https://cdn.datatables.net/searchbuilder/1.4.0/js/dataTables.searchBuilder.min.js"></script>
  <!-- Librerias para exportar la tabla a distintos documentos -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

  <script src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.colVis.min.js"></script>
  <!-- 
  <script src="js/lecturaTabla_general.js"></script> -->
  <script src="../../js/editarDatos_general.js"></script>
  <script src="../../js/logout.js"></script>

  <script>
    var fila = '';
    var id = 0;
    var opcion = '';
    var userPass = $("#userPass").val();
    var tipoAcceso = $("#tipoAcceso").val();

    // === CARGA LA TABLA CON DATOS ===
    // Accede y vuelca los datos del array en la tabla
    $(document).ready(function() {
      listar();
    });
    // Accede y vuelca los datos del array en la tabla
    var listar = function() {
      opcion = 8;
      table = $("#tablaClientes").DataTable({
        ajax: {
          method: "GET",
          url: "../../api/buenafe.php",
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
            data: "puntospatinador"
          },
          {
            data: "puntosclub"
          },
          {
            data: "id"
          },
          {
            data: "estado"
          },
          {
            defaultContent: "<button type='button' class='btn btn-info btn-circle btn-sm btnInfo'><i class='fas fa-info-circle'></i></button>	<button type='button' class='btn btn-primary btn-circle btn-sm btnEdit'><i class='fas fa-edit'></i></button></button>"
          },
        ],

        // ESTILOS DE LA TABLA
        responsive: true,

        lengthMenu: [
          [10, 25, 50, -1],
          [10, 25, 50, "All"],
        ], //configura cantidad de lineas por pantala
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
            targets: [4, 5, 6, 8, 9, 10, 13, 14, 15, 16, 20],
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
            targets: [3, 5, 8, 9, 11, 13, 14, 15, 16, 19, 20],
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
        // scrollY: 400,
        // scrollCollapse: true,
        // scroller: true,
        paging: true, // Paginación de la taba
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
          $("td", row).eq(10).css({
            "text-align": "center",
          });
        },

      });
      filtros();
      obtener_data_editar("#tablaClientes tbody", table);
      obtener_data_info("#tablaClientes tbody", table);
      // obtener_data_borrar("#tablaClientes tbody", table);
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===


    // Obtiene el ID para mostrar datos
    var obtener_data_info = function(tbody, table) {
      $(tbody).on("click", "button.btnInfo", function() {
        var data = table.row($(this).parents("tr")).data();
        // console.log(data)
        id = data['id'];
        consultarUnCliente(id);
      });
    }

    // Obtiene el ID para editar datos
    var obtener_data_editar = function(tbody, table) {
      $(tbody).on("click", "button.btnEdit", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id'];
        consultarUnCliente(id);
      });
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===\newproyect_lepa_v2\libro_torneo.php


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
        const parrafo = document.querySelector(".editar");
        parrafo.textContent = "Información Libro Torneo"
      });

      // Muestra formulario modo Edición
      $(document).on("click", ".btnEdit", function() {
        $(".form-control").prop('disabled', true);
        $(".form-select").prop('disabled', true);
        $(".form-control-edit").prop('disabled', false);
        $(".labelDatosAdicionales").hide();
        $('#botonAceptar').show();
        const parrafo = document.querySelector(".editar");
        parrafo.textContent = "Editar Libro Torneo"
        // if (tipoAcceso != "administrador") {
        //   $(".posicion").prop('disabled', true);
        // }
      });

      fetch(
          `../../api/buenafe.php?id=${id}&opcion=${opcion}`, {
            method: 'GET',
            headers: {
              Accept: "application/json",
              "Content-Type": "application/json",
            },
          },
        )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          console.log(datos[0]);
          $("#consultarID").val(datos[0].id);
          $("#consultarDni").val(datos[0].dnibuenafe);
          $("#consultarSexo").val(datos[0].sexopatinador);
          $("#consultarLastName").val(datos[0].apellidopatinador);
          $("#consultarFirstName").val(datos[0].nombrepatinador);
          $("#consultarFechaNacimiento").val(datos[0].fechanacimiento);
          $("#consultarEdad").val(datos[0].edad);
          $("#consultarCuit").val(datos[0].cuit);
          $("#consultarLicencia").val(datos[0].tipolicencia);
          $("#consultarDivisional").val(datos[0].divisional);
          $("#consultarEficiencia").val(datos[0].eficiencia);
          $("#consultarCategoria").val(datos[0].categoria);
          $("#consultarDisciplina").val(datos[0].disciplina);
          $("#consultarApagar").val(datos[0].apagar);
          $("#consultarTorneo").val(datos[0].torneo);
          $("#consultarFechaTorneo").val(datos[0].fechatorneo);
          $("#consultarHoraTorneo").val(datos[0].horatorneo);
          $("#consultarPodio").val(datos[0].podiotorneo);
          $("#consultarOrdenSalida").val(datos[0].ordensalida);
          $("#consultarOrdenSalida").val(datos[0].ordensalida);
          $("#ConsultarPuntosPatinador").val(datos[0].puntospatinador);
          $("#ConsultarPuntosClub").val(datos[0].puntosclub);
          $("#observaciones").val(datos[0].observaciones);
          $("#consultarEstado2").val(datos[0].estado);


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
    var urlEdit = 'api/buenafe.php';
    // === FIN ACTUALIZAR DATOS ===


    // CARGA DE DATOS VIA EXCEL
    // Muestra el nombre del archivo seleccionado
    function onLoadImage(files) {
      $(".form-control").prop('disabled', false);
      if (files && files[0]) {
        document
          .getElementById('nombreArchivo')
          .innerHTML = files[0].name
      }
    }

    //Verifica que archivo tenga extención EXCEL
    $('input[type="file"]').on('change', function() {
      var ext = $(this).val().split('.').pop();
      if ($(this).val() != '') {
        if (ext == 'xlsx' || ext == 'xls' || ext == 'xlsb' || ext == 'xlsm') {} else {
          $(this).val('');
          Swal.fire("Error", "Extensión no permitida: " + ext + "", "error");
        }
      }
    });

    // PONER LAS VARIABLES DEL TORNEO
    function pasarTorneo() {
      //Verifica que se selecciono un archivo y un club
      var cuit = $("#modificarCuit").val();
      // var torneo = $("#modificarTorneo").val();
      var archivo = document.getElementById('txt_archivo').value;
      if (archivo.length == 0) {
        return Swal.fire("Advertencia", "Seleccione un Archivo", "warning");
      };
      Cargar_Excel();
    }

    //Carga los datos del EXCEL a la BD
    function Cargar_Excel() {
      $('#modalLoading').modal('show');
      let formData = new FormData();
      let excel = $("#txt_archivo")[0].files[0];
      formData.append('excel', excel);

      fetch(
          '../../api/carga_excel_librobuenafe.php', {
            method: 'POST',
            body: formData,
            headers: {
              Accept: "application/json",
            },
          },
        )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          if (datos == 1) {
            $('#modalLoading').modal('hide');
            Swal.fire({
              icon: 'success',
              title: 'Ok!',
              text: 'Proceso finalizado',
            }).then((result) => {
              window.location.reload();
            });
          } else if (datos == 2) {
            $('#modalLoading').modal('hide');
            Swal.fire({
              icon: 'error',
              title: 'Ups..!',
              text: 'No se encontraron datos para actualizar',
            }).then((result) => {
              window.location.reload();
            });
          };
        });
    }


    // === MOSTRAR - OCULTAR FILTRO ===
    var valorFiltro = localStorage.mostrarFiltro_libroTorneo;

    function filtros() {
      if (valorFiltro == 1) {


        mostrarFiltros()
      } else {

        ocultarFiltros()
      }
    }

    function mostrarFiltros() {
      var mostrarFiltro_libroTorneo = 1;
      localStorage.mostrarFiltro_libroTorneo = mostrarFiltro_libroTorneo;
      $('#mostrarFiltros').hide();
      $('#ocultarFiltros').show();
      $('.dtsp-panesContainer').show();
      $('.dtsb-searchBuilde').show();
    }

    function ocultarFiltros() {
      var mostrarFiltro_libroTorneo = 0;
      localStorage.mostrarFiltro_libroTorneo = mostrarFiltro_libroTorneo;
      $('#mostrarFiltros').show();
      $('#ocultarFiltros').hide();
      $('.dtsp-panesContainer').hide();
      $('.dtsb-searchBuilder').hide();
    }
    // === FIN MOSTRAR - OCULTAR FILTRO ===

    function refresh() {
      table.ajax.reload(null, false);
    }
  </script>
</body>

</html>