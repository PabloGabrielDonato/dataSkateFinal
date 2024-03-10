// === ALTAS ===
// == seleccionar DISCIPLINA segun DIVISIONAL ==
var divisional = "";
var disciplina = "";
var eficiencia = "";
function buscarDisciplina() {
  divisional = $("#altaDivisional").val();

  opcion = 6;
  //   alert("Divisional: " + divisional);
  fetch(`api/relaciones.php?divisional=${divisional}&opcion=${opcion}`, {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  })
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      llenarSelectDisciplinas(datos);
    });
}

function llenarSelectDisciplinas(datos) {
  var select = document.getElementById("altaDisciplina");
  // console.log(select);
  // Limpiar opciones existentes
  select.innerHTML = "";
  // Agregar opción vacía
  var opcionVacia = document.createElement("option");
  opcionVacia.value = "";
  opcionVacia.text = "Seleccione una Disciplina";
  select.appendChild(opcionVacia);
  // Iterar sobre las opciones y agregarlas al select
  datos.forEach(function (opcion) {
    var option = document.createElement("option");
    option.value = opcion.id_disciplina;
    option.text = opcion.disciplina;
    select.appendChild(option);
  });
}
// == FIN seleccionar DISCIPLINA ==

// == seleccionar EFICIENCIA segun DIVISIONAL y DISCIPLINA ==
function buscarEficiencia() {
  disciplina = $("#altaDisciplina").val(); // ID de la disciplina
  // alert("Deisciplina:" + disciplina);
  opcion = 7;
  // alert(divisional)
  fetch(
    `api/relaciones.php?divisional=${divisional}&disciplina=${disciplina}&opcion=${opcion}`,
    {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    }
  )
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      //   console.log(datos);
      llenarSelectEficiencia(datos);
      buscarAltaCombinada(disciplina);
    });
}

function llenarSelectEficiencia(datos) {
  var select = document.getElementById("altaEficiencia");
  // Limpiar opciones existentes
  select.innerHTML = "";
  // Agregar opción vacía
  var opcionVacia = document.createElement("option");
  opcionVacia.value = "";
  opcionVacia.text = "Seleccione una Eficiencia";
  select.appendChild(opcionVacia);
  // Iterar sobre las opciones y agregarlas al select
  datos.forEach(function (opcion) {
    var option = document.createElement("option");
    option.value = opcion.id_eficiencia;
    option.text = opcion.eficiencia;
    select.appendChild(option);
  });
}

// selecciona la combinada segun la eficiencia para las altas
function buscarAltaCombinada(disciplina) {
  opcion = 6;

  fetch(`api/combinada.php?id_disciplina=${disciplina}&opcion=${opcion}`, {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  })
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      llenarSelectCombinadas(datos);
    });
}
// completas los selects de las combiadas
function llenarSelectCombinadas(datos) {
  //verifica si la array sea distinta de vacía y la muestra
  if (datos !== "") {
    var combinadasDiv = document.getElementById("combinadas");
    combinadasDiv.style.display = "block";
    var selectPrograma1 = document.getElementById("altaPrograma1");
    selectPrograma1.setAttribute("required", "required");
    var selectPrograma2 = document.getElementById("altaPrograma2");
    selectPrograma2.setAttribute("required", "required");
  }
  // verifica si la array esta vacía y la oculta
  if (datos.length === 0) {
    var combinadasDiv = document.getElementById("combinadas");
    var selectPrograma1 = document.getElementById("altaPrograma1");
    selectPrograma1.removeAttribute("required");
    var selectPrograma2 = document.getElementById("altaPrograma2");
    selectPrograma2.removeAttribute("required");
    combinadasDiv.style.display = "none";
  }

  // completa los select del PROGRAMA 1 y PROGRAMA 2
  // Limpiar opciones existentes en el primer select (altaPrograma1)
  var select1 = document.getElementById("altaPrograma1");
  select1.innerHTML = "";
  // Agregar una opción vacía al principio del select
  var opcionVacia1 = document.createElement("option");
  opcionVacia1.value = "";
  select1.appendChild(opcionVacia1);

  // Limpiar opciones existentes en el segundo select (altaPrograma2)
  var select2 = document.getElementById("altaPrograma2");
  select2.innerHTML = "";
  // Agregar una opción vacía al principio del select
  var opcionVacia2 = document.createElement("option");
  opcionVacia2.value = "";
  select2.appendChild(opcionVacia2);

  // Iterar sobre los datos y llenar los selectores
  datos.forEach(function (opcion) {
    // Llenar el primer select (altaPrograma1)
    var option1 = document.createElement("option");
    option1.value = opcion.id_disciplina; //valor del ID de la disciplina en la tabal de combinadas
    option1.text = opcion.programa1; // vlor de la combinada segun la disciplina
    select1.appendChild(option1);

    // Llenar el segundo select (altaPrograma2)
    var option2 = document.createElement("option");
    option2.value = opcion.id_disciplina; //valor del ID de la disciplina en la tabal de combinadas
    option2.text = opcion.programa2; // vlor de la combinada segun la disciplina
    select2.appendChild(option2);
  });
}
// == FIN seleccionar EFICIENCIA segun DIVISIONAL y DISCIPLINA ==

// == seleccionar CATEGORIA segun DIVISIONAL - DISCIPLINA y EFICIENCIA ==
function buscarCategoria() {
  var edad = $("#altaEdad").val();
  // console.log(edad);
  eficiencia = $("#altaEficiencia").val();
  //   alert("Eficiencia:" + eficiencia);
  opcion = 8;
  // alert(divisional)
  fetch(
    `api/relaciones.php?divisional=${divisional}&disciplina=${disciplina}&eficiencia=${eficiencia}&edad=${edad}&opcion=${opcion}`,
    {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    }
  )
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      //   console.log(datos);
      llenarSelectCategoria(datos);
    });
}

function llenarSelectCategoria(datos) {
  var select = document.getElementById("altaCategoria");
  // Limpiar opciones existentes
  select.innerHTML = "";
  // Agregar opción vacía
  var opcionVacia = document.createElement("option");
  opcionVacia.value = "";
  opcionVacia.text = "Seleccione una Categoria";
  select.appendChild(opcionVacia);
  // Iterar sobre las opciones y agregarlas al select
  datos.forEach(function (opcion) {
    var option = document.createElement("option");
    option.value = opcion.id_categoria;
    option.text = opcion.categoria;
    select.appendChild(option);
  });
}
// == FIN seleccionar CATEGORIA segun DIVISIONAL - DISCIPLINA - EFICIENCIA - PROGRAMA 1 y PROGRAMA 2 ==

// === Completa los inputs2 con los valores de la descripción de los Selects ===
function cargarOptions() {
  // Completa el imput con el DIVISIONAL
  var miSelectDivisional = document.getElementById("altaDivisional");
  var indiceDivisional = miSelectDivisional.selectedIndex;
  var textoDivisional = miSelectDivisional.options[indiceDivisional].text;
  document.getElementById("altaDivicional2").value = textoDivisional;
  // Completa el imput con la DISCIPLINA
  var miSelectDisciplina = document.getElementById("altaDisciplina");
  var indiceDisciplina = miSelectDisciplina.selectedIndex;
  var textoDisciplina = miSelectDisciplina.options[indiceDisciplina].text;
  document.getElementById("altaDisciplina2").value = textoDisciplina;
  // Completa el imput con la EFICIENCIA
  var miSelectEficiencia = document.getElementById("altaEficiencia");
  var indiceEficiencia = miSelectEficiencia.selectedIndex;
  var textoEficiencia = miSelectEficiencia.options[indiceEficiencia].text;
  document.getElementById("altaEficiencia2").value = textoEficiencia;
  // Completa el imput con la CATEGORIA
  var miSelectCategoria = document.getElementById("altaCategoria");
  var indiceCategoria = miSelectCategoria.selectedIndex;
  var textoCategoria = miSelectCategoria.options[indiceCategoria].text;
  document.getElementById("altaCategoria2").value = textoCategoria;
  // Completa el imput con el PROGRAMA 1
  var miSelectPrograma1 = document.getElementById("altaPrograma1");
  var indicePrograma1 = miSelectPrograma1.selectedIndex;
  var textoPrograma1 = miSelectPrograma1.options[indicePrograma1].text;
  document.getElementById("altaPrograma1_2").value = textoPrograma1;
  // Completa el imput con el PROGRAMA 2
  var miSelectPrograma2 = document.getElementById("altaPrograma2");
  var indicePrograma2 = miSelectPrograma2.selectedIndex;
  var textoPrograma2 = miSelectPrograma2.options[indicePrograma2].text;
  document.getElementById("altaPrograma2_2").value = textoPrograma2;
}
// === FIN Completa los inputs2 con los valores de la descripción de los Selects ===
// === FIN ALTAS ===

// === MODIFICACIONES ===
// borra los selecto si hay una modificación en el divisional
function cargarConsultaOptions() {
  $("#consultarDisciplina").empty();
  $("#consultarEficiencia").empty();
  $("#consultarCategoria").empty();
  $("#consultarPrograma1").empty();
  $("#consultarPrograma2").empty();
  buscarConsultarDisciplina();
}

// == FIN seleccionar Consultar DISCIPLINA ==
function buscarConsultarDisciplina() {
  divisional = $("#consultarDivisional").val();

  opcion = 6;
  //   alert("Divisional: " + divisional);
  fetch(`api/relaciones.php?divisional=${divisional}&opcion=${opcion}`, {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  })
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      llenarSelectConsDisciplinas(datos);
    });
}

function llenarSelectConsDisciplinas(datos) {
  var select = document.getElementById("consultarDisciplina");
  // console.log(select);
  // Limpiar opciones existentes
  select.innerHTML = "";
  // Agregar opción vacía
  var opcionVacia = document.createElement("option");
  opcionVacia.value = "";
  opcionVacia.text = "Seleccione una Disciplina";
  select.appendChild(opcionVacia);
  // Iterar sobre las opciones y agregarlas al select
  datos.forEach(function (opcion) {
    var option = document.createElement("option");
    option.value = opcion.id_disciplina;
    option.text = opcion.disciplina;
    select.appendChild(option);
  });
}
// == FIN seleccionar DISCIPLINA ==

// == seleccionar EFICIENCIA segun DIVISIONAL y DISCIPLINA ==
function buscarConsultarEficiencia() {
  disciplina = $("#consultarDisciplina").val();
  // alert("Deisciplina:" + disciplina);
  opcion = 7;
  // alert(divisional)
  fetch(
    `api/relaciones.php?divisional=${divisional}&disciplina=${disciplina}&opcion=${opcion}`,
    {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    }
  )
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      //   console.log(datos);
      llenarSelectConsEficiencia(datos);
      buscarConsultarCombinada(disciplina);
    });
}

function llenarSelectConsEficiencia(datos) {
  var select = document.getElementById("consultarEficiencia");
  // Limpiar opciones existentes
  select.innerHTML = "";
  // Agregar opción vacía
  var opcionVacia = document.createElement("option");
  opcionVacia.value = "";
  opcionVacia.text = "Seleccione una Eficiencia";
  select.appendChild(opcionVacia);
  // Iterar sobre las opciones y agregarlas al select
  datos.forEach(function (opcion) {
    var option = document.createElement("option");
    option.value = opcion.id_eficiencia;
    option.text = opcion.eficiencia;
    select.appendChild(option);
  });
}

// selecciona la combinada segun la eficiencia para las altas
function buscarConsultarCombinada(disciplina) {
  console.log(disciplina);
  opcion = 6;

  fetch(`api/combinada.php?id_disciplina=${disciplina}&opcion=${opcion}`, {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  })
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      llenarSelectConsultarCombinadas(datos);
    });
}
// completas los selects de las combiadas
function llenarSelectConsultarCombinadas(datos) {
  // console.log(datos);
  //verifica si la array no esta vacía y la muestra
  if (datos !== "") {
    var consultarCombinadasDiv = document.getElementById("consultarCombinadas");
    consultarCombinadasDiv.style.display = "block";
    var select_Programa1 = document.getElementById("consultarPrograma1");
    select_Programa1.setAttribute("required", "required");
    var select_Programa2 = document.getElementById("consultarPrograma2");
    select_Programa2.setAttribute("required", "required");
  }
  // verifica si la array esta vacía y la oculta
  if (datos.length === 0) {
    var consultarCombinadasDiv = document.getElementById("consultarCombinadas");
    consultarCombinadasDiv.style.display = "none";
    var select_Programa1 = document.getElementById("consultarPrograma1");
    select_Programa1.removeAttribute("required");
    var select_Programa2 = document.getElementById("consultarPrograma2");
    select_Programa2.removeAttribute("required");
  }

  // completa los select del PROGRAMA 1 y PROGRAMA 2
  // Limpiar opciones existentes en el primer select (altaPrograma1)
  var select1 = document.getElementById("consultarPrograma1");
  select1.innerHTML = "";
  // Agregar una opción vacía al principio del select
  var opcionVacia1 = document.createElement("option");
  opcionVacia1.value = "";
  select1.appendChild(opcionVacia1);

  // Limpiar opciones existentes en el segundo select (altaPrograma2)
  var select2 = document.getElementById("consultarPrograma2");
  select2.innerHTML = "";
  // Agregar una opción vacía al principio del select
  var opcionVacia2 = document.createElement("option");
  opcionVacia2.value = "";
  select2.appendChild(opcionVacia2);

  // Iterar sobre los datos y llenar los selectores
  datos.forEach(function (opcion) {
    // Llenar el primer select (altaPrograma1)
    var option1 = document.createElement("option");
    option1.value = opcion.id_disciplina; //valor del ID de la disciplina en la tabal de combinadas
    option1.text = opcion.programa1; // vlor de la combinada segun la disciplina
    select1.appendChild(option1);

    // Llenar el segundo select (altaPrograma2)
    var option2 = document.createElement("option");
    option2.value = opcion.id_disciplina; //valor del ID de la disciplina en la tabal de combinadas
    option2.text = opcion.programa2; // vlor de la combinada segun la disciplina
    select2.appendChild(option2);
  });
}
// == FIN seleccionar EFICIENCIA segun DIVISIONAL y DISCIPLINA ==

// == seleccionar CATEGORIA segun DIVISIONAL - DISCIPLINA y EFICIENCIA ==
function buscarConsultarCategoria() {
  var edad = $("#consultarEdad").val();
  // console.log(edad);
  eficiencia = $("#consultarEficiencia").val();
  //   alert("Eficiencia:" + eficiencia);
  opcion = 8;
  // alert(divisional)
  fetch(
    `api/relaciones.php?divisional=${divisional}&disciplina=${disciplina}&eficiencia=${eficiencia}&edad=${edad}&opcion=${opcion}`,
    {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
    }
  )
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      //   console.log(datos);
      llenarConsSelectCategoria(datos);
    });
}

function llenarConsSelectCategoria(datos) {
  var select = document.getElementById("consultarCategoria");
  // Limpiar opciones existentes
  select.innerHTML = "";
  // Agregar opción vacía
  var opcionVacia = document.createElement("option");
  opcionVacia.value = "";
  opcionVacia.text = "Seleccione una Categoria";
  select.appendChild(opcionVacia);
  // Iterar sobre las opciones y agregarlas al select
  datos.forEach(function (opcion) {
    var option = document.createElement("option");
    option.value = opcion.id_categoria;
    option.text = opcion.categoria;
    select.appendChild(option);
  });
}
// == FIN seleccionar CATEGORIA segun DIVISIONAL - DISCIPLINA y EFICIENCIA ==

// === Completa los inputs2 con los valores de la descripción de los Selects ===
function cargarConsultarOptions() {
  // Completa el imput con el DIVISIONAL
  var miSelectDivisional = document.getElementById("consultarDivisional");
  var indiceDivisional = miSelectDivisional.selectedIndex;
  var textoDivisional = miSelectDivisional.options[indiceDivisional].text;
  document.getElementById("consultarDivisional2").value = textoDivisional;
  // console.log(textoDivisional);
  // Completa el imput con la DISCIPLINA
  var miSelectDisciplina = document.getElementById("consultarDisciplina");
  var indiceDisciplina = miSelectDisciplina.selectedIndex;
  var textoDisciplina = miSelectDisciplina.options[indiceDisciplina].text;
  document.getElementById("consultarDisciplina2").value = textoDisciplina;
  // console.log(textoDisciplina);
  // Completa el imput con la EFICIENCIA
  var miSelectEficiencia = document.getElementById("consultarEficiencia");
  var indiceEficiencia = miSelectEficiencia.selectedIndex;
  var textoEficiencia = miSelectEficiencia.options[indiceEficiencia].text;
  document.getElementById("consultarEficiencia2").value = textoEficiencia;
  // console.log(textoEficiencia);
  // Completa el imput con la CATEGORIA
  var miSelectCategoria = document.getElementById("consultarCategoria");
  var indiceCategoria = miSelectCategoria.selectedIndex;
  var textoCategoria = miSelectCategoria.options[indiceCategoria].text;
  document.getElementById("consultarCategoria2").value = textoCategoria;
  // console.log(textoCategoria);
  // Completa el imput con el PROGRAMA 1
  var miSelectPrograma1 = document.getElementById("consultarPrograma1");
  var indicePrograma1 = miSelectPrograma1.selectedIndex;
  var textoPrograma1 = miSelectPrograma1.options[indicePrograma1].text;
  document.getElementById("consultarPrograma1_2").value = textoPrograma1;
  // console.log(textoPrograma1);
  // Completa el imput con el PROGRAMA 2
  var miSelectPrograma2 = document.getElementById("consultarPrograma2");
  var indicePrograma2 = miSelectPrograma2.selectedIndex;
  var textoPrograma2 = miSelectPrograma2.options[indicePrograma2].text;
  document.getElementById("consultarPrograma2_2").value = textoPrograma2;
  // console.log(textoPrograma2);
}
// === FIN Completa los inputs2 con los valores de la descripción de los Selects ===
// === FIN MODIFICACIONES ===
