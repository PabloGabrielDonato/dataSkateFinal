// ELIMINAR -TODOS- LOS USUARIOS
function eliminarTodos() {
  // aviso previo antes de eliminar todos los usuarios
  Swal.fire({
    title: "Esta seguro?",
    text: "Esta por eliminar TODOS los datos de esta sección!!!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Aceptar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      eliminar();
    }
  });
}

async function eliminar() {
  // solicita password para eliminar
  const { value: password } = await Swal.fire({
    title: "Entre su Password",
    input: "password",
    inputLabel: "Ingrese su Password para eliminar TODOS los datos",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Aceptar",
    cancelButtonText: "Cancelar",
    inputPlaceholder: "Entre su password",
    inputAttributes: {
      maxlength: 50,
      autocapitalize: "off",
      autocorrect: "off",
    },
  });
  if (password) {
    // elimina todos los usuario, menos al que ejecuta el proceso
    // Selecciona el URL según la tabla
    opcion = 5;
    switch (tabla) {
      case "afiliacionclub":
        var urlDeleteAll = `api/afiliacionclub.php?password=${password}&opcion=${opcion}`;
        break;
      case "categoria":
        var urlDeleteAll = `api/categorias.php?password=${password}&opcion=${opcion}`;
        break;
      case "disciplina":
        var urlDeleteAll = `api/disciplinas.php?password=${password}&opcion=${opcion}`;
        break;
      case "divisional":
        var urlDeleteAll = `api/divisional.php?password=${password}&opcion=${opcion}`;
        break;
      case "eficiencia":
        var urlDeleteAll = `api/eficiencia.php?password=${password}&opcion=${opcion}`;
        break;
      case "licencias":
        var urlDeleteAll = `api/licencias.php?password=${password}&opcion=${opcion}`;
        break;
      case "torneos":
        var urlDeleteAll = `api/torneos.php?password=${password}&opcion=${opcion}`;
        break;
      case "tecnicos":
        var urlDeleteAll = `api/tecnicos.php?password=${password}&opcion=${opcion}`;
        break;
      case "institucion":
        var urlDeleteAll = `api/clubs.php?password=${password}&opcion=${opcion}`;
        break;
      case "usuarios":
        var urlDeleteAll = `api/users.php?password=${password}&opcion=${opcion}`;
        break;
      case "delegados":
        var urlDeleteAll = `api/delegados.php?password=${password}&opcion=${opcion}`;
        break;
      case "tabla_relaciones":
        var urlDeleteAll = `api/relaciones.php?password=${password}&opcion=${opcion}`;
        break;
      case "combinada":
        var urlDeleteAll = `api/combinada.php?password=${password}&opcion=${opcion}`;
        break;
    }
    // console.log(urlDeleteAll);
    fetch(urlDeleteAll, {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    })
      .then((respuesta) => respuesta.json())
      .then((datos) => {
        if (datos == 1) {
          Swal.fire({
            icon: "success",
            title: "Ok!",
            text: "Todos los datos fueron eliminados!",
          }).then((result) => {
            window.location.reload();
          });
        } else {
          Swal.fire({
            icon: "error",
            title: "Ups..!",
            text: datos,
          });
        }
      })
      .catch((error) => {
        console.error("Error en la solicitud:", error);
        Swal.fire({
          icon: "error",
          title: "Error",
          text: "Hubo un error SQL al intentar eliminar. Por favor, inténtalo de nuevo.",
        });
      });
  } else if (password == "") {
    Swal.fire({
      icon: "info",
      title: "Info..!",
      text: "Debe introducir su password para eliminr TODOS los datos.",
    });
  }
}
// === FIN ELIMINAR TODOS LOS USUARIO ===
