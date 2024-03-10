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
  <title>Rioplatense - Buena Fe</title>
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
    text-align: center;
    font-size: 8.5px;
  }

  td {
    font-size: 10px;
  }

  input,
  select {
    font-weight: 700 !important;
  }

  .ocultarInputOpcion,
  .ocultarFiltros,
  .ocultarGrupos {
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
    font-size: 13px;
    background-color: rgb(133, 130, 130) !important;
  }

  .dtrg-level-1 th {
    background-color: rgb(173, 169, 169) !important;
  }

  /*oculta boton de ALTA  */
  .opciones .mas {
    display: none;
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
      <h1>Archivo Buena Fe</h1>
    </div>

    <!-- toma el tipo de acceso y password del usuario -->
    <div class="ocultarInputOpcion">
      <input name="tipoAcceso" id="tipoAcceso" type="text" value="<?php echo $user['acceso'] ?>">
      <input type="text" name="userPass" id="userPass" value="<?php echo $user['password'] ?>">
    </div>

    <!-- Filtros y Grupos de la Tabla -->
    <div class="form-row col-md-3">
      <div class="form-group mb-0 p-1">
        <button class="btn btn-secondary mostrarFiltros" id="mostrarFiltros" name="filtros" onclick="mostrarFiltros()" title="Filtros DESACTIVADOS"><i class="fas fa-filter"></i></button>
        <button class="btn btn-success ocultarFiltros" id="ocultarFiltros" name="filtros" onclick="ocultarFiltros()" title="Filtros ACTIVADOS"><i class="fas fa-filter"></i></button>
      </div>
    </div>
    <!-- FIN Filtros y Grupos de la Tabla -->


    <div class="col-lg-12">
      <div class="table-responsive">
        <table id="tablaClientes" class="display responsive nowrap compact table-bordered" style="width: 100%">
          <thead class="text-center">
            <tr>
              <th>DNI</th>
              <!-- <th>Sexo</th>
              <th>Apellido</th>
              <th>Nombres</th>
              <th>Fecha Nacimiento</th>
              <th>Edad</th> -->
              <th>Divisional</th>
              <th>Eficiencia</th>
              <th>Categoria</th>
              <th>Disciplina</th>
              <th>Programa</th>
              <th>Posicion</th>
              <th>Tipo Licencia</th>
              <th>A Pagar</th>
              <th>Pagado</th>
              <th>Torneo</th>
              <th>Institución</th>
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
  <form class="modal fade" id="modalConsulta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <!-- cabecera del modal -->
        <div class="modal-header text-center">
          <h1 class="modal-title text-rigth" id="exampleModalLabel">Información Buena Fe Patinador/a</h1>
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
                      <input name="sexo" class="form-control" id="consultarSexo" required>
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
                      <input name="cuit" class="form-control" id="consultarCuit" required>
                      <label for="floatingSelect">Club</label>
                    </div>

                    <div class="form-group col-md-4 form-floating">
                      <input name="licencia" class="form-control" id="consultarLicencia" required>
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
                    <div class="form-group col-md-8 form-floating">
                      <input name="disciplina" class="form-control form-control-edit" id="consultarDisciplina" required>
                      <label for="floatingSelect">Disciplina</label>
                    </div>

                    <div class="form-group col-md-4 form-floating">
                      <input name="apagar" type="number" class="form-control form-control-edit text-end" id="consultarApagar" placeholder="A pagar" required />
                      <label for="floatingInput">A pagar</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-4 form-floating">
                      <input name="divisional" class="form-control form-control-edit" id="consultarDivisional" required>
                      <label for="floatingSelect">Divisional</label>
                    </div>
                    <div class="form-group col-md-4 form-floating">
                      <input name="eficiencia" class="form-control form-control-edit" id="consultarEficiencia" required>
                      <label for="floatingSelect">Eficiencia</label>
                    </div>
                    <div class="form-group col-md-4 form-floating">
                      <input name="categoria" class="form-control form-control-edit" id="consultarCategoria" required>
                      <label for="floatingSelect">Categoria</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-12 form-floating">
                      <input name="programa1" class="form-control form-control-edit" id="consultarPrograma1" required>
                      <label for="floatingSelect">Programa</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-8 form-floating">
                      <input name="torneo" class="form-control form-control-edit" id="consultarTorneo" required>
                      <label for="floatingSelect">Torneo</label>
                    </div>

                    <div class="form-group col-md-4 form-floating">
                      <input name="posicion" type="number" class="form-control form-control-edit posicion" id="consultarPosicion" placeholder="Posición" />
                      <label for="floatingInput">Posición</label>
                    </div>

                  </div>

                  <div class="form-floating">
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

  <!-- FROMULARIO MODAL BORRAR ARCHIVO -->
  <form class="modal fade" id="formModalBorrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h1 class="modal-title text-rigth" id="exampleModalLabel">Eliminar Buena Fe</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="col-lg-12 modal-body">
          <!-- si el usuario es administrador se pregunta si elimina todo o algun club en particular -->
          <?php if ($user['acceso'] == 'administrador') : ?>
            <p class="ml-4 font-weight-bold text-danger">Usted es un ADMINISTRADOR y esta por eliminar competidores del PADRON. Podrá eliminar TODOS los patinadores o SOLO aquellos del TORNEO que seleccione!!</p>
            <div class="form-group col-md-12 form-floating">
              <select name="torneo" class="form-control form-control-user" id="torneo">
                <option value=""></option>
                <option value="0">Eliminar TODOS</option>
                <?php
                $select = mysqli_query($con, "SELECT hbuenafe.torneo FROM hbuenafe GROUP BY hbuenafe.torneo ORDER BY hbuenafe.torneo");
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
              Cancelar
            </button>
            <button class="btn btn-primary" type="submit">Aceptar</button>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!-- FIN FROMULARIO MODAL BORRAR ARCHIVO -->


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
  <!-- Librerias para exportar la tabla a distintos documentos -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>

  <script src="../../js/lecturaTabla_general.js"></script>
  <script src="../../js/logout.js"></script>

  <script>
    var userPass = $("#userPass").val();
    var tipoAcceso = $("#tipoAcceso").val();
    var opcion = '';

    // === CARGA LA TABLA CON DATOS ===
    var url = '';
    var opcionDataTable = 'archivoBuenaFe';
    opcion = 0;
    url = `../../api/historiabuenafe.php?opcion=${opcion}`;

    // Accede y vuelca los datos del array en la tabla
    function consultarDatosATabla(dato) {
      $("#tablaClientes tbody").append(
        `<tr>
                    <td class="text-center">${dato.dnibuenafe}</td>
                    <td>${dato.divisional}</td>
                    <td>${dato.eficiencia}</td>
                    <td>${dato.categoria}</td>
                    <td>${dato.disciplina}</td>
                    <td>${dato.programa1}</td>
                    <td>${dato.posicion}</td>
                    <td>${dato.tipolicencia}</td>
                    <td class="text-end">${dato.apagar}</td>
                    <td class="text-end">${dato.pagado}</td>
                    <td>${dato.torneo}</td>
                    <td>${dato.institucion}</td>
                    <td>${dato.estado}</td>
                    <td class="text-center">
                        <a href="#" onclick="consultarUnCliente(${dato.id})" class="btn btn-info btn-circle btn-sm btnInfo">
                                <i class="fas fa-info-circle"></i>
                            </a>
                    </td>
                </tr>`
      );
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
      });

      // Muestra formulario modo Edición
      $(document).on("click", ".btnEdit", function() {
        $(".form-control").prop('disabled', true);
        $(".form-select").prop('disabled', true);
        $(".form-control-edit").prop('disabled', false);
        $(".labelDatosAdicionales").hide();
        $('#botonAceptar').show();
        if (tipoAcceso != "administrador") {
          $(".posicion").prop('disabled', true);
        }
      });

      fetch(
          `../../api/historiabuenafe.php?id=${id}&opcion=${opcion}`, {
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
          $("#consultarPrograma1").val(datos[0].programa1);
          $("#consultarApagar").val(datos[0].apagar);
          $("#consultarTorneo").val(datos[0].torneo);
          $("#consultarPosicion").val(datos[0].posicion);
          $("#observaciones").val(datos[0].observaciones);


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

    // ELIMINAR ARCHIVO
    function eliminarTodos() {
      $(".form-control").prop('disabled', false);
      // aviso previo antes de eliminar todos los usuarios
      Swal.fire({
        title: 'Esta seguro?',
        text: "Esta por eliminar datos del Archivo Buena Fe. A continuación se le solicitará su password y luego deberá seleccionar el torneo a eliminar!!!",
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
      opcion = 5;
      var torneo = $("#torneo").val();
      if (torneo === '') {
        Swal.fire({
          icon: 'error',
          title: 'Ups..!',
          text: 'Debe seleccionar una opción a ejecutar!',
        });
      } else {
        fetch(
            `../../api/historiabuenafe.php?opcion=${opcion}&torneo=${torneo}`, {
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
                text: 'Lista de Buena Fe eliminada!!',
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

    // === MOSTRAR - OCULTAR FILTRO ===
    var valorFiltro = localStorage.mostrarFiltro_archivoBuenaFe;

    function filtros() {
      if (valorFiltro == 1) {


        mostrarFiltros()
      } else {

        ocultarFiltros()
      }
    }

    function mostrarFiltros() {
      var mostrarFiltro_archivoBuenaFe = 1;
      localStorage.mostrarFiltro_archivoBuenaFe = mostrarFiltro_archivoBuenaFe;
      $('#mostrarFiltros').hide();
      $('#ocultarFiltros').show();
      $('.dtsp-panesContainer').show();
      $('.dtsb-searchBuilde').show();
    }

    function ocultarFiltros() {
      var mostrarFiltro_archivoBuenaFe = 0;
      localStorage.mostrarFiltro_archivoBuenaFe = mostrarFiltro_archivoBuenaFe;
      $('#mostrarFiltros').show();
      $('#ocultarFiltros').hide();
      $('.dtsp-panesContainer').hide();
      $('.dtsb-searchBuilder').hide();
    }
    // === FIN MOSTRAR - OCULTAR FILTRO ===
  </script>
</body>

</html>