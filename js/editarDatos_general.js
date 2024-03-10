// === GRABA LOS CAMBIOS en la BD by ID ===
var formulario = document.getElementById("modalConsulta");

document
  .getElementById("modalConsulta")
  .addEventListener("submit", function (e) {
    e.preventDefault();
    var datos = new FormData(formulario);
    // envian los datos a modificar en la base de datos
    fetch(urlEdit, {
      method: "POST",
      body: datos,
      headers: {
        Accept: "application/json",
      },
    })
      .then((respuesta) => respuesta.json())
      .then((datos) => {
        $("#modalConsulta").modal("hide");
        if (datos == 1) {
          Swal.fire({
            icon: "success",
            title: "Ok!",
            text: "Datos actualizados!",
          }).then((result) => {
            // window.location.reload();
            refresh();
          });
        } else {
          if (datos == 0) {
            Swal.fire({
              icon: "error",
              title: "Ups..!",
              text: "Las modificaiones NO pudieron registrarse!",
            });
          } else {
            Swal.fire({
              icon: "error",
              title: "Ups..!",
              text: datos,
            });
          }
        }
      })
      .catch((error) => {
        $("#modalConsulta").modal("hide");
        console.error("Error en la solicitud:", error);
        Swal.fire({
          icon: "error",
          title: "Error",
          text: "Hubo un error SQL al intentar editar los datos!. Por favor, inténtalo de nuevo.",
        });
      });
  });
// === FIN ACTUALIZAR DATOS by ID ===
