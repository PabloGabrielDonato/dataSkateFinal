<style>
    .pcoded-navbar .pcoded-inner-navbar li.active>a,
    .pcoded-navbar .pcoded-inner-navbar li:focus>a,
    .pcoded-navbar .pcoded-inner-navbar li:hover>a {
        color: #00BFFF;
    }

    .pcoded-navbar .pcoded-inner-navbar li.pcoded-menu-caption {
        color: #00BFFF;
    }

    .fa-lock-alt {
        margin-right: 3%;
    }
</style>
<nav class="pcoded-navbar pcoded-navbar-home">
    <div class="navbar-wrapper">
        <div class="navbar-content scroll-div">
            <div class="">
                <div class="main-menu-header">
                    <i class="feather icon-user"></i>
                    <!-- <img class="img-radius" src="assets/images/user/avatar-2.jpg" alt="User-Profile-Image" /> -->
                    <div class="user-details">
                        <span><?php echo  $user['nombre'] . " " . $user['apellido']; ?></span>
                        <div id="more-details">
                            <i class="fa fa-chevron-down m-l-5"></i>
                        </div>
                    </div>
                </div>
                <div class="collapse" id="nav-user-link">
                    <ul class="list-unstyled">
                        <li class="list-group-item">
                            <a href="#!" onclick="verModal()"><i class="fal fa-lock-alt"></i> Password</a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" data-toggle="modal" data-target="#logoutModal" onclick="logoutModal()">
                                <i class="feather icon-log-out m-r-5"></i>
                                Logout
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" data-bs-toggle="modal" data-bs-target="#acercaDe" onclick="acercaDe()">
                                <i class="fas fa-info m-r-5"></i>
                                Acerca de
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <ul class="nav pcoded-inner-navbar">

                <!-- MENU LEPAA -->
                <li class="nav-item pcoded-menu-caption">
                    <label>MENU</label>
                </li>

                <!-- Acceso al menu para Administradores -->
                <?php if ($user['acceso'] == 'administrador') : ?>
                    <li class="nav-item pcoded-hasmenu">
                        <a href="#!" class="nav-link">
                            <span class="pcoded-micon"><i class="feather icon-box"></i></span>
                            <span class="pcoded-mtext">RIO</span>
                        </a>
                        <ul class="pcoded-submenu">
                            <!-- Gestion -->
                            <li class="nav-item pcoded-hasmenu">
                                <a href="#!" class="nav-link">
                                    <span class="pcoded-micon"><i class="fab fa-uncharted"></i></span>
                                    <span class="pcoded-mtext">GESTION</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li><a href="institucion.php">Clubs</a></li>
                                    <li><a href="padron.php">Padron</a></li>
                                    <li><a href="prepadron.php">Padron Provisorio</a></li>
                                    <li><a href="tecnicos.php">Tecnicos</a></li>
                                    <li><a href="delegados.php">Delegados</a></li>
                                    <li><a href="usuarios.php">Usuarios</a></li>
                                </ul>
                            </li>
                            <!-- Buena Fe -->
                            <li class="nav-item pcoded-hasmenu">
                                <a href="#!" class="nav-link">
                                    <span class="pcoded-micon"><i class="fab fa-uncharted"></i></span>
                                    <span class="pcoded-mtext">BUENA FE</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li><a href="gestion_buenafe.php">Inscripciones</a></li>
                                    <li><a href="pregestion_buenafe.php">Inscripciones Provisorias</a></li>
                                    <li><a href="lista_buenafe.php">Lista Buena Fe</a></li>
                                    <li><a href="libro_torneo.php">Libro Torneo</a></li>
                                    <li><a href="cronograma_torneo.php">Cronograma Torneo</a></li>
                                    <li><a href="archivo_buenafe.php">Archivo Inscripciones</a></li>
                                    <li><a href="archivo_libro_torneo.php">Archivo Libro Torneo</a></li>
                                </ul>
                            </li>
                            <!-- Podios -->
                            <li class="nav-item pcoded-hasmenu">
                                <a href="#!" class="nav-link">
                                    <span class="pcoded-micon"><i class="fab fa-uncharted"></i></span>
                                    <span class="pcoded-mtext">PODIOS</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li><a href="podio_anual.php">Podios Anuales</a></li>
                                </ul>
                            </li>
                            <!-- Tablas -->
                            <li class="nav-item pcoded-hasmenu">
                                <a href="#!" class="nav-link">
                                    <span class="pcoded-micon"><i class="fab fa-uncharted"></i></span>
                                    <span class="pcoded-mtext">TABLAS</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li><a href="tabla_afiliacionclub.php">Afiliación Club</a></li>
                                    <li><a href="tabla_divisional.php">Divisional</a></li>
                                    <li><a href="tabla_disciplina.php">Disciplinas</a></li>
                                    <li><a href="tabla_eficiencia.php">Eficiencias</a></li>
                                    <li><a href="tabla_categoria.php">Categorias</a></li>
                                    <li><a href="tabla_combinada.php">Combinadas</a></li>
                                    <li><a href="tabla_licencias.php">Licencias</a></li>
                                    <li><a href="tabla_relaciones.php">Relaciones</a></li>
                                    <li><a href="tabla_torneos.php">Torneos</a></li>
                                </ul>
                            </li>
                            <!-- Registros -->
                            <li class="nav-item pcoded-hasmenu">
                                <a href="#!" class="nav-link">
                                    <span class="pcoded-micon"><i class="fab fa-uncharted"></i></span>
                                    <span class="pcoded-mtext">REGISTROS</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li><a href="registros_eliminados.php">Eliminados</a></li>
                                    <li><a href="registros_ingresos.php">Ingresos</a></li>
                                    <li><a href="registros_modificados.php">Modificados</a></li>
                                </ul>
                            </li>
                            <!-- Fianzas -->
                            <li class="nav-item pcoded-hasmenu">
                                <a href="#!" class="nav-link">
                                    <span class="pcoded-micon"><i class="fab fa-uncharted"></i></span>
                                    <span class="pcoded-mtext">FINANZAS</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li><a href="ctacte.php">CtaCte</a></li>
                                    <li><a href="prerecibos.php">Cobros Pendientes</a></li>
                                </ul>
                            </li>
                            <!-- Graficos -->
                            <li class="nav-item">
                                <a href="graficas.php" class="nav-link">
                                    <span class="pcoded-micon"><i class="feather icon-box"></i></span>
                                    <span class="pcoded-mtext">GRAFICOS</span>
                                </a>
                            </li>
                            <!-- Backup -->
                            <li class="nav-item pcoded-hasmenu">
                                <a href="#!" class="nav-link">
                                    <span class="pcoded-micon"><i class="fab fa-uncharted"></i></span>
                                    <span class="pcoded-mtext">BACKUP</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li><a href="Bkp_BD/index.php">Backup/Restore</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="pcoded-submenu">
                            <li><a href="ManualAdministrador.pdf" target="_blank">Ayuda</a></li>
                        </ul>
                    </li>
                <?php endif; ?>

                <!-- Acceso al menu para Usuarios -->
                <?php if ($user['acceso'] != 'administrador') : ?>
                    <li class="nav-item pcoded-hasmenu">
                        <a href="#!" class="nav-link">
                            <span class="pcoded-micon"><i class="feather icon-box"></i></span>
                            <span class="pcoded-mtext">USUARIOS</span>
                        </a>
                        <ul class="pcoded-submenu">
                            <li><a href="users_padron.php">Padron</a></li>
                            <?PHP if ($estado['estado'] == 'ABIERTO') : ?>
                                <li><a href="users_prepadron.php">Padron Provisorio</a></li>
                            <?PHP endif; ?>
                            <li><a href="users_gestion_buenafe.php">Inscripciones</a></li>
                            <li><a href="users_pregestion_buenafe.php">Inscripciones Provisorias</a></li>
                            <li><a href="users_lista_buenafe.php">Lista Buena Fe</a></li>
                            <li><a href="users_prerecibos.php">Informar Pagos</a></li>
                            <li><a href="users_ctacte_detalle.php">Cuenta Corriente</a></li>
                            <li><a href="ManualUsuario.pdf" target="_blank">Ayuda</a></li>
                            <!-- <li><a href="users_libro_torneo.php">Libro Torneo</a></li> -->
                        </ul>
                    </li>
                    <li class="nav-item pcoded-hasmenu">
                        <a href="#!" class="nav-link">
                            <span class="pcoded-micon"><i class="feather icon-box"></i></span>
                            <span class="pcoded-mtext">REGLAMENTOS</span>
                        </a>
                        <ul class="pcoded-submenu">
                            <li><a href="reglamentos/ReglamentoGeneralCAP2024.pdf" target="_blank">Reg General</a></li>
                            <li><a href="reglamentos/ReglamentoCAPLibre2024.pdf" target="_blank">Reg Libre</a></li>
                            <li><a href="reglamentos/ReglamentoCAPFiguras2024.pdf" target="_blank">Reg Figuras</a></li>
                            <li><a href="reglamentos/ReglamentoCAPDanza2024.pdf" target="_blank">Reg Danza</a></li>
                            <li><a href="reglamentos/ReglamentoCAPShow2024.pdf" target="_blank">Reg Show</a></li>
                            <li><a href="reglamentos/ReglamentoCAPPrecision2024.pdf" target="_blank">Reg Precisión</a></li>
                            <li><a href="reglamentos/ReglamentoCAPParejasMixtas2024.pdf" target="_blank">Reg Parejas Mixtas</a></li>
                            <li><a href="reglamentos/ReglamentoCAPCuartetos2024.pdf" target="_blank">Reg Cuartetos</a></li>
                            <li><a href="reglamentos/ReglamentoCAPPatínAdaptado2024.pdf" target="_blank">Reg Adaptado</a></li>
                        </ul>
                    </li>
                <?php endif; ?>
            </ul>

            <div>
                <a href="#" onclick="consultas()"><img class="ml-2" src="assets/whatsapp.png" alt="" style="width: 35px;"> Consultas</a>
            </div>

        </div>
    </div>
</nav>

<!-- Modal CAMBIAR PASSWORD-->
<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cambiar Password</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="cerrarModal()"></button>
            </div>
            <form id="cambiarPass">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input name="newPassword" type="password" class="form-control" id="newPassword" onkeypress="validarInput(event)" placeholder="Nueva Password">
                        <label for="floatingPassword">Nueva Password</label>
                    </div>
                    <div class="form-floating">
                        <input name="confirmPassword" type="password" class="form-control" id="confirmPassword" onkeypress="validarInput(event)" placeholder="Confirmar Password">
                        <label for="floatingPassword">Confirmar Password</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="cerrarModal()">Cerrar</button>
                    <!-- <button type="button" class="btn btn-primary" onclick="cambiarPass()">Save changes</button> -->
                    <button type="submit" class="btn btn-primary">Aceptar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Fin Modal CAMBIAR PASSWORD-->


<!-- Modal Autor -->
<div class="modal fade" id="acercaDe" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Información de versión</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="cerrarAcercaDe()"></button>
            </div>
            <div class="modal-body text-center">
                <img src="assets/dataSkate1.png" class="mx-auto">
                <ul class="list-unstyled text-left">
                    <li>Version: 3.3</li>
                    <li>Autor: DONATWARE</li>
                    <li><b>Todos los derechos reservados (c)</b></li>
                </ul>
                <img src="assets/LogoDonatware1.png" class="mx-auto" style="width: 20%;">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="cerrarAcercaDe()">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN Modal Autor -->

<!-- Modal consultas -->
<div class="modal fade" id="consultas" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalCenterTitle">Estamos para ayudarte!!</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" onclick="cerrarConsultas()">×</span></button>
            </div>
            <div class="modal-body">
                <p class="mb-0">Te acompañamos en el proceso de aprendizaje. Por cualquier duda o consulta, no dudes en ponerte en contacto con nosotros.</p><br>
                <p>Envianos un mensaje Whatsapp al:</p>
                <div>
                    <h4 style="text-align: center;">11 5780 2729</h4>
                </div>
                <p style="text-align: center;">Indicando su <b>NOMBRE</b>, <b>INSTITUCION</b> y su <b>CONSULTA</b>.</p>
                <p style="text-align: center;">** Este servicio estará disponible hasta <b>Julio 2024</b> **</p>
                <p>Correo de consultas: <span style=" font-size: 20px;"><b>donatware@outlook.com</b></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  btn-secondary" data-dismiss="modal" onclick="cerrarConsultas()">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- FIN Modal consultas -->

<script>
    // === Mustra los Modales ===
    function verModal() {
        $('#passwordModal').modal('show');
    }

    function acercaDe() {
        $('#acercaDe').modal('show');
    }

    function consultas() {
        $('#consultas').modal('show');
    }
    // === FIN Mustra los Modales ===

    // === CAMBIO DE PASSWORD ===
    document.getElementById('cambiarPass').addEventListener('submit', function(e) {
        e.preventDefault();
        // var datos = new FormData(formulario);
        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();
        if (newPassword === confirmPassword) {
            // `http://localhost/newproyect_lepa/api/cambiar_password.php?newPassword=${newPassword}`
            fetch(
                    `api/cambiar_password.php?newPassword=${newPassword}`, {
                        method: 'GET',
                        headers: {
                            Accept: "application/json",
                            "Content-Type": "application/json",
                        },
                    },
                )
                .then((respuesta) => respuesta.json())
                .then((datos) => {
                    $('#passwordModal').modal('hide');
                    if (datos == 1) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Ok!',
                            text: 'Nueva password registrada con exito!',
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
        } else {
            $('#passwordModal').modal('hide');
            Swal.fire({
                icon: 'error',
                title: 'Ups..!',
                text: 'Las contraseñas no coinciden!',
            })
        };
    });

    // NO PERMITE INGRSAR CARACTERES ESPECIALES EN LA PASSWORD
    function validarInput(event) {
        var tecla = event.key;
        // Lista de caracteres permitidos (alfanuméricos y algunos especiales)
        var caracteresPermitidos = /^[a-zA-Z0-9]*$/;
        // Verificar si la tecla presionada está permitida
        if (!caracteresPermitidos.test(tecla)) {
            event.preventDefault();
        }
    }


    // === Cierra los Modales ===
    function cerrarModal() {
        $('#passwordModal').modal('hide');
    }

    function cerrarAcercaDe() {
        $('#acercaDe').modal('hide');
    }

    function cerrarConsultas() {
        $('#consultas').modal('hide');
    }
</script>