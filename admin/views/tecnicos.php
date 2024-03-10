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
  <!-- fontawesome PRO -->
  <script src="../../fw_pro.js" crossorigin="anonymous"></script>
  <!-- DataTable -->
  <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
  <link href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
  <!-- Sweet Alert2 -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="shortcut icon" href="../../assets/rio_logo.png">
  <title>Rioplatense - Tecnicos</title>
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
  .selection-sex {
    height: calc(1.5em + 1.9rem + 4px) !important;
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
      <h1>Tecnicos</h1>
    </div>
    <div class="col-lg-12">
      <div class="table-responsive">
        <table id="tablaClientes" class="display responsive nowrap compact table-bordered" style="width: 100%">
          <thead class="text-center">
            <tr>
              <th class="text-center">DNI</th>
              <th class="text-center">Apellido</th>
              <th class="text-center">Nombre</th>
              <th class="text-center">Sexo</th>
              <th class="text-center">Fecha Nac.</th>
              <th class="text-center">Edad</th>
              <th class="text-center">Lic N°</th>
              <th class="text-center">Funcion</th>
              <th class="text-center">Telefono</th>
              <th class="text-center">Email</th>
              <th class="text-center">Especialidad</th>
              <th class="text-center">Categoria</th>
              <th class="text-center">Institucion 1</th>
              <th class="text-center">Institucion 2</th>
              <th class="text-center">Institucion 3</th>
              <th class="text-center">ID</th>
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

  <!-- FROMULARIO MODAL CONSULTA/EDICION USUARIO -->
  <!-- <form class="modal fade" id="modalConsulta" action="api/tecnicos.php" method="POST"> -->
  <form class="modal fade" id="modalConsulta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title consultaModalLabel" id="consultaModalLabel">Información Tecnicos</h4>
          <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="col-lg-12 ">
          <div class="form-group">
            <input name="id" type="number" class="form-control form-control-user ocultarID" id="consultarID" placeholder="ID" />
          </div>
          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="licencia" type="number" class="form-control form-control-user" id="consultarLicencia" placeholder="Licencia" />
              <label class="ml-1" for="floatingInput">Liciencia</label>
            </div>

            <div class="col-sm-6 mb-0 mb-sm-0 form-floating">
              <input name="dni" type="number" class="form-control form-control-user" id="consultarDNI" placeholder="DNI" required />
              <label class="ml-1" for="floatingInput">DNI</label>
            </div>
          </div>

          <div class="form-group row mb-0">
            <div class="form-group form-floating">
              <input name="nombre" type="text" class="form-control form-control-user" id="consultarFirstName" placeholder="Nombre" required />
              <label for="floatingInput">Nombre</label>
            </div>
            <div class="form-group form-floating">
              <input name="apellido" type="text" class="form-control form-control-user" id="consultarLastName" placeholder="Apellido" required />
              <label class="ml-1" for="floatingInput">Apellido</label>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="fechaNacimiento" type="date" class="form-control form-control-user" id="consultarFechaNacimiento" placeholder="Fecha Nacimeinto" required />
              <label class="ml-1" for="floatingInput">Fecha Nacimiento</label>
            </div>
            <div class="col-sm-6 form-floating">
              <input name="edad" type="number" class="form-control form-control-user" id="consultarEdad" placeholder="Edad" />
              <label class="ml-1" for="floatingInput">Edad</label>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="funcion" type="text" class="form-control form-control-user selection-sex" id="consultarFuncion" placeholder="Funcion" required />
              <label class="ml-1" for="floatingInput">Funcion</label>
            </div>
            <div class="form-group col-sm-6 mb-3 form-floating">
              <select name="sexo" class="form-control form-select selection-sex" id="consultarSexo" required>
                <option value=""></option>
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
                <option value="BINARIO">BINARIO</option>
              </select>
              <label for="floatingSelect">Sexo</label>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="email" type="email" class="form-control form-control-user" id="consultarEmail" placeholder="Email" required />
              <label for="floatingInput">E-mail</label>
            </div>

            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="telefono" type="text" class="form-control form-control-user" id="consultarTelefono" placeholder="Telefono" />
              <label class="ml-1" for="floatingInput">Telefono</label>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="especialidad" type="text" class="form-control form-control-user" id="consultarEspecialidad" placeholder="Especialidad" />
              <label class="ml-1" for="floatingInput">Especialidad</label>
            </div>
            <div class="col-sm-6 form-floating">
              <input name="categoria" type="text" class="form-control form-control-user" id="consultarCategoria" placeholder="Nivel" />
              <label class="ml-1" for="floatingInput">Nivel</label>
            </div>
          </div>

          <div class="form-group form-floating">
            <select name="cuit1" class="form-select" id="consultarCuit1" required>
              <option value=""></option>
              <?php //Completa el SELECT on los datos de la tabla CLUBS
              $select = mysqli_query($con, "SELECT * FROM clubs ORDER BY institucion");
              while ($clubs1 = mysqli_fetch_row($select)) {
              ?>
                <option value="<?php echo $clubs1[1] ?>"><?php echo $clubs1[2] ?></option>
              <?php } ?>
            </select>
            <label for="floatingSelect">Institucion 1</label>
          </div>

          <div class="form-group form-floating">
            <select name="cuit2" class="form-select" id="consultarCuit2">
              <option selected value="0"></option>
              <?php //Completa el SELECT on los datos de la tabla CLUBS
              $select = mysqli_query($con, "SELECT * FROM clubs ORDER BY institucion");
              while ($clubs2 = mysqli_fetch_row($select)) {
              ?>
                <option value="<?php echo $clubs2[1] ?>"><?php echo $clubs2[2] ?></option>
              <?php } ?>
            </select>
            <label for="floatingSelect">Institucion 2</label>
          </div>

          <div class="form-group form-floating">
            <select name="cuit3" class="form-select" id="consultarCuit3">
              <option selected value="0"></option>
              <?php //Completa el SELECT on los datos de la tabla CLUBS
              $select = mysqli_query($con, "SELECT * FROM clubs ORDER BY institucion");
              while ($clubs3 = mysqli_fetch_row($select)) {
              ?>
                <option value="<?php echo $clubs3[1] ?>"><?php echo $clubs3[2] ?></option>
              <?php } ?>
            </select>
            <label for="floatingSelect">Institucion 3</label>
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
            <input name="dni" type="number" id="consultarDNI2" />
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
  <!-- END CONSULTA/EDICION USUARIO -->

  <!-- FROMULARIO MODAL ALTA USUARIOS -->
  <!-- <form class="modal fade" id="formAlta" action="api/tecnicos.php" method="POST"> -->
  <form class="modal fade" id="formAlta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="altaModalLabel">Alta Tecnicos</h4>
          <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="col-lg-12 ">
          <div class="form-group">
            <input name="id" type="number" class="form-control form-control-user ocultarID" id="consultarID" placeholder="ID" />
          </div>
          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="licencia" type="number" class="form-control form-control-user" id="altaLicencia" placeholder="Licencia" />
              <label class="ml-1" for="floatingInput">Liciencia</label>
            </div>

            <div class="col-sm-6 mb-0 mb-sm-0 form-floating">
              <input name="dni" type="number" class="form-control form-control-user" id="altaDNI" placeholder="DNI" required />
              <label class="ml-1" for="floatingInput">DNI</label>
            </div>
          </div>

          <div class="form-group row mb-0">
            <div class="form-group form-floating">
              <input name="nombre" type="text" class="form-control form-control-user" id="altaFirstName" placeholder="Nombre" required />
              <label for="floatingInput">Nombre</label>
            </div>
            <div class="form-group form-floating">
              <input name="apellido" type="text" class="form-control form-control-user" id="altaLastName" placeholder="Apellido" required />
              <label class="ml-1" for="floatingInput">Apellido</label>
            </div>
          </div>

          <div class="form-group row mb-0">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="fechaNacimiento" type="date" class="form-control form-control-user selection-sex" id="altaFechaNacimiento" placeholder="Fecha Nacimeinto" required />
              <label class="ml-1" for="floatingInput">Fecha Nacimiento</label>
            </div>
            <div class="form-group col-sm-6 mb-3 form-floating">
              <select name="sexo" class="form-control form-select selection-sex" id="consultarSexo" required>
                <option value=""></option>
                <option value="MASCULINO">MASCULINO</option>
                <option value="FEMENINO">FEMENINO</option>
                <option value="BINARIO">BINARIO</option>
              </select>
              <label class="ml-1" for="floatingSelect">Sexo</label>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="email" type="email" class="form-control form-control-user" id="altaEmail" placeholder="Email" required />
              <label class="ml-1" for="floatingInput">E-mail</label>
            </div>

            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="telefono" type="text" class="form-control form-control-user" id="altaTelefono" placeholder="Telefono" />
              <label class="ml-1" for="floatingInput">Telefono</label>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0 form-floating">
              <input name="funcion" type="text" class="form-control form-control-user" id="altaFuncion" placeholder="Funcion" required />
              <label class="ml-1" for="floatingInput">Funcion</label>
            </div>

            <div class="col-sm-6 form-floating">
              <input name="categoria" type="text" class="form-control form-control-user" id="altaCategoria" placeholder="Nivel" />
              <label class="ml-1" for="floatingInput">Nivel</label>
            </div>
          </div>

          <div class="form-group form-floating">
            <input name="especialidad" type="text" class="form-control form-control-user" id="altaEspecialidad" placeholder="Especialidad" />
            <label class="ml-1" for="floatingInput">Especialidad</label>
          </div>

          <div class="form-group form-floating">
            <select name="cuit1" class="form-select" id="altaCuit1" required>
              <option value=""></option>
              <?php //Completa el SELECT on los datos de la tabla CLUBS
              $select = mysqli_query($con, "SELECT * FROM clubs ORDER BY institucion");
              while ($clubs1 = mysqli_fetch_row($select)) {
              ?>
                <option value="<?php echo $clubs1[1] ?>"><?php echo $clubs1[2] ?></option>
              <?php } ?>
            </select>
            <label for="floatingSelect">Institucion 1</label>
          </div>

          <div class="form-group form-floating">
            <select name="cuit2" class="form-select" id="altaCuit2">
              <option value="0"></option>
              <?php //Completa el SELECT on los datos de la tabla CLUBS
              $select = mysqli_query($con, "SELECT * FROM clubs ORDER BY institucion");
              while ($clubs2 = mysqli_fetch_row($select)) {
              ?>
                <option value="<?php echo $clubs2[1] ?>"><?php echo $clubs2[2] ?></option>
              <?php } ?>
            </select>
            <label for="floatingSelect">Institucion 2</label>
          </div>

          <div class="form-group form-floating">
            <select name="cuit3" class="form-select" id="altaCuit3">
              <option value="0"></option>
              <?php //Completa el SELECT on los datos de la tabla CLUBS
              $select = mysqli_query($con, "SELECT * FROM clubs ORDER BY institucion");
              while ($clubs3 = mysqli_fetch_row($select)) {
              ?>
                <option value="<?php echo $club3[1] ?>"><?php echo $clubs3[2] ?></option>
              <?php } ?>
            </select>
            <label for="floatingSelect">Institucion 3</label>
          </div>


          <!-- <div>
            <label class="labelDatosAdicionales mb-0"><b>Alta:</b>
              <input name="datosAlta" type="text" class="datosAdicionales" id="datosAlta" disabled />
            </label>
            <label class="labelDatosAdicionales"><b>Ultima modificación:</b>
              <input name="datosMod" type="text" class="datosAdicionales" id="datosMod" disabled />
            </label>
          </div> -->

          <div class="ocultarInputOpcion">
            <input name="opcion" type="text" value="4">
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
  <!-- FIN FROMULARIO MODAL ALTA USUARIOS -->

  <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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

  <!-- <script src="js/lecturaTabla_general.js"></script> -->
  <script src="../../js/editarDatos_general.js"></script>
  <script src="../../js/altas_general.js"></script>
  <script src="../../js/eliminarByID.js"></script>
  <script src="../../js/eliminaTodo.js"></script>
  <script src="../../js/logout.js"></script>

  <script>
    var id = 0;
    var opcion = '';
    var tabla = 'tecnicos';

    $(document).ready(function() {
      listar();
    });

    // === CARGA LA TABLA CON DATOS ===
    // Accede y vuelca los datos del array en la tabla
    var listar = function() {
      opcion = 0;
      table = $("#tablaClientes").DataTable({
        ajax: {
          method: "GET",
          url: "../../api/tecnicos.php",
          data: {
            opcion: opcion
          },
        },
        columns: [{
            data: "dnitecnico"
          }, {
            data: "apellidotecnico"
          },
          {
            data: "nombretecnico"
          },
          {
            data: "sexotecnico"
          },
          {
            data: "newfechanactecnico"
          },
          {
            data: "edadtecnico"
          },
          {
            data: "licencia"
          },
          {
            data: "funciontecnico"
          },
          {
            data: "telefono"
          },
          {
            data: "emailtecnico"
          },
          {
            data: "especialidadtecnico"
          },
          {
            data: "categoriatecnico"
          },
          {
            data: "institucion1"
          },
          {
            data: "institucion2"
          },
          {
            data: "institucion3"
          },
          {
            data: "id_tecnicos"
          },
          {
            defaultContent: "<button type='button' class='btn btn-info btn-circle btn-sm btnInfo'><i class='fas fa-info-circle'></i></button>	<button type='button' class='btn btn-primary btn-circle btn-sm btnEdit'><i class='fas fa-edit'></i></button></button>	<button type='button' class='btn btn-danger btn-circle btn-sm btnDel'><i class='fas fa-trash'></i></button>"
          },
        ],
        // ESTILOS DE LA TABLA
        lengthMenu: [15, 25, 50, 75, 100], //indica opciones de cantidad renglon en pantalla
        columnDefs: [
          // === Oculta columnas ===
          {
            targets: [15],
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
        createdRow: function(row, data, index) {
          $("td", row).eq(0).css({
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
          $("td", row).eq(6).css({
            "text-align": "center",
          });
          $("td", row).eq(7).css({
            "text-align": "center",
          });
          $("td", row).eq(11).css({
            "text-align": "center",
          });
        },

        dom: '"Bfrtilp"',
        buttons: ["excelHtml5", "pdfHtml5", "print"],
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
      });
      obtener_data_editar("#tablaClientes tbody", table);
      obtener_data_info("#tablaClientes tbody", table);
      obtener_data_borrar("#tablaClientes tbody", table);
    }
    // ===  FIN CARGA LA TABLA CON DATOS ===


    // Obtiene el ID para mostrar datos
    var obtener_data_info = function(tbody, table) {
      $(tbody).on("click", "button.btnInfo", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id_tecnicos'];
        consultarUnCliente(id);
      });
    }

    // Obtiene el ID para editar datos
    var obtener_data_editar = function(tbody, table) {
      $(tbody).on("click", "button.btnEdit", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id_tecnicos'];
        consultarUnCliente(id);
      });
    }

    // Obtiene el ID para Eliminar un dato
    var obtener_data_borrar = function(tbody, table) {
      $(tbody).on("click", "button.btnDel", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id_tecnicos'];
        eliminarCliente(id);
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
        let titulo = document.querySelector(".consultaModalLabel");
        titulo.textContent = "Información Tecnicos";
      });

      // Muestra formulario modo Edición
      $(document).on("click", ".btnEdit", function() {
        $(".form-control").prop('disabled', false);
        $(".form-select").prop('disabled', false);
        $("#consultarLicencia").prop('disabled', true);
        $("#consultarEdad").prop('disabled', true);
        $("#consultarDNI").prop('disabled', true);
        $(".labelDatosAdicionales").hide();
        $('#botonAceptar').show();
        let titulo = document.querySelector(".consultaModalLabel");
        titulo.textContent = "Editando Tecnicos";
      });
      // consulta a base de datos según ID y opcion
      fetch(
          `../../api/tecnicos.php?id=${id}&opcion=${opcion}`, {
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
          $("#consultarID").val(datos[0].id_tecnicos);
          $("#consultarLicencia").val(datos[0].licencia);
          $("#consultarFirstName").val(datos[0].nombretecnico);
          $("#consultarLastName").val(datos[0].apellidotecnico);
          $("#consultarDNI").val(datos[0].dnitecnico);
          $("#consultarFuncion").val(datos[0].funciontecnico);
          $("#consultarFechaNacimiento").val(datos[0].fechanactecnico);
          $("#consultarEdad").val(datos[0].edadtecnico);
          $("#consultarSexo").val(datos[0].sexotecnico);
          $("#consultarEmail").val(datos[0].emailtecnico);
          $("#consultarDNI").val(datos[0].dnitecnico);
          $("#consultarDNI2").val(datos[0].dnitecnico);
          $("#consultarEspecialidad").val(datos[0].especialidadtecnico);
          $("#consultarCategoria").val(datos[0].categoriatecnico);
          $("#consultarTelefono").val(datos[0].telefono);
          $("#consultarCuit1").val(datos[0].cuit1);
          $("#consultarCuit2").val(datos[0].cuit2);
          $("#consultarCuit3").val(datos[0].cuit3);
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
    var urlEdit = '../../api/tecnicos.php';
    // === FIN ACTUALIZAR DATOS ===

    // === ALTA de USUARIO ===
    var urlAlta = '../../api/tecnicos.php';
    // === FIN Alta USUARIO ===

    function refresh() {
      table.ajax.reload(null, false);
    }
  </script>
</body>

</html>