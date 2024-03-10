<!doctype html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>

<body>
    <div>
        <img src="assets/dataSkate1.png">
    </div>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreen">ver</button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalFullscreen" tabindex="-1" aria-labelledby="exampleModalFullscreenLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title h4" id="exampleModalFullscreenLabel">Registro de Instituciones</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <h4>Datos del Club</h4>
                        <div class="row col-12" id="datosClub"></div>
                    </div>

                    <div>
                        <h4>Tecnicos</h4>
                        <div class="row col-12" id="datosTecnicos"></div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <?php include('modulos/encabezado_user_admin.php'); ?>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script>
        var opcion = 0;
        var id = 0;
        $(document).ready(function() {
            opcion = 0;
            id = 24;
            fetch(`../newproyect_Rio_v1/api/test.php?id=${id}&opcion=${opcion}`, {
                    method: "GET",
                    headers: {
                        Accept: "application/json",
                        "Content-Type": "application/json",
                    },
                })
                .then((respuesta) => respuesta.json())
                .then((datos) => {
                    consultarDatosClub(datos);
                    // Recorre la ARRAY
                    for (var dato of datos) {
                        consultarDatosTecnicos(dato);
                    }
                });
        });

        function consultarDatosClub(datos) {
            $("#datosClub").append(
                `<div class="col-md-3 col-xl-5">
                    <div class="card">
                        <div class="card-header">
                        <h5 class="card-title">Club: ${datos[0].institucion}</h5>
                        </div>
                        <div class="card-body">
                            <span>cuit:${datos[0].cuit} </span>
                        </div>
                        </div>
                </div>`
            );
        }

        function consultarDatosTecnicos(dato) {
            $("#datosTecnicos").append(
                `<div class="col-md-3 col-xl-3">
                    <div class="card">
                        <div class="card-header">
                        <h5 class="card-title">Nombre: ${dato.nombretecnico}</h5>
                        </div>
                        <div class="card-body">
                            <span>Licencia: ${dato.licencia} </span>
                        </div>
                        </div>
                </div>`
            );
        }
    </script>
</body>

</html>