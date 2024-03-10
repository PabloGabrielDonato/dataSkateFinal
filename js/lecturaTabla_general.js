var fila;
// la variable URL viene de cada modulo y carga los datos en la tabla
$(document).ready(function () {
  fetch(url, {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  })
    .then((respuesta) => respuesta.json())
    .then((datos) => {
      // Recorre la ARRAY
      for (var dato of datos) {
        consultarDatosATabla(dato);
      }
      estilosDataTable();
    });
});

// Tabla Responsive y Exporta la tabla a EXCEL, PDF y PRINT
function estilosDataTable() {
  switch (opcionDataTable) {
    case "archivoBuenaFe": // ==== TABLA ARCHIVO BUENA FE ====
      $("#tablaClientes").DataTable({
        lengthMenu: [
          [10, 25, 50, -1],
          [10, 25, 50, "All"],
        ], //configura cantidad de lineas por pantala
        // columnas a ordenar
        order: [
          [6, "asc"],
          [7, "asc"],
          [8, "asc"],
          [5, "asc"],
        ],
        // paneles de busqueda filtros
        searchPanes: {
          viewTotal: true,
          layout: "columns-4",
          initCollapsed: true,
        },
        // definicion de columnas en el filtro
        columnDefs: [
          {
            searchPanes: {
              show: true,
            },
            targets: [1, 5, 6, 7, 8, 9, 10, 11],
          },
        ],
        // drag and drop columnas de la tabla
        // colReorder: true,
        // Tabla con scroll
        // scrollY: 350,
        // Paginación de la taba
        // paging: false,
        // Botenes de la tabla
        buttons: ["excelHtml5", "print"],
        // Filtro Si agregamos una P en el don aparece el buscar
        dom: '"PBfrtilp"',
        language: {
          lengthMenu: "Mostrar _MENU_ registros",
          zeroRecords: "No se encontraron resultados",
          emptyTable: "Ningún dato disponible en esta tabla",
          infoFiltered: "(filtrado de un total de _MAX_ registros)",
          info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
          infoEmpty:
            "Mostrando registros del 0 al 0 de un total de 0 registros",
          search: "Buscar:",
          paginate: {
            next: "Siguiente",
            previous: "Anterior",
          },
          searchPanes: {
            clearMessage: "Borrar todo",
            title: "Filtros Activos - %d",
            showMessage: "Mostrar Todo",
            collapseMessage: "Ocultar Todo",
          },
          buttons: {
            colvis: "Seleccionar Columnas",
          },
        },
      });
      filtros();
      break;

    case "archivoLibroTorneo": // ==== TABLA ARCHIVO LIBRO TORNEO ====
      $("#tablaClientes").DataTable({
        // paneles de busqueda filtros
        searchPanes: {
          viewTotal: true,
          layout: "columns-5",
          initCollapsed: true,
        },
        // definicion de columnas en el filtro
        columnDefs: [
          {
            searchPanes: {
              // columnas que participan del filtro
              show: true,
            },
            targets: [4, 5, 6, 8, 9, 10, 13, 14, 15, 16],
          },
          {
            // columnas fuera del filtro
            searchPanes: {
              show: false,
            },
            targets: [0, 1, 2, 3, 7, 11, 12],
          },
          {
            // oculta columnas
            targets: [3, 5, 8, 9, 11, 13, 14, 15, 16],
            visible: false,
          },
        ],
        // columnas a ordenar
        order: [
          [5, "asc"],
          [8, "asc"],
          [9, "asc"],
        ],
        // columnas de agrupamiento
        rowGroup: {
          dataSrc: [5, 8, 11],
          // cuenat la cantidad de filas de cada grupo
          startRender: function (rows, group) {
            return group + " (" + rows.count() + ")";
          },
        },
        colReorder: true, // drag and drop columnas de la tabla
        dom: '"PBfrtilp"', // Filtro Si agregamos una P en el don aparece el buscar
        language: {
          lengthMenu: "Mostrar _MENU_ registros",
          zeroRecords: "No se encontraron resultados",
          emptyTable: "Ningún dato disponible en esta tabla",
          infoFiltered: "(filtrado de un total de _MAX_ registros)",
          info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
          infoEmpty:
            "Mostrando registros del 0 al 0 de un total de 0 registros",
          search: "Buscar:",
          paginate: {
            next: "Siguiente",
            previous: "Anterior",
          },
          searchPanes: {
            clearMessage: "Borrar todo",
            title: "Filtros Activos - %d",
            showMessage: "Mostrar Todo",
            collapseMessage: "Ocultar Todo",
          },
          buttons: {
            colvis: "Seleccionar Columnas",
          },
        },
        // Tabla con scroll
        // scrollY: 400,
        // scrollCollapse: true,
        // scroller: true,
        paging: true, // Paginación de la taba
        // Botenes de la tabla y columnas visibles
        buttons: [
          "excelHtml5",
          // {
          //   extend: 'print',
          //   exportOptions: {
          //     columns: ':visible'
          //   }
          // },
          "colvis",
        ],
      });
      filtros();
      break;
  }
}
