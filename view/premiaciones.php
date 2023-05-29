<?php

session_start();

if(!isset($_SESSION['seguridad']) || $_SESSION['seguridad']['login'] == false){
  header('location: ../index.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premiaciones</title>

    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="../css/stilos.css">

    <!-- Bootstrap v5.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row mt-3">
      <ul class="nav nav-tabs justify-content-end">
        <li class="nav-item">
          <a class="nav-link text-dark" aria-current="page" href="./dashboard.php">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active bg-warning" href="./premiaciones.php">Premiaciones</a>
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
              <a class="dropdown-item" href="../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
            </div>
        </div><!-- fin de goup button -->
      </ul><!-- fin de nav -->
    </div><!-- fin de row -->
</div> <!-- fin de container -->

<div class="container">
    <div class="row mt-5">
        <div class="col-md-8 text-center">
        <h1>Premiaciones</h1>
        </div>
        <div class="col-md-4">
            <div class="d-grid gap-2">
              <button type="button" class="btn btn-warning btn-lg" data-bs-toggle="modal" data-bs-target="#modal-premiaciones">Nuevo</button>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <div class="row row-cols-2 row-cols-sm-3 g-2 mt-3" id="cards">
            <!-- Contenedor de cards -->

        </div>
    </div>
</div><!-- fin de container -->

<!-- inicio de modal para registrar-->
<div class="modal fade" id="modal-premiaciones" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitleId">Premiaciones</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="" autocomplete="off" id="formulario-eventos">
          <div class="form-floating mb-3">
            <input type="text" class="form-control" id="nombre" autofocus maxlength="50">
            <label for="nombre">Nombre del evento</label>
          </div>
          <div class="row mb-3">
            <div class="mb-3 col-md-6">
              <label for="sedes">Sedes:</label>
              <select name="sedes" id="sedes" class="form-select">
                <option value="">Seleccione</option>
              </select>
            </div>
            <div class="form-floating mb-3 col-md-6">
              <input type="text" class="form-control" id="fecha" maxlength="4">
              <label for="fecha">Año de realizacion</label>
            </div>
          </div>
          <label for="disciplina">Disciplinas:</label>
              <select name="disciplina" id="disciplina" class="form-select">
                <option value="">Seleccione</option>
              </select>
          <div class="row">
            <div class="mb-3 col-md-4">
              <label for="oro">Oro:</label>
              <select name="" id="oro" class="form-select">
              <option value="">Seleccione</option>
              </select>
            </div>
            <div class="mb-3 col-md-4">
              <label for="plata">Plata:</label>
              <select name="" id="plata" class="form-select">
              <option value="">Seleccione</option>
              </select>
            </div>
            <div class="mb-3 col-md-4">
              <label for="bronce">Bronce:</label>
              <select name="" id="bronce" class="form-select">
              <option value="">Seleccione</option>
              </select>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success">Participantes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
<!-- fin de modal -->

<!-- inicio modal ver participantes -->
<div class="modal fade" id="modal-ver-participantes" tabindex="-1" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitleId">Participantes</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="">
          <table class="table table-striped mt-4" id="tabla-participantes">
            <thead>
              <th>ID</th>
              <th>Nombres y apellidos</th>
            </thead>
            <tbody>
              <!-- llenado asincrono -->
            </tbody>
          </table>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- fin de modal -->
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
  document.addEventListener("DOMContentLoaded", () =>{
    
    const contenido = document.querySelector("#cards");
    const lisSedes = document.querySelector("#sedes");
    const lisDisciplinas = document.querySelector("#disciplina");
    const lisOro = document.querySelector("#oro");
    const lisPlata = document.querySelector("#plata");
    const lisBronce = document.querySelector("#bronce");
    const btAbriParticipantes = document.querySelector("#modal-ver-participantes");
    const tbParticipantes = document.querySelector("#tabla-participantes");
    const tbBody = document.querySelector("tbody");

    let id = 0;

    function listarEventos() {
      const parametros = new URLSearchParams();
      parametros.append("operacion", "listarEventos");

      fetch("../controller/evento.controller.php", {
        method: 'POST',
        body: parametros
      })
        .then(response => response.json())
        .then(datos => {
          contenido.innerHTML = '';
          datos.forEach(element => {
            const urlImg = "../img/logo.png";
            let card = `
            <div class="col">
              <div class="card mb-3">
                <img src="${urlImg}" class="card-img-top" alt="...">
                <div class="card-body">
                  <h4 class="card-title text-center">${element.nombreEvento}</h4>
                  <hr>
                  <h5 class="card-subtitle mb-2 bg-oro">Oro: ${element.Oro}</h5>
                  <h6 class="card-subtitle mb-2 bg-plata">Plata: ${element.Plata}</h6>
                  <h6 class="card-subtitle mb-2 bg-bronce">Bronce: ${element.Bronce}</h6>
                  <p class="card-text"><small class="text-muted
                  ">Sede: ${element.nombreSede}</small></p>
                  <p class="card-text text-center"><small class="text-muted">${element.fecharealizada}</small></p>
                  <button type="button" class="evento btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#modal-ver-participantes" data-idevento='${element.idevento}'">Ver participantes</button>
                </div>
              </div>
            </div>
            `;
            contenido.innerHTML += card;
          });
        })
    }

    function listarSelect(operacion = "", objectSelect){
      const parametros = new URLSearchParams();
        parametros.append("operacion", operacion);
        fetch('../controller/select.controller.php',{
          method: 'POST',
          body:parametros
        })
          .then (response => response.json())
          .then(datos=>{
            datos.forEach(element => { 
              const optionTag = document.createElement("option");
              optionTag.value = element[0];
              optionTag.text = element[1];
              objectSelect.appendChild(optionTag);
            });
          });
    }

    listarSelect("listarSedes", lisSedes);
    listarSelect("listarDisciplinas", lisDisciplinas);
    listarSelect("listarParticipantes", lisOro);
    listarSelect("listarParticipantes", lisPlata);
    listarSelect("listarParticipantes", lisBronce);

    listarEventos();
    btAbriParticipantes.addEventListener('click', (event) => {
          if(event.target.classList[0] === 'evento'){
            id = parseInt(event.target.dataset.idevento);
          }
        });
  });
</script>
</body>
</html>