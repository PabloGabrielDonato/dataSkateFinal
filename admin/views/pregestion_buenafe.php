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
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.1.0/css/searchPanes.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.5.0/css/select.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/colreorder/1.6.1/css/colReorder.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/rowgroup/1.3.0/css/rowGroup.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/searchbuilder/1.4.0/css/searchBuilder.dataTables.min.css">
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="../../assets/rio_logo.png">
  <title>Rioplatense - Inscripciones Provisoria</title>
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

  /* estilo encabezado tabla */
  .sorting {
    text-align: center !important;
    font-size: 12px;
  }

  /* estilo renglones tabla */
  td {
    font-size: 12px;
  }

  input,
  select {
    font-weight: 700 !important;
  }

  .ocultarInputOpcion,
  .ocultarFiltros,
  .ocultarGrupos,
  .ocultarPagos {
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

  /* Oculta el  ADD CONDITIONS*/
  .dtsb-searchBuilder {
    display: none;
  }
</style>
<!-- FIN Estilos para esta pagina -->

<body class="">

  <!-- [ Header ] start -->
  <?php include('../../modulos/header.php'); ?>
  <!-- [ Header ] end -->

  <!-- [ navigation menu ] start -->
  <?php include('../../modulos/navmenu.php'); ?>
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
      <h1>Inscripciones Provisorias</h1>
      <h4 class="saldoTexto p-3"></h4>
    </div>

    <!-- toma el tipo de acceso y password del usuario -->
    <div class="ocultarInputOpcion">
      <input name="tipoAcceso" id="tipoAcceso" type="text" value="<?php echo $user['acceso'] ?>">
      <input type="text" name="userPass" id="userPass" value="<?php echo $user['password'] ?>">
    </div>

    <!-- CARGA VIA EXCEL -->
    <!-- <section id="contenedor"></section> -->
    <!-- local -->
    <div class="col-lg-12 row mb-0 mt-4 pb-2" id="altaExcel">
      <!-- Filtros y Grupos de la Tabla -->
      <div class="form-row col-md-3 m-0">
        <div class="form-group mb-0">
          <button class="btn btn-secondary mostrarFiltros" id="mostrarFiltros" name="filtros" onclick="mostrarFiltros()" title="Filtros DESACTIVADOS"><i class="fas fa-filter"></i></button>
          <button class="btn btn-success ocultarFiltros" id="ocultarFiltros" name="filtros" onclick="ocultarFiltros()" title="Filtros ACTIVADOS"><i class="fas fa-filter"></i></button>
        </div>
        <!-- <div class="mb-3">
          <button type=" button" class="btn btn-outline-success ml-3" onclick="limpiaForm()">Agregar</button>
        </div>
        <div class="mb-3">
          <button type="button" class="btn btn-outline-info ml-3 btn-lg btn-sm" onclick="confirmarPreInscripcion()">CONFIRMAR INSCRIPCION</button>
        </div> -->
      </div>
    </div>
    <!-- FIN Filtros y Grupos de la Tabla -->


    <div class=" col-lg-12">
      <div class="table-responsive">
        <table id="tablaClientes" class="display responsive nowrap compact table-bordered" style="width: 100%">
          <thead class="text-center">
            <tr>
              <th>DNI</th>
              <th>Sexo</th>
              <th>Apellido</th>
              <th>Nombres</th>
              <th>Fecha Nacimiento</th>
              <th>Edad</th>
              <th>Disciplina</th>
              <th>Divisional</th>
              <th>Eficiencia</th>
              <th>Categoria</th>
              <th>Programa1</th>
              <th>Programa2</th>
              <th>Tipo Licencia</th>
              <th>Torneo</th>
              <th>Institución</th>
              <th>Observaciones</th>
              <th>id</th>
              <th>Estado Patinador</th>
              <th>Estado Torneo</th>
              <th>A Pagar</th>
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
  <!-- method="POST" action="api/buenafe.php" -->
  <form class="modal fade" id="modalConsulta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <!-- cabecera del modal -->
        <div class="modal-header text-center">
          <h1 class="modal-title text-rigth editar" id="exampleModalLabel">Información Buena Fe Patinador/a</h1>
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
              <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                <div class="accordion-body">

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <input name="nombre" type="text" class="form-control" id="consultarDisciplina" placeholder="Disciplina" />
                      <label for="floatingSelect">Disciplina</label>
                    </div>

                    <div class="form-group col-md-6 form-floating">
                      <input name="nombre" type="text" class="form-control" id="consultarDivisional" placeholder="Divisional" />
                      <label for="floatingSelect">Divisional</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <input name="nombre" type="text" class="form-control" id="consultarEficiencia" placeholder="Eficiencia" />
                      <label for="floatingSelect">Eficiencia</label>
                    </div>

                    <div class="form-group col-md-6 form-floating">
                      <input name="nombre" type="text" class="form-control" id="consultarCategoria" placeholder="Categoria" />
                      <label for="floatingSelect">Categoria</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-12 form-floating ocultarPrograma">
                      <input name="programa1" type="text" class="form-control form-control-edit" id="consultarPrograma1" placeholder="Programa 1" />
                      <label for="floatingInput">Programa 1</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <input name="nombre" type="text" class="form-control" id="consultarTorneo" placeholder="Torneo" />
                      <label for="floatingSelect">Torneo</label>
                    </div>

                    <div class="form-group col-md-6 form-floating">
                      <input name="apagar" type="text" class="form-control inactivo" id="consultarApagar" placeholder="Valor Torneo" style="text-align: right;" />
                      <label for="floatingInput">Valor Torneo</label>
                    </div>
                  </div>

                  <div class="ocultarPagos">
                    <input name="pagado" type="number" id="consultarPagado" />
                    <input name="apagar" type="number" id="consultarApagar2" />
                  </div>

                  <div class="form-group form-floating">
                    <textarea name="observaciones" id="observaciones" class="form-control form-control-edit" placeholder="Observaciones" style="height: 70px"></textarea>
                    <label for="floatingTextarea2">Observaciones</label>
                  </div>

                </div>
              </div>
            </div>
          </div>
          <div>
            <label class="labelDatosAdicionales mb-1 mt-1"><b>Alta:</b>
              <input name="datosAlta" type="text" class="datosAdicionales" id="datosAlta" disabled />
            </label>
            <label class="labelDatosAdicionales"><b>Ultima modificación:</b>
              <input name="datosMod" type="text" class="datosAdicionales" id="datosMod" disabled />
            </label>
          </div>
        </div>
        <!-- Fin acordeon -->

        <div class="ocultarInputOpcion">
          <input name="opcion" type="text" value="2">
          <input name="estado" type="text" id="consultarEstado">
          <input name="ordensalida" type="number" value="0">
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
  <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/responsive/2.4.1/js/dataTables.responsive.min.js"></script>
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

  <!-- <script src="js/lecturaTabla_general.js"></script> -->
  <script src="../../js/editarDatos_general.js"></script>
  <script src="../../js/eliminarByID.js"></script>
  <!-- El eliminar TODO se ejecuta desde esta pagina -->
  <script src="../../js/logout.js"></script>

  <script>
    var fila = '';
    var id = 0;
    var opcion = '';
    var CtaCteCUIT = <?php echo $user['cuit'] ?>;
    var tabla = 'pre_gestionBuenaFe';
    var userPass = $("#userPass").val();
    var tipoAcceso = $("#tipoAcceso").val();
    var saldo_institucion = '';

    // === CARGA LA TABLA CON DATOS ===
    // Accede y vuelca los datos del array en la tabla
    $(document).ready(function() {
      // opcion = 6;
      // fetch(`api/torneos.php?opcion=${opcion}`, {
      //     method: "GET",
      //     headers: {
      //       Accept: "application/json",
      //       "Content-Type": "application/json",
      //     },
      //   })
      //   .then((respuesta) => respuesta.json())
      //   .then((datos) => {
      //     if (datos == 1) {
      //       listar();
      //       consultarSaldo();
      //     } else {
      //       Swal.fire({
      //         icon: 'warning',
      //         title: 'Listas cerradas!',
      //         text: 'No hay torneos habilitados para gestionar Inscripciones Provisorias!',
      //       }).then((result) => {
      //         location.href = "users_home.php";
      //       });
      //     }
      //   });
      listar();
      consultarSaldo();
    });

    var listar = function() {
      opcion = 0;
      table = $("#tablaClientes").DataTable({
        ajax: {
          method: "GET",
          url: "../../api/pre_buenafe.php",
          data: {
            opcion: opcion
          },
        },
        columns: [{
            data: "dnibuenafe"
          },
          {
            data: "sexopatinador"
          },
          {
            data: "apellidopatinador"
          },
          {
            data: "nombrepatinador"
          },
          {
            data: "fechanacimiento"
          },
          {
            data: "edad"
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
            data: "programa1"
          },
          {
            data: "programa2"
          },
          {
            data: "tipolicencia"
          },
          {
            data: "torneo"
          },
          {
            data: "institucion"
          },
          {
            data: "observaciones"
          },
          {
            data: "id"
          },
          {
            data: "estado"
          },
          {
            data: "estadotorneo"
          },
          {
            data: "apagar"
          },
          {
            defaultContent: "<button type='button' class='btn btn-info btn-circle btn-sm btnInfo'><i class='fas fa-info-circle'></i></button>"
          },
        ],

        // ESTILOS DE LA TABLA
        responsive: true,
        lengthMenu: [
          [10, 25, 50, 100, -1],
          [10, 25, 50, 100, "All"],
        ], //indica opciones de renglon en pantalla
        // columnas a ordenar
        order: [
          [13, "asc"],
          [2, "asc"],
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
              show: true,
            },
            targets: [5, 6, 7, 8, 9, 10, 11, 12, 13],
          },
          {
            searchPanes: {
              show: false,
            },
            targets: [1, 2, 3, 16],
          },

          // oculta columnas
          {
            targets: [13, 16, 19],
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
        // Agrupación de filas
        rowGroup: {
          dataSrc: [11],
          // cuenat la cantidad de filas de cada grupo
          startRender: function(rows, group) {
            return group + " (" + rows.count() + ")";
          },
        },
        // drag and drop columnas de la tabla
        colReorder: true,
        // Tabla con scroll
        // scrollY: 200,
        // Paginación de la taba
        // paging: false,
        // Botenes de la tabla
        buttons: ["excelHtml5", "print"],
        // Filtro Si agregamos una P en el don aparece el buscar
        dom: '"QPBfrtilp"',
        language: {
          infoEmpty: "No hay resultados disponibles",
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
        createdRow: function(row, data, index) {
          // console.log(data[3])
          //pintar una celda si hay cometarios
          if (data[13] !== "null" && data[13].length !== 0) {
            //pinta una fila
            $("td", row).css({
              "background-color": "#FFE4C4",
            });
          }
          if (data[3] == "**EMPADRONAR**") {
            //pinta una fila
            $("td", row).css({
              "background-color": "#ff5252",
              color: "white",
              "border-style": "solid",
              "border-color": "#bdbdbd",
            });
          }
          if (data[12] == 0) {
            //Pinta en rojo una celda
            $("td", row).eq(12).css({
              "background-color": "#ff5252",
              color: "white",
            });
          }
          // Estilo a la celda
          $("td", row).eq(0).css({
            "font-size": "14px",
            "text-align": "center",
          });
          $("td", row).eq(1).css({
            "text-align": "center",
          });
          $("td", row).eq(2).css({
            "font-size": "14px",
          });
          $("td", row).eq(3).css({
            "font-size": "14px",
          });
          $("td", row).eq(4).css({
            "text-align": "center",
          });
          $("td", row).eq(5).css({
            "text-align": "center",
          });
          $("td", row).eq(7).css({
            "text-align": "center",
          });
          $("td", row).eq(14).css({
            "text-align": "center",
          });
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
        // console.log(data)
        id = data['id'];
        consultarUnCliente(id);
      });
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===


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
        parrafo.textContent = "Información Buena Fe"
      });

      fetch(
          `../../api/pre_buenafe.php?id=${id}&opcion=${opcion}`, {
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
          $("#consultarApagar2").val(datos[0].apagar);
          $("#consultarPagado").val(datos[0].pagado);
          $("#consultarTorneo").val(datos[0].torneo);
          $("#observaciones").val(datos[0].observaciones);
          $("#consultarEstado").val(datos[0].estado);
          $("#consultarPrograma1").val(datos[0].programa1);
          // muestra o oculta el input PROGRAMA 1 dependiento si tiene dato o no
          if (datos[0].programa1 !== null && datos[0].programa1 !== '') {
            $('.ocultarPrograma').show();
          } else {
            $('.ocultarPrograma').hide();
          }

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


    // === CONSULTA SALDO DE LA CTA CTE === 
    function consultarSaldo() {
      saldo_institucion = 'inscripciones_users'
      opcion = 11;
      fetch(
          `../../api/pre_buenafe.php?cuit=${CtaCteCUIT}&opcion=${opcion}`, {
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
            saldoTexto.innerHTML = "Valorización Inscripciones Provisorias: " + '<span id="saldo" style="font-size: 20px;">$ ' + datos[0]['apagar'] + '</span>';

            if (datos[0]['apagar'] > '0') {
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


    // === MOSTRAR - OCULTAR FILTRO ===
    var valorFiltro = localStorage.mostrarFiltro_buenaFe;

    function filtros() {
      if (valorFiltro == 1) {
        mostrarFiltros()
      } else {
        ocultarFiltros()
      }
    }

    function mostrarFiltros() {
      var mostrarFiltro_buenaFe = 1;
      $('#mostrarFiltros').hide();
      $('#ocultarFiltros').show();
      $('.dtsp-panesContainer').show();
      $('.dtsb-searchBuilde').show();
      localStorage.mostrarFiltro_buenaFe = mostrarFiltro_buenaFe;
    }

    function ocultarFiltros() {
      var mostrarFiltro_buenaFe = 0;
      $('#mostrarFiltros').show();
      $('#ocultarFiltros').hide();
      $('.dtsp-panesContainer').hide();
      $('.dtsb-searchBuilder').hide();
      localStorage.mostrarFiltro_buenaFe = mostrarFiltro_buenaFe;
    }
    // === FIN MOSTRAR - OCULTAR FILTRO ===

    function refresh() {
      table.ajax.reload(null, false);
      if (saldo_institucion == "inscripciones_users") {
        consultarSaldo();
      }
    }
  </script>
</body>

</html>