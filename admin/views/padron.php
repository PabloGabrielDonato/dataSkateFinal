<?php include('modulos/encabezado_user_admin.php');
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
  <link rel="shortcut icon" href="assets/rio_logo.png">
  <title>Rioplatense - Padron</title>
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

  th,
  td {
    font-size: 13px;
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
      <h1>Padron</h1>
    </div>

    <!-- CARGA VIA EXCEL -->
    <section id="contenedor"></section>

    <div class="col-lg-12 row mb-3 mt-4" id="altaExcel">
      <div class="form-group col-md-3 mb-0">
        <select name="cuit" class="form-control form-control-user" id="modificarCuit">
          <option value="">Seleccionar Institucion</option>
          <?php //Completa el SELECT on los datos de la tabla CLUBS
          $select = mysqli_query($con, "SELECT * FROM clubs ORDER BY institucion");
          while ($clubs = mysqli_fetch_row($select)) {
          ?>
            <option value="<?php echo $clubs[1] ?>"><?php echo $clubs[2] ?></option>
          <?php } ?>
        </select>
      </div>

      <div class="input-group col-sm-4 btn-icon-split excel">
        <div class="custom-file">
          <input type="file" name="dataCliente" id="txt_archivo" class="custom-file-input" accept=".xlsx, .xls, .xlsb, .xlsm" onChange="onLoadImage(event.target.files)">
          <label class="custom-file-label" for="inputGroupFile04" id="nombreArchivo"><b>Seleccionar EXCEL</b></label>
        </div>
        <div class="input-group-append btn-icon-split">
          <button class="btn btn-danger" type="submit" name="subir" onclick="pasarCuit()">Grabar</button>
        </div>
      </div>

      <div class="form-group col-md-1 m-0">
        <button class="btn btn-secondary mostrarFiltros" id="mostrarFiltros" name="filtros" onclick="mostrarFiltros()" title="Muestra filtros para aplicar a la tabla"><i class="fas fa-filter"></i></button>
        <button class="btn btn-success ocultarFiltros" id="ocultarFiltros" name="filtros" onclick="ocultarFiltros()" title="Muestra filtros para aplicar a la tabla"><i class="fas fa-filter"></i></button>
      </div>

      <div class="form-group col-md-3 mb-0">
        <span class="pr-2"><b>Estado Padrón PROVISORIO: <?php echo $estado['estado'] ?></b></span>
        <button type='submit' class='btn btn-primary btn-circle btn-sm btnEdit' data-bs-toggle="modal" data-bs-target="#modalPadron"><i class='fas fa-edit'></i></button>
      </div>

    </div>

    <div class="mb-3">
      <?php if ($estado['estado'] == 'ABIERTO') { ?>
        <button type="button" class="btn btn-outline-info ml-3" onclick="generarPrePadron()">GENERAR PADRON PROVISORIO</button>
      <?php } ?>
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
              <th>Fecha Alta</th>
              <th>id</th>
              <th>CAP</th>
              <th>Seguro</th>
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
                  Datos Personales
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
                      <input name="nacionalidad" type="text" class="form-control form-control-user" id="consultarNacionalidad" placeholder="Nacionalidad" />
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
                <button class="accordion-button collapsed show" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  Domicilio
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-row">
                    <div class="form-group col-md-12 form-floating">
                      <input name="domicilio" type="text" class="form-control form-control-user" id="consultarDomicilio" placeholder="Domicilio" />
                      <label for="floatingInput">Domicilio</label>
                    </div>
                  </div>
                  <div class="form-row">

                    <div class="form-group col-md-6 form-floating">
                      <input name="localidad" type="text" class="form-control form-control-user" id="consultarLocalidad" placeholder="Localidad" />
                      <label for="floatingInput">Localidad</label>
                    </div>
                    <div class="form-group col-md-6 form-floating">
                      <input name="partido" type="text" class="form-control form-control-user" id="consultarPartido" placeholder="Partido" />
                      <label for="floatingInput">Partido</label>
                    </div>
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <input name="cp" type="text" class="form-control form-control-user" id="consultarCP" placeholder="Cód. Postal" required />
                      <label for="floatingInput">Cód. Postal</label>
                    </div>
                    <div class="form-group col-md-6 form-floating">
                      <input name="provincia" type="text" class="form-control form-control-user" id="consultarProvincia" placeholder="Provincia" />
                      <label for="floatingInput">Provincia</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Acordeon 3 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed show" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  Datos del Club
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-row">
                    <div class="form-group col-md-12 form-floating">
                      <select name="cuit" class="form-control form-control-user" id="consultarCuit" placeholder="Club" required>
                        <?php //Completa el SELECT on los datos de la tabla CLUBS
                        $select = mysqli_query($con, "SELECT * FROM clubs");
                        while ($clubs = mysqli_fetch_row($select)) {
                        ?>
                          <option value="<?php echo $clubs[1] ?>"><?php echo $clubs[2] ?></option>
                        <?php } ?>
                      </select>
                      <label for="floatingSelect">Club</label>
                    </div>

                    <!-- <div class="form-group col-md-6 form-floating">
                      <input name="pagoLicencia" type="number" class="form-control form-control-user" id="consultarPagoLicencia" placeholder="Valor Pagado de Licencia" required />
                      <label for="floatingInput">Valor Pagado de Licencia</label>
                    </div> -->

                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <select name="licencia" class="form-control form-control-user" id="consultarLicencia" onchange="valorConsultaLicenciaID()" placeholder="Licencia" required>
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
                      <input name="valorLicencia" type="number" class="form-control form-control-user" id="consultarValorLicencia" placeholder="Valor Licencia" required />
                      <label for="floatingInput">Valor Licencia</label>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <!-- Acordeon 4 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingFour">
                <button class="accordion-button collapsed show" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                  Datos de los padres
                </button>
              </h2>
              <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
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

            <!-- Acordeon 5 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingFour">
                <button class="accordion-button collapsed show" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                  Información de la CAP y Seguro
                </button>
              </h2>
              <div id="collapseFive" class="accordion-collapse collapse show" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-row">

                    <div class="form-group col-md-6 form-floating">
                      <select name="estadocap" class="form-control form-select" id="consultarCap" required>
                        <!-- <option value="vacio"></option> -->
                        <option value="Pendiente">Pendiente</option>
                        <option value="Registrado">Registrado</option>
                      </select>
                      <label for="floatingSelect">Estado CAP</label>
                    </div>

                    <div class="form-group col-md-6 form-floating">
                      <select name="estadoseguro" class="form-control form-select" id="consultarSeguro" required>
                        <!-- <option value="vacio"></option> -->
                        <option value="Pendiente">Pendiente</option>
                        <option value="Registrado">Registrado</option>
                      </select>
                      <label for="floatingSelect">Estado Seguro</label>
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
            <button class="btn btn-primary btn-modificar" type="submit" id="botonAceptar">Aceptar</button>
          </div>

        </div>
      </div>
    </div>
  </form>
  <!-- END CONSULTA/EDICION USUARIO -->


  <!-- FROMULARIO MODAL ALTA USUARIOS -->
  <form class="modal fade" id="formAlta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <!-- cabecera del modal -->
        <div class="modal-header text-center">
          <h1 class="modal-title text-rigth" id="exampleModalLabel">Alta Patinador/a</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

        <!-- cuerpo del modal -->
        <div class="col-lg-12 modal-body">

          <div class="accordion" id="accordionExample2">
            <!-- Acordeon 1 -->
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  Datos Personales
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-group classid">
                    <input name="id" type="number" class="form-control form-control-user ocultarID" id="consultarID" placeholder="id" />
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-5 form-floating">
                      <input name="dni" type="number" class="form-control" id="altaDni" placeholder="DNI" required />
                      <label for="floatingInput">DNI</label>
                    </div>
                    <div class="form-group col-md-4 form-floating">
                      <input name="fechanacimiento" type="date" class="form-control" id="altaFechaNacimeinto" placeholder="Fecha Nacimeinto" required />
                      <label for="floatingInput">Fecha Nacimiento</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="nacionalidad" type="text" class="form-control form-control-user" id="altaNacionalidad" placeholder="Nacionalidad" required />
                      <label for="floatingInput">Nacionalidad</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-5 form-floating">
                      <input name="nombre" type="text" class="form-control" id="altaFirstName" placeholder="Nombre" required />
                      <label for="floatingInput">Nombre</label>
                    </div>
                    <div class="form-group col-md-7 form-floating">
                      <input name="apellido" type="text" class="form-control" id="altaLastName" placeholder="Apellido" required />
                      <label for="floatingInput">Apellido</label>
                    </div>
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-2 form-floating">
                      <select name="sexo" class="form-control form-select" id="altaSexo" placeholder="Sexo" required>
                        <option value="F">Femenino</option>
                        <option value="M">Masculino</option>
                        <option value="X">Binario</option>
                      </select>
                      <label for="floatingSelect">Sexo</label>
                    </div>
                    <div class="form-group col-md-3 form-floating">
                      <input name="telefono" type="number" class="form-control form-control-user" id="altaTelefono" placeholder="Telefono" />
                      <label for="floatingInput">Telefono</label>
                    </div>
                    <div class="form-group col-md-7 form-floating">
                      <input name="email" type="email" class="form-control form-control-user" id="altaEmail" placeholder="Email" />
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
                      <input name="domicilio" type="text" class="form-control form-control-user" id="altaDomicilio" placeholder="Domicilio" required />
                      <label for="floatingInput">Domicilio</label>
                    </div>
                  </div>
                  <div class="form-row">

                    <div class="form-group col-md-6 form-floating">
                      <input name="localidad" type="text" class="form-control form-control-user" id="altaLocalidad" placeholder="Localidad" required />
                      <label for="floatingInput">Localidad</label>
                    </div>
                    <div class="form-group col-md-6 form-floating">
                      <input name="partido" type="text" class="form-control form-control-user" id="altaPartido" placeholder="Partido" />
                      <label for="floatingInput">Partido</label>
                    </div>
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <input name="cp" type="text" class="form-control form-control-user" id="altaCP" placeholder="Cód. Postal" required />
                      <label for="floatingInput">Cód. Postal</label>
                    </div>
                    <div class="form-group col-md-6 form-floating">
                      <input name="provincia" type="text" class="form-control form-control-user" id="altaProvincia" placeholder="Provincia" required />
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
                      <select name="cuit" class="form-control form-control-user" id="altaCuit" required>
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

                    <!-- <div class="form-group col-md-6 form-floating">
                      <input name="pagoLicencia" type="number" class="form-control form-control-user" id="altaPagoLicencia" placeholder="Valor Pagado de Licencia" required />
                      <label for="floatingInput">Valor Pagado de Licencia</label>
                    </div> -->
                  </div>

                  <div class="form-row">
                    <div class="form-group col-md-6 form-floating">
                      <select name="licencia" class="form-control form-control-user " id="altaLicencia" onchange="valorAltaLicenciaID()" placeholder="Licencia" required>
                        <option value=""></option>
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
                      <input name="valorLicencia" type="number" class="form-control form-control-user" id="altaValorLicencia" placeholder="Valor Licencia" required />
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
              <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="form-row">
                    <div class="form-group col-md-7 form-floating">
                      <input name="nombrePadre" type="text" class="form-control" id="altaNamePadre" placeholder="Nombre del Padre" />
                      <label for="floatingInput">Nombre del Padre</label>
                    </div>
                    <div class="form-group col-md-5 form-floating">
                      <input name="dniPadre" type="number" class="form-control" id="altaDniPadre" placeholder="DNI del Padre" />
                      <label for="floatingInput">DNI del Padre</label>
                    </div>
                  </div>
                  <div class="form-row">
                    <div class="form-group col-md-7 form-floating">
                      <input name="nombreMadre" type="text" class="form-control" id="altaNameMadre" placeholder="Nombre de la Madre" />
                      <label for="floatingInput">Nombre de la Madre</label>
                    </div>
                    <div class="form-group col-md-5 form-floating">
                      <input name="dniMadre" type="number" class="form-control" id="altaDniMadre" placeholder="DNI de la Madre" />
                      <label for="floatingInput">DNI de la Madre</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>

          <div class="ocultarInputOpcion">
            <input name="opcion" type="text" value="4">
            <input name="valorLicencia" type="text" id="altaValorLicencia2">
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
  <!-- FIN FROMULARIO MODAL ALTA USUARIOS -->

  <!-- FROMULARIO MODAL BORRAR PATINADORES -->
  <form class="modal fade" id="formModalBorrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h1 class="modal-title text-rigth" id="exampleModalLabel">Eliminar Patinadores/as</h1>
          <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="col-lg-12 modal-body">
          <!-- Toma la Password del usuario -->
          <input type="text" class="userPass" name="userPass" value="<?php echo $user['password'] ?>" id="userPass">

          <p class="ml-4 font-weight-bold text-danger">Usted es un ADMINISTRADOR y esta por eliminar competidores del PADRON. Podrá eliminar TODOS los patinadores o SOLO aquellos del CLUB que seleccione!!</p>
          <div class="form-group col-md-12 form-floating">
            <select name="cuit" class="form-control form-control-user" id="borrarCuit">
              <option value=""></option>
              <option value="0">Eliminar TODOS</option>
              <?php
              $select = mysqli_query($con, "SELECT patinadores.cuit, clubs.institucion FROM patinadores, clubs WHERE patinadores.cuit=clubs.cuit GROUP BY patinadores.cuit ORDER BY clubs.institucion");
              while ($clubs = mysqli_fetch_row($select)) { ?>
                <option value="<?php echo $clubs[0] ?>"><?php echo $clubs[1] ?></option>
              <?php  }
              ?>
            </select>
            <label for="floatingSelect">Seleccionar opción</label>
          </div>

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
  <!-- FIN FROMULARIO MODAL BORRAR PATINADORES -->

  <!-- FROMULARIO MODAL ESTADO DEL PADRON -->
  <!-- <form class="modal fade" id="modalPadron" action="api/padron.php" method="POST"> -->
  <form class="modal fade" id="modalPadron">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Estado del Padrón</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">

          <div class="mb-3">
            <select name="estadoPadron" id="estadoPadron" class="mb-3 form-control" required>
              <option value="" selected>Seleccionar estado</option>
              <option value="ABIERTO">Abrir Padrón</option>
              <option value="CERRADO">Cerrar Padrón</option>
            </select>
          </div>

          <input type="text" name="opcion" value="6" style="display: none;">

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-primary">Aceptar</button>
        </div>
      </div>
    </div>
  </form>
  <!-- FIN FROMULARIO MODAL ESTADO DEL PADRON -->

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

  <!-- <script src="js/lecturaTabla_general.js"></script> -->
  <script src="js/editarDatos_general.js"></script>
  <script src="js/altas_general.js"></script>
  <script src="js/eliminarByID.js"></script>
  <!-- Eliminar Todo se ejecuta desde esta pagina -->
  <script src="js/logout.js"></script>

  <script>
    var id = 0;
    var opcion = '';
    var tabla = 'padron';
    var saldo_institucion = '';

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
          url: "api/padron.php",
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
            data: "fechaalta"
          },
          {
            data: "id"
          },
          {
            data: "estadocap",
            render: function(data, type) {
              if (data === 'Pendiente') {
                return '<b><span class="badge badge-pill badge-danger">' + data + '</span></b>';
                return data
              };
              if (data === 'Registrado') {
                return '<span class="badge badge-pill badge-success">' + data + '</span>';
                return data
              };
            }
          },
          {
            data: "estadoseguro",
            render: function(data, type) {
              if (data === 'Pendiente') {
                return '<b><span class="badge badge-pill badge-danger">' + data + '</span></b>';
                return data
              };
              if (data === 'Registrado') {
                return '<span class="badge badge-pill badge-success">' + data + '</span>';
                return data
              };
            }
          },
          // {
          //   defaultContent: "<span class='badge badge-pill badge-success'>Informado</span>"
          // },
          {
            defaultContent: "<button type='button' class='btn btn-info btn-circle btn-sm btnInfo'><i class='fas fa-info-circle'></i></button>	<button type='button' class='btn btn-primary btn-circle btn-sm btnEdit'><i class='fas fa-edit'></i></button></button>	<button type='button' class='btn btn-danger btn-circle btn-sm btnDel'><i class='fas fa-trash'></i></button>"
          },
        ],
        // ESTILOS DE LA TABLA
        searchPanes: {
          viewTotal: true,
          layout: "columns-5",
          initCollapsed: true,
        },
        columnDefs: [{
            searchPanes: {
              show: true,
            },
            targets: [4, 5, 12, 14, 15],
          },
          {
            searchPanes: {
              show: false,
            },
            targets: [0, 1, 2, 6, 8, 9, 7, 10, 11, 13],
          },
          // === Oculta columnas ===
          {
            targets: [6, 7, 8, 9, 10, 13, 15, 17],
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
          // if (
          //   (data[17] == 0 || data[17] == "null")
          // ) {
          //   //Pinta en rojo una celda
          //   $("td", row).eq(10).css({
          //     "background-color": "#ff5252",
          //     color: "white",
          //   });
          // }
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
            "text-align": "center",
          });
          $("td", row).eq(10).css({
            "text-align": "center",
          });
          $("td", row).eq(11).css({
            "text-align": "center",
          });
          $("td", row).eq(12).css({
            "text-align": "center",
          })
        },
        // === permite reordenar las columnas ===
        colReorder: true,
        dom: '"QPBfrtilp"',
        buttons: [
          // === Oculta columnas ===
          {
            extend: "excelHtml5",
            exportOptions: {
              columns: ":visible",
            },
          },
          "colvis",
        ],
        language: {
          lengthMenu: "Mostrar _MENU_ registros",
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
      obtener_data_editar("#tablaClientes tbody", table);
      obtener_data_info("#tablaClientes tbody", table);
      obtener_data_borrar("#tablaClientes tbody", table);
      console.log(data[0])
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

    // Obtiene el ID para editar datos
    var obtener_data_editar = function(tbody, table) {
      $(tbody).on("click", "button.btnEdit", function() {
        var data = table.row($(this).parents("tr")).data();
        id = data['id'];
        consultarUnCliente(id);
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
          `api/padron.php?id=${id}&opcion=${opcion}`, {
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
          $("#consultarValorLicencia2").val(datos[0].valorLicencia);
          $("#consultarCap").val(datos[0].estadocap);
          $("#consultarSeguro").val(datos[0].estadoseguro);

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

    // === ACTUALIZA LOS DATOS en la BD by ID ===
    var urlEdit = 'api/padron.php';
    // === FIN ACTUALIZAR DATOS ===

    // === ALTA de USUARIO ===
    var urlAlta = 'api/padron.php';
    // === FIN Alta USUARIO ===

    // ELIMINAR -TODO EL PADRON
    function eliminarTodos() {
      // aviso previo antes de eliminar todos los usuarios
      Swal.fire({
        title: 'Esta seguro?',
        text: "Esta por eliminar datos del padron. A continuación se le solicitará su password y luego deberá seleccionar la institución a eliminar!!!",
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

    async function eliminar() {
      var userPass = $("#userPass").val();
      // solicita password para eliminar
      const {
        value: checkPassword
      } = await Swal.fire({
        title: 'Entre su Password',
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

    document.getElementById('formModalBorrar').addEventListener('submit', function(e) {
      e.preventDefault();
      //     var datos = new FormData(formularioEliminar);
      $('#formModalBorrar').modal('hide');
      opcion = 5;
      var cuit = $("#borrarCuit").val();

      if (cuit === '') {
        Swal.fire({
          icon: 'error',
          title: 'Ups..!',
          text: 'Debe seleccionar una opción a ejecutar!',
        });
      } else {
        fetch(
            `api/padron.php?opcion=${opcion}&cuit=${cuit}`, {
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
                text: 'Patinadores eliminados!',
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

    // === CARGA DE DATOS VIA EXCEL ===
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

    function pasarCuit() {
      //Verifica que se selecciono un archivo y un club
      var cuit = $("#modificarCuit").val();
      let archivo = document.getElementById('txt_archivo').value;
      if (archivo.length == 0) {
        return Swal.fire("Advertencia", "Seleccione un Archivo", "warning");
      } else if (cuit == '') {
        return Swal.fire("Advertencia", "Seleccione una Institución", "warning");
      } else {
        $("#contenedor").load("variables_selects.php", {
          valorCuit: cuit
        });
        $('#modalLoading').modal('show');
        Cargar_Excel();
      }
    }

    //Carga los datos del EXCEL a la BD
    function Cargar_Excel() {
      $('#modalLoading').modal('show');
      let formData = new FormData();
      let excel = $("#txt_archivo")[0].files[0];
      formData.append('excel', excel);

      fetch(
          'api/carga_excel_padron.php', {
            method: 'POST',
            body: formData,
            headers: {
              Accept: "application/json",
            },
          },
        )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          $('#modalLoading').modal('hide');
          $('#formAlta').modal('hide');
          if (datos == 1) {
            Swal.fire({
              icon: 'success',
              title: 'Ok!',
              text: 'Proceso finalizado',
            }).then((result) => {
              window.location.reload();
            });
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Ups..!',
              text: datos,
            })
          };
        });
    }
    // === FIN CARGA DE DATOS VIA EXCEL ===

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

    // === Actualiza la tabal "estadopadron" en ABIERTO O CERRADO===
    var formularioPadron = document.getElementById("modalPadron");

    document
      .getElementById("modalPadron")
      .addEventListener("submit", function(e) {
        e.preventDefault();
        var datos = new FormData(formularioPadron);
        // envian los datos a modificar en la base de datos
        fetch('api/estado_padron.php', {
            method: "POST",
            body: datos,
            headers: {
              Accept: "application/json",
            },
          })
          .then((respuesta) => respuesta.json())
          .then((datos) => {
            $("#modalPadron").modal("hide");
            if (datos == 1) {
              Swal.fire({
                icon: "success",
                title: "Ok!",
                text: "Datos actualizados!",
              }).then((result) => {
                window.location.reload();
              });
            } else {
              Swal.fire({
                icon: "error",
                title: "Ups..!",
                text: "Las modificaiones NO pudieron registrarse!",
              });
            }
          });
      });
    // === FIN Actualiza la tabal "estadopadron" ===


    // === CONSULTA VALOR DE LA LICENCIA ===
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
    // === FIN CONSULTA VALOR DE LA LICENCIA ===


    // === VALIDA QUE EL AÑO INGRESADO EN LA FECHA DE NACIMIENTO SOLO SEA DE 4 DIGITOS ===
    document.getElementById("altaFechaNacimeinto").addEventListener("input", function(event) {
      // Obtener el valor actual del campo de fecha
      var fechaInput = event.target;
      var fechaIngresada = fechaInput.value;

      // Verificar y limitar la longitud del año a 4 dígitos
      var partesFecha = fechaIngresada.split('-');
      if (partesFecha.length === 3 && partesFecha[0].length > 4) {
        // Truncar el año a 4 dígitos
        partesFecha[0] = partesFecha[0].slice(0, 4);
        // Actualizar el valor del campo de fecha
        fechaInput.value = partesFecha.join('-');
      }
    });
    // === VALIDA QUE EL AÑO INGRESADO ===

    // === GENERAR PADRON PROVISORIO === 
    function generarPrePadron() {
      // PHP code here...

      // Wrap the asynchronous code in an async function
      async function showSwal() {
        var userPass = <?php echo $user['password'] ?>;

        const {
          value: checkPassword
        } = await Swal.fire({
          icon: "warning",
          title: 'Atención!',
          text: "Esta por generar el Padron Provisorio. Si confirma, los datos del PADRON se moverán al PADRON PROVISORIO y se eliminarán los datos pre-existentes del Padron Provisorio. ACEPTAR para confirmar o CANCELAR para salir",
          input: 'password',
          inputLabel: 'Ingrese su Password de Usuario para confirmar el proceso',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Aceptar',
          cancelButtonText: 'Cancelar',
          inputPlaceholder: 'Entre su password de usuario',
          inputAttributes: {
            maxlength: 50,
            autocapitalize: 'off',
            autocorrect: 'off'
          }
        });

        if (checkPassword == userPass) {
          confirmarPrePadron()
        } else {
          Swal.fire({
            icon: 'info',
            title: 'Info..!',
            text: 'La password es incorrecta!',
          });
        }
      }
      // Call the async function
      showSwal();
    }

    function confirmarPrePadron() {
      $('#modalLoading').modal('show');
      opcion = 6;
      fetch(
          `api/padron.php?opcion=${opcion}`, {
            method: 'GET',
            headers: {
              Accept: "application/json",
              "Content-Type": "application/json",
            },
          },
        )
        .then((respuesta) => respuesta.json())
        .then((datos) => {
          setTimeout(function() {
            $('#modalLoading').modal('hide');

            if (datos == 1) {
              $('#modalLoading').modal('hide');
              Swal.fire({
                icon: "success",
                title: "Ok!",
                text: "Generación de PADRON PROVISORIO exitoso!!",
              }).then((result) => {
                window.location.reload();
                // refresh();
              });
            } else {
              $('#modalLoading').modal('hide');
              Swal.fire({
                icon: "error",
                title: "Ups..!",
                text: datos,
              });
            }

          }, 1000);
        });
    }
    // === FIN CONFIRMAR EMPADRONAMIENTO === 

    function refresh() {
      table.ajax.reload(null, false);
    }
  </script>
</body>

</html>