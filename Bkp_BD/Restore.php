<?php
include './Connet.php';
$restorePoint = SGBD::limpiarCadena($_POST['restorePoint']);
$sql = explode(";", file_get_contents($restorePoint));
$totalErrors = 0;
set_time_limit(60);
$con = mysqli_connect(SERVER, USER, PASS, BD);
$con->query("SET FOREIGN_KEY_CHECKS=0");
for ($i = 0; $i < (count($sql) - 1); $i++) {
	if ($con->query($sql[$i] . ";")) {
	} else {
		$totalErrors++;
	}
}
$con->query("SET FOREIGN_KEY_CHECKS=1");
$con->close();
if ($totalErrors <= 0) {
	$mensaje = 1;
} else {
	$mensaje = 0;
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<title>Document</title>
</head>

<body>

	<?php if ($mensaje == 1) {; ?>
		<script>
			Swal.fire({
				title: 'Restaurar',
				text: 'Restauración finalizada con exito!',
				icon: 'success',
				confirmButtonColor: '#3085d6',
				confirmButtonText: 'Aceptar'
			}).then((result) => {
				window.location.href = '../Bkp_BD/index.php';
			})
		</script>
	<?php } ?>

	<?php if ($mensaje != 1) {; ?>
		<script>
			Swal.fire({
				title: 'Restaurar',
				text: 'Ocurrio un error inesperado, no se pudo hacer la restauración completamente',
				icon: 'error',
				confirmButtonColor: '#3085d6',
				confirmButtonText: 'Aceptar'
			}).then((result) => {
				window.location.href = '../Bkp_BD/index.php';
			})
		</script>
	<?php } ?>

</body>

</html>