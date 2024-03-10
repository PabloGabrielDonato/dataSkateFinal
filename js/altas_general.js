// === ALTA de USUARIO ===
function altaNuevo() {
  $("#formAlta").trigger("reset");
  $(".form-control").prop("disabled", false);
  $(".form-select").prop("disabled", false);
  $("#botonAceptar").show();
  $("#formAlta").modal("show");
}
var formularioAlta = document.getElementById("formAlta");
document.getElementById("formAlta").addEventListener("submit", function (e) {
  e.preventDefault();
  var datos = new FormData(formularioAlta);
  // envia los datos a crear en la base de datos
  fetch(urlAlta, {
    method: "POST",
    body: datos,
    headers: {
      Accept: "application/json",
    },
  })
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      $("#formAlta").modal("hide");
      if (datos == 1) {
        Swal.fire({
          icon: "success",
          title: "Ok!",
          text: "Dato ingresados con exito!",
        }).then((result) => {
          // window.location.reload();
          refresh();
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
      $("#formAlta").modal("hide");
      console.error("Error en la solicitud:", error);
      Swal.fire({
        icon: "error",
        title: "Error",
        text: "Hubo un error SQL al intentar dar el alta. Por favor, inténtalo de nuevo.",
      });
    });
});
// === FIN Alta USUARIO ===
