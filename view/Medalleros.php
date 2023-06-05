<?php include_once 'config.php'?>
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
    <div class="row mt-5 mb-3">
        <div class="col-md-8 text-center">
        <h1>Premiaciones</h1>
        </div>
        <div class="col-md-4">
            <div class="d-grid gap-2">
              <button type="button" class="btn btn-warning btn-lg" data-bs-toggle="modal" data-bs-target="#modal-premiaciones">Nuevo</button>
            </div>
        </div>
    </div>
    <div class="row">
      <div class="col-md-5 mt-2">
        <div class="form-floating">
          <select name="fecha" id="fecha" class="form-select">
            <option value="">Seleccione</option>
          </select>
          <label for="fecha">Fecha</label>
        </div>
      </div>
      <div class="col-md-5 mt-2">
        <div class="form-floating">
          <select name="disciplinas" id="disciplinas" class="form-select">
            <option value="">Seleccione</option>
          </select>
          <label for="disciplinas">Disicplina</label>
        </div>
      </div>
      <div class="col-md-2 mt-4">
        <div class="d-grid">
          <button class="btn btn-secondary" type="button" id="buscar">Buscar</button>
        </div>
      </div>
    </div>
    
    <div class="d-grid mt-3">
      <button class="btn btn-primary" type="button" id="exportar">Exportar PDF</button>
    </div>

    <div class="alert alert-danger mt-5" role="alert" id="alerta"></div>

    <div class="row mt-3">
        <div class="row row-cols-2 row-cols-sm-3 g-2 mt-3" id="cards">
            <!-- Contenedor de cards -->

        </div>
    </div>
</div><!-- fin de container  cards-->

<!-- inicio de modal para registrar-->
<div class="modal fade" id="modal-premiaciones" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitleId">Premiaciones</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="" autocomplete="off" id="formulario-premiaciones">
          <div class="row">
            <div class="col-md-6 mt-2">
              <div class="form-floating">
                <select name="md-fecha" id="md-fecha" class="form-select">
                  <option value="">Seleccione</option>
                </select>
                <label for="md-fecha">Fecha</label>
              </div>
            </div>
            <div class="col-md-6 mt-2">
              <div class="form-floating">
                <select name="md-disciplinas" id="md-disciplinas" class="form-select">
                  <option value="">Seleccione</option>
                </select>
                <label for="md-disciplinas">Disciplinas</label>
              </div>
            </div>
            </div>
            <div class="col-md-12 mt-3">
              <div class="d-grid">
                <button class="btn btn-warning" type="button" id="equipos">Ver Equipos</button>
              </div>
          </div>
          <div class="row mt-3">
            <table class="table table-spriped">
            <colgroup>
                <col width="10%"> <!-- # -->
                <col width="60%"> <!-- titulo -->
                <col width="30%"> <!-- descripcion -->
            </colgroup>
              <thead>
                <tr>
                  <th>#</th>
                  <th>Equipo</th>
                  <th>Posicion</th>
                </tr>
              </thead>
              <tbody>
                <!-- Asincronos -->
                <div class="alert alert-danger mt-5" role="alert" id="md-alerta"></div>
              </tbody>
            </table>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="premiar">Premiar</button>
      </div>
    </div>
  </div>
</div>
<!-- fin de modal -->
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
  document.addEventListener("DOMContentLoaded", () =>{
    
    const contenido = document.querySelector("#cards");
    const listDisciplinas = document.querySelector("#disciplinas");
    const listFecha = document.querySelector("#fecha");
    const btBuscar = document.querySelector("#buscar");
    const alerta = document.querySelector("#alerta");
    const mdAlerta = document.querySelector("#md-alerta");

    const listaModalFecha = document.querySelector("#md-fecha");
    const listaModalDisciplina = document.querySelector("#md-disciplinas");
    const btEquipos = document.querySelector("#equipos");
    const cuerpoTabla = document.querySelector("tbody");
    const btPremiar = document.querySelector("#premiar");
    const formPremiacion = document.querySelector("#formulario-premiaciones");
    
    const btExportar = document.querySelector("#exportar");
    
    btExportar.classList.add('d-none')
    alerta.classList.add('d-none');
    mdAlerta.classList.add('d-none');
    

    function listarDatos(estado, tipo, objetoDisciplina, objetoFecha) {
      const parametros = new URLSearchParams();
      parametros.append("operacion", "listarMedalleros");
      parametros.append("iddisciplina", objetoDisciplina);
      parametros.append("idolimpiada", objetoFecha);
      parametros.append("estado", estado);

      fetch("../controller/medallero.controller.php", {
        method: 'POST',
        body: parametros
      })
        .then(response => response.json())
        .then(datos => {
          alerta.classList.remove('d-block');
          alerta.classList.add('d-none');
          if(tipo == "medalleros"){
            contenido.innerHTML = '';
            datos.forEach(element => {
              let card = `
              <div class="col">
                <div class="card mb-3">
                  <div class="card-body">
                    <hr>
                    <h5 class="card-subtitle mb-2">Puesto: ${element.puesto}</h5>
                    <h6 class="card-subtitle mb-2">Equipo: ${element.equipo}</h6>
                    <p class="card-text"><small class="text-muted">lugar: ${element.lugar}</small></p>
                    <p class="card-text text-center"><small class="text-muted">${element.fecha}</small></p>
                  </div>
                </div>
              </div>
              `;
              contenido.innerHTML += card;
              configExportar();
          });
          }else if(tipo == "participantes"){
            mdAlerta.classList.remove('d-block');
            mdAlerta.classList.add('d-none');
            cuerpoTabla.innerHTML = ``;
            datos.forEach(element => {
              const fila = `
                <tr>
                  <td>${element.idmedallero}</td>
                  <td>${element.equipo}</td>
                  <td>
                    <input type="number" class="puesto form-control form-control-sm" min="0" max="10">
                  </td>
                </tr>
              `;
              cuerpoTabla.innerHTML += fila;
            });
          }

          })
        .catch(erro =>{
          alertaError(tipo);
          btExportar.classList.add('d-none')
        });
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

    function alertaError(tipo){
      if(tipo == "medalleros"){
        contenido.innerHTML = '';
        alerta.classList.remove('d-none');
        alerta.classList.add('d-block');
        alerta.classList.add('alert-danger');
        alerta.innerHTML = "No hay datos por mostrar"; 
      }else{
        cuerpoTabla.innerHTML = '';
        mdAlerta.classList.remove('d-none');
        mdAlerta.classList.remove('alert-danger');
        mdAlerta.classList.add('d-block');
        mdAlerta.classList.add('alert-success');
        mdAlerta.innerHTML = "ya tiene datos existentes"; 
      }
    }

    function configExportar(){
      btExportar.classList.remove('d-none');
      btExportar.classList.add('d-block');
    }

    function getDisciplinas(id, objectSelect){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarDetDisciplinas");
        parametros.append("idolimpiada", id);

        fetch('../controller/select.controller.php',{
          method: 'POST',
          body:parametros
        })
        .then(response => response.json())
        .then(datos => {
          objectSelect.innerHTML = `<option value="">Seleccione</option>`;
          datos.forEach(element => {
            const optionTag = document.createElement('option');
            optionTag.value = element[0];
            optionTag.text = element[1];
            objectSelect.appendChild(optionTag);
          });
        })
        .catch(error => {
          alertaError();
        });
    }

    function premiar(){
      const filas = Array.from(cuerpoTabla.children); // children = contenido de la tabla
      filas.forEach(element =>{
        const id = element.cells[0].textContent;
        const puesto = element.cells[2].querySelector('input').value;
        
        const fd = new FormData();
        fd.append("operacion", "premiarMedallero");

        fd.append("idmedallero", id);
        fd.append("puesto", puesto);

        fetch("../controller/medallero.controller.php",{
          method: 'POST',
          body: fd
        })
      })
      formPremiacion.reset();
      cuerpoTabla.innerHTML = '';
    }

    function generarPDF(){
      const parametros = new URLSearchParams();
      parametros.append("iddisciplina", parseInt(listDisciplinas.value));
      parametros.append("idolimpiada", parseInt(listFecha.value));
      parametros.append("estado", "1");
      parametros.append("titulo", listDisciplinas.options[listDisciplinas.selectedIndex].text +
      " - " + listFecha.options[listFecha.selectedIndex].text);
      window.open(`../report/medallero.reporte.php?${parametros}`, '_blank');
    }

    listarSelect("listarOlimpiadasFecha", listFecha);
    listarSelect("listarOlimpiadasFecha", listaModalFecha);


    btBuscar.addEventListener("click", function(){
      listarDatos("1", "medalleros", parseInt(listDisciplinas.value), parseInt(listFecha.value));
    });
    btEquipos.addEventListener("click", function(){
      listarDatos("0", "participantes", parseInt(listaModalDisciplina.value), parseInt(listaModalFecha.value));
    });

    listFecha.addEventListener("change", function() {
      getDisciplinas(parseInt(listFecha.value), listDisciplinas);
    });

    listaModalFecha.addEventListener("change", function(){
      getDisciplinas(parseInt(listaModalFecha.value), listaModalDisciplina);
    });

    btPremiar.addEventListener("click", premiar);
    btExportar.addEventListener("click", generarPDF);

  });
</script>
</body>
</html>