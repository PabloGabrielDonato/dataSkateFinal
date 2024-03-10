<header class="navbar pcoded-header navbar-expand-lg navbar-light header-dark">
    <div class="m-header">
        <a class="mobile-menu" id="mobile-collapse" href="#"><span></span></a>
        <a href="#" class="b-brand">
            <!-- ========   change your logo hear   ============ -->
            <!-- <img src="assets/logoDataSkt.png" alt="" class="logo" style="width: 22%;" /> -->
            <img src="../../assets/rio_logo.png" alt="logoDonatware1" class="logo" style="width: 22%;" />
            <h1 class="logo">RIO</h1>
        </a>
        <a href="#" class="mob-toggler">
            <i class="feather icon-more-vertical"></i>
        </a>
    </div>
    <div class="collapse navbar-collapse text-center">
        <img src="../../assets/dataSkate_gris.png" style="width: 20%;" class="mx-auto">
        <ul class="navbar-nav ml-auto">
            <!-- verifica si es administrador para mostrar el aviso -->
            <?php if ($user['acceso'] == 'administrador') { ?>
                <li>
                    <!-- verifica que hay prerecibos cargados para mostrar aviso -->
                    <?php if ($cantidaRecibos != '0') {  ?>
                        <div id="avisoPreRecibos">
                            <a href="#" onclick="verMensaje()">
                                <i class="icon feather icon-bell" style="font-size: 20px; top: 15px;"></i>
                                <span class="badge badge-pill badge-danger" style="position: relative; top: -12px; right: 10px; font-size: 12px;" id="cantidaPreRecibos"><?php echo $cantidaRecibos ?></span>
                            </a>
                        </div>
                    <?php } ?>
                </li>
            <?php } ?>
            <!-- FIN verifica si es administrador para mostrar el aviso -->
            <li>
                <div class="dropdown drp-user">
                    <span><?php echo $user['dni'] . " / " . $user['nombre'] . " " . $user['apellido'] . " / " . $user['institucion'] . " / " . $user['acceso']; ?></span>
                </div>
            </li>
        </ul>
    </div>
</header>

<script>
    function verMensaje() {
        const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 1500,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.onmouseenter = Swal.stopTimer;
                toast.onmouseleave = Swal.resumeTimer;
            }
        });
        Toast.fire({
            icon: "info",
            title: "Hay COBROS pendientes de aprobar!!"
        });
    }
</script>