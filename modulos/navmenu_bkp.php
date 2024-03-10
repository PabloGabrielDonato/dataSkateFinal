<style>
    .pcoded-navbar .pcoded-inner-navbar li.active>a,
    .pcoded-navbar .pcoded-inner-navbar li:focus>a,
    .pcoded-navbar .pcoded-inner-navbar li:hover>a {
        color: #00BFFF;
    }

    .pcoded-navbar .pcoded-inner-navbar li.pcoded-menu-caption {
        color: #00BFFF;
    }
</style>
<nav class="pcoded-navbar pcoded-navbar-home">
    <div class="navbar-wrapper">
        <div class="navbar-content scroll-div">
            <ul class="nav pcoded-inner-navbar">

                <!-- MENU LEPAA -->
                <li class="nav-item pcoded-menu-caption">
                    <label>MENU</label>
                </li>

                <?php if ($user['acceso'] == 'administrador') : ?>
                    <li class="nav-item">
                        <a href="../home.php" class="nav-link">
                            <span class="pcoded-micon"><i class="feather icon-box"></i></span>
                            <span class="pcoded-mtext">INICIO</span>
                        </a>
                    </li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</nav>