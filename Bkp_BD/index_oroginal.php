<?php
session_start();

require '../database.php';

// Toma los datos del usuario para mostrar en el encabezado de la pagina
if (isset($_SESSION['user_id'])) {
	$records = $conn->prepare('SELECT users.*, clubs.institucion, clubs.cuit FROM users, clubs WHERE users.cuit = clubs.cuit AND users.id= :id');
	$records->bindParam(':id', $_SESSION['user_id']);
	$records->execute();
	$results = $records->fetch(PDO::FETCH_ASSOC);

	$user = null;

	if (count($results) > 0) {
		$user = $results;
	}
}

// verifica si el usuario esta logeado
if (!isset($user)) {
	header("Location: /newproyect_lepa/index.php");
}

// Verifica que el accso sea de ADMINISTRADORES
if ($user['acceso'] != 'administrador') {
	$valorAcceso = 0;
	$mensajeAcceso = 'No tiene acceso a esta sección';
	$_SESSION['valorAcceso'] = $valorAcceso;
	$_SESSION['mensajeAcceso'] = $mensajeAcceso;
	header("Location: /newproyect_lepa/users_home.php");
} ?>


<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Script php backup and restore Mysqli</title>
</head>

<body>
	<a href="./Backup.php">Realizar copia de seguridad</a>
	<form action="./Restore.php" method="POST">
		<label>Selecciona un punto de restauración</label><br>
		<select name="restorePoint">
			<option value="" disabled="" selected="">Selecciona un punto de restauración</option>
			<?php
			include_once './Connet.php';
			$ruta = BACKUP_PATH;
			if (is_dir($ruta)) {
				if ($aux = opendir($ruta)) {
					while (($archivo = readdir($aux)) !== false) {
						if ($archivo != "." && $archivo != "..") {
							$nombrearchivo = str_replace(".sql", "", $archivo);
							$nombrearchivo = str_replace("-", ":", $nombrearchivo);
							$ruta_completa = $ruta . $archivo;
							if (is_dir($ruta_completa)) {
							} else {
								echo '<option value="' . $ruta_completa . '">' . $nombrearchivo . '</option>';
							}
						}
					}
					closedir($aux);
				}
			} else {
				echo $ruta . " No es ruta válida";
			}
			?>
		</select>
		<button type="submit">Restaurar</button>
	</form>
</body>

</html>