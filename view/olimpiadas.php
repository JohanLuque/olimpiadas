<!-- <?php include_once 'config.php'?> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premiaciones</title>

    <!-- Bootstrap v5.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row mt-3">
      <ul class="nav nav-tabs justify-content-end">
        <li class="nav-item">
          <a class="nav-link text-dark" aria-current="page" href="./Dashboard.php">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active bg-warning" href="./Medalleros.php">Premiaciones</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-dark" aria-current="page" href="./Disciplinas.php">Disciplinas</a>
        </li>
        <div class="btn-group" role="group">
          <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <?php
                    if (isset($_SESSION['seguridad']) && $_SESSION['seguridad']['login']) {
                      $usuario = $_SESSION['seguridad']['nombres'] .' ' . $_SESSION['seguridad']['apellidos'];
                      echo '<span class="ms-1 d-none d-sm-inline">' . $usuario .'</span>';
                    }
                  ?>
          </button>
          <div class="dropdown-menu" aria-labelledby="triggerId">
              <a class="dropdown-item" href="../controller/persona.controller.php?operacion=destroy">Cerrar sesión</a>
            </div>
        </div><!-- fin de goup button -->
      </ul><!-- fin de nav -->
    </div><!-- fin de row -->
</div> <!-- fin de container  dashboard-->


<div class="container">
    <div class="mt-3">
      <h1>Olimpiadas</h1>
      <hr>
    </div>
    <div class="row mt-3">
        <div class="col-md-6"><!-- Tabla Disciplinas-->
          <table id="tabla-olimpiadas" class="table table-sm table-striped">
            <thead class="table-secondary">
              <tr>
              <th>#</th>
              <th>Nombre de olimpiada</th>
              <th>Fecha de inicio</th>
              <th>Fecha de fin</th>
              <th>Lugar</th>
              </tr>
            </thead>
            <tbody>
            
            </tbody>
          </table>
          <div class="alert alert-danger" role="alert" id="alerta"></div>
        </div>

        <div class="col-md-6"> <!-- Formulario de registro-->
            <form action="" autocomplete="off" id="formulario-olimpiadas" class="form-control needs-validation" novalidate>
                <div class="card">
                <div class="card-header text-center">
                    Registro de olimpiadas
                </div>
                <div class="card-body">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="nombre" placeholder="Nombre" maxlength="50" required>
                        <label for="nombre">Nombre de olimpiada</label>
                        <div class="invalid-feedback">Ingrese el nombre</div>
                    </div>
                    <div class="form-floating mt-3">
                        <input type="date" class="form-control" id="inicio" placeholder="inicio" maxlength="50" required>
                        <label for="inicio">Fecha de inicio</label>
                        <div class="invalid-feedback">Ingrese una fecha</div>
                    </div>
                    <div class="form-floating mt-3">
                        <input type="date" class="form-control" id="fin" placeholder="fin" maxlength="50">
                        <label for="fin">Fecha de fin</label>
                    </div>
                    <div class="form-floating mt-3">
                        <input type="text" class="form-control" id="lugar" placeholder="lugar" maxlength="50" required>
                        <label for="lugar">Lugar</label>
                        <div class="invalid-feedback">Ingrese un lugar</div>
                    </div>
                    <div class="d-grid gap-2 d-md-block mt-4">
                        <button class="btn btn-outline-secondary" type="reset" id="cancelar">Cancelar</button>
                        <button class="btn btn-warning" type="button" id="guardar">Guardar</button>
                    </div>
                </div> <!-- Fin card footer -->
                </div> <!-- Fin card -->
            </form> <!-- Fin formulario -->
        </div> <!-- Fin col-md-6 -->
    </div>
  </div>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    document.addEventListener("DOMContentLoaded", ()=>{
        const tabla = document.querySelector("#tabla-olimpiadas tbody");
        const txtNombre = document.querySelector("#nombre");
        const dateInicio = document.querySelector("#inicio");
        const dateFin = document.querySelector("#fin");
        const lugar = document.querySelector("#lugar");
        const formulario = document.querySelector("#formulario-olimpiadas");
        const btGuardar = document.querySelector("#guardar");
        const btCancelar = document.querySelector("#cancelar");

        const alerta = document.querySelector("#alerta");

        alerta.classList.add('d-none');

        function renderData(){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "listar");

            fetch("../controller/olimpiada.controller.php",{
            method: 'POST',
            body: parametros
            })
            .then(response => response.json())
            .then(datos =>{
                tabla.innerHTML = '';
                datos.forEach(element => {
                let fila = `
                <tr>
                    <td>${element[0]}</td>
                    <td>${element[1]}</td>
                    <td>${element[2]}</td>
                    <td>${element[3]}</td>
                    <td>${element[4]}</td>
                </tr>
                `;
                tabla.innerHTML += fila;
                })
            })
            .catch(erro=>{
                alertaError();
            })
        }

        function registro(){
            if(confirm("¿Desea guardar los datos?")){
            const parametros = new FormData();
            parametros.append("operacion", "RegistrarOlimpiada");
            parametros.append("nombre", txtNombre.value);
            parametros.append("fechainicio", dateInicio.value);
            parametros.append("fechafin", dateFin.value);
            parametros.append("lugar", lugar.value);

            fetch("../controller/olimpiada.controller.php",{
                method: 'POST',
                body: parametros
            })
                .then(response => response.json())
                .then(datos => {
                if(datos.status){
                    reset();
                }else{
                    alert(datos.message);
                }
                })
            }
        }

        function validar(event){
            if (!formulario.checkValidity()){
            event.preventDefault();
            event.stopPropagation();
            }else{
            registro();
            }
            formulario.classList.add('was-validated');
        }
    

        function reset(){
            renderData();
            formulario.reset();
            formulario.classList.remove('was-validated');
        }
        function alertaError(){
            alerta.classList.remove('d-none');
            alerta.classList.add('d-block');
            alerta.classList.add('alert-danger');
            alerta.innerHTML = "No hay datos por mostrar"; 
        
        }

        renderData();
        btGuardar.addEventListener("click", validar);
        btCancelar.addEventListener("click", reset);
    });
</script>
</body>
</html>