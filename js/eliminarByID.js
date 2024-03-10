var urlDeleteID = "";
function eliminarCliente(id, id_combinada) {
  opcion = 1;
  // console.log(id);
  // console.log(tabla);
  // selecciona URL según tabla ===
  switch (tabla) {
    case "afiliacionclub":
      urlDeleteID = `../../api/afiliacionclub.php?id=${id}&opcion=${opcion}`;
      break;
    case "categoria":
      urlDeleteID = `../../api/categorias.php?id=${id}&opcion=${opcion}`;
      break;
    case "disciplina":
      urlDeleteID = `../../api/disciplinas.php?id=${id}&opcion=${opcion}`;
      break;
    case "divisional":
      urlDeleteID = `../../api/divisional.php?id=${id}&opcion=${opcion}`;
      break;
    case "eficiencia":
      urlDeleteID = `../../api/eficiencia.php?id=${id}&opcion=${opcion}`;
      break;
    case "licencias":
      urlDeleteID = `../../api/licencias.php?id=${id}&opcion=${opcion}`;
      break;
    case "torneos":
      urlDeleteID = `../../api/torneos.php?id=${id}&opcion=${opcion}`;
      break;
    case "tecnicos":
      urlDeleteID = `../../api/tecnicos.php?id=${id}&opcion=${opcion}`;
      break;
    case "institucion":
      urlDeleteID = `../../api/clubs.php?id=${id}&opcion=${opcion}`;
      break;
    case "usuarios":
      urlDeleteID = `../../api/users.php?id=${id}&opcion=${opcion}`;
      break;
    case "padron":
      urlDeleteID = `../../api/padron.php?id=${id}&opcion=${opcion}`;
      break;
    case "gestionBuenaFe":
      urlDeleteID = `../../api/buenafe.php?id=${id}&opcion=${opcion}`;
      break;
    case "podios":
      urlDeleteID = `../../api/podios.php?id=${id}&opcion=${opcion}`;
      break;
    case "ctacte":
      urlDeleteID = `../../api/ctacte.php?id=${id}&opcion=${opcion}`;
      break;
    case "delegados":
      urlDeleteID = `../../api/delegados.php?id=${id}&opcion=${opcion}`;
      break;
    case "pre_padron":
      urlDeleteID = `../../api/pre_padron.php?id=${id}&opcion=${opcion}`;
      break;
    case "pre_gestionBuenaFe":
      urlDeleteID = `../../api/pre_buenafe.php?id=${id}&opcion=${opcion}`;
      break;
    case "tabla_relaciones":
      urlDeleteID = `../../api/relaciones.php?id=${id}&opcion=${opcion}`;
      break;
    case "combinada":
      urlDeleteID = `../../api/combinada.php?id=${id}&opcion=${opcion}`;
      break;
  }

  // toma los datos del usuario
  fetch(urlDeleteID, {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  })
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      // console.log(datos);
      // Selecciona la variable del nombre segun tabla ===
      switch (tabla) {
        case "afiliacionclub":
          nombre = datos[0].tipoafiliacion;
          break;
        case "categoria":
          nombre = datos[0].categoria;
          break;
        case "disciplina":
          nombre = datos[0].disciplina;
          break;
        case "divisional":
          nombre = datos[0].divisional;
          break;
        case "eficiencia":
          nombre = datos[0].eficiencia;
          break;
        case "licencias":
          nombre = datos[0].tipolicencia;
          break;
        case "torneos":
          nombre = datos[0].nombretorneo;
          break;
        case "tecnicos":
          nombreUsuario = datos[0].nombretecnico;
          apellidoUsuario = datos[0].apellidotecnico;
          nombre = nombreUsuario + " " + apellidoUsuario;
          break;
        case "institucion":
          nombre = datos[0].institucion;
          break;
        case "usuarios":
          nombreUsuario = datos[0].nombre;
          apellidoUsuario = datos[0].apellido;
          nombre = nombreUsuario + " " + apellidoUsuario;
          break;
        case "padron":
          nombreUsuario = datos[0].nombrepatinador;
          apellidoUsuario = datos[0].apellidopatinador;
          nombre = nombreUsuario + " " + apellidoUsuario;
          break;
        case "gestionBuenaFe":
          nombreUsuario = datos[0].nombrepatinador;
          apellidoUsuario = datos[0].apellidopatinador;
          nombre = nombreUsuario + " " + apellidoUsuario;
          break;
        case "podios":
          nombreUsuario = datos[0].nombrepatinador;
          apellidoUsuario = datos[0].apellidopatinador;
          nombre = nombreUsuario + " " + apellidoUsuario;
          break;
        case "ctacte":
          id = datos[0].id;
          tipo_comp = datos[0].tipo_comprobante;
          concepto = datos[0].concepto;
          nombre = tipo_comp + " " + id + " " + concepto;
          break;
        case "delegados":
          nombreUsuario = datos[0].nombre;
          apellidoUsuario = datos[0].apellido;
          nombre = nombreUsuario + " " + apellidoUsuario;
          break;
        case "pre_padron":
          nombreUsuario = datos[0].nombrepatinador;
          apellidoUsuario = datos[0].apellidopatinador;
          nombre = nombreUsuario + " " + apellidoUsuario;
          break;
        case "pre_gestionBuenaFe":
          nombreUsuario = datos[0].nombrepatinador;
          apellidoUsuario = datos[0].apellidopatinador;
          nombre = nombreUsuario + " " + apellidoUsuario;
          break;
        case "tabla_relaciones":
          nombreUsuario = datos[0].id;
          nombre = "ID " + nombreUsuario;
          break;
        case "combinada":
          nombreUsuario = datos[0].disciplina;
          programa1 = datos[0].programa1;
          programa2 = datos[0].programa2;
          nombre = nombreUsuario + " " + programa1 + " / " + programa2;
          break;
      }
      // Fin seleccion variable nombre
      // pide confirmación para eliminar
      Swal.fire({
        title: "Esta seguro?",
        text: "Aceptar para borrar: " + nombre,
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Aceptar",
        cancelButtonText: "Cancelar",
      }).then((result) => {
        // elimina el usuario
        if (result.isConfirmed) {
          opcion = 3;
          // console.log(opcion);
          // console.log(id);
          // selecciona URL según tabla ===
          switch (tabla) {
            case "afiliacionclub":
              urlDeleteID = `../../api/afiliacionclub.php?id=${id}&opcion=${opcion}`;
              break;
            case "categoria":
              urlDeleteID = `../../api/categorias.php?id=${id}&opcion=${opcion}`;
              break;
            case "disciplina":
              urlDeleteID = `../../api/disciplinas.php?id=${id}&opcion=${opcion}`;
              break;
            case "divisional":
              urlDeleteID = `../../api/divisional.php?id=${id}&opcion=${opcion}`;
              break;
            case "eficiencia":
              urlDeleteID = `../../api/eficiencia.php?id=${id}&opcion=${opcion}`;
              break;
            case "licencias":
              urlDeleteID = `../../api/licencias.php?id=${id}&opcion=${opcion}`;
              break;
            case "torneos":
              urlDeleteID = `../../api/torneos.php?id=${id}&opcion=${opcion}`;
              break;
            case "tecnicos":
              urlDeleteID = `a../../pi/tecnicos.php?id=${id}&opcion=${opcion}`;
              break;
            case "institucion":
              urlDeleteID = `../../api/clubs.php?id=${id}&opcion=${opcion}`;
              break;
            case "usuarios":
              urlDeleteID = `../../api/users.php?id=${id}&opcion=${opcion}`;
              break;
            case "padron":
              urlDeleteID = `../../api/padron.php?id=${id}&opcion=${opcion}`;
              break;
            case "gestionBuenaFe":
              if (id_combinada === null || id_combinada === "") {
                urlDeleteID = `../../api/buenafe.php?id=${id}&opcion=${opcion}`;
              } else {
                urlDeleteID = `../../api/buenafe.php?id_combinada=${id_combinada}&opcion=${opcion}`;
              }
              console.log(urlDeleteID);
              // urlDeleteID = `api/buenafe.php?id=${id}&opcion=${opcion}`;
              break;
            case "podios":
              urlDeleteID = `../../api/podios.php?id=${id}&opcion=${opcion}`;
              break;
            case "delegados":
              urlDeleteID = `../../api/delegados.php?id=${id}&opcion=${opcion}`;
              break;
            case "pre_padron":
              urlDeleteID = `../../api/pre_padron.php?id=${id}&opcion=${opcion}`;
              break;
            case "pre_gestionBuenaFe":
              urlDeleteID = `../../api/pre_buenafe.php?id=${id}&opcion=${opcion}`;
              break;
            case "tabla_relaciones":
              urlDeleteID = `../../api/relaciones.php?id=${id}&opcion=${opcion}`;
              break;
            case "combinada":
              urlDeleteID = `../../api/combinada.php?id=${id}&opcion=${opcion}`;
              break;
          }
          // FIN seleccion URL
          // Borra el dato by ID
          // console.log(urlDeleteID);
          fetch(urlDeleteID, {
            method: "GET",
            headers: {
              Accept: "application/json",
              "Content-Type": "application/json",
            },
          })
            .then((respuesta) => respuesta.json())
            .then((datos) => {
              $("#formAlta").modal("hide");
              if (datos == 1) {
                Swal.fire({
                  icon: "success",
                  title: "Ok!",
                  text: "Eliminación con exito!",
                }).then((result) => {
                  // window.location.reload();
                  refresh();
                });
              }
            })
            .catch((error) => {
              $("#formAlta").modal("hide");
              console.error("Error en la solicitud:", error);
              Swal.fire({
                icon: "error",
                title: "Error",
                text: "Hubo un error SQL al intentar eliminar. Por favor, inténtalo de nuevo.",
              });
            });
        }
      });
    });
}
// === FIN ELIMINAR USUARIO ===
