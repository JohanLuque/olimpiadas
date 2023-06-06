<?php include_once 'config.php'?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disciplinas</title>
    <!-- Bootstrap v5.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

</head>
<body>
<div class="container">
    <div class="row mt-3">
      <ul class="nav nav-tabs justify-content-end">
        <li class="nav-item">
          <a class="nav-link text-dark" aria-current="page" href="./Dashboard.php">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-dark" href="./Medalleros.php">Premiaciones</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active bg-warning" aria-current="page" href="./Disciplinas.php">Disciplinas</a>
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
</div> <!-- fin de container -->

<div class="container">
    <div class="mt-3">
      <h1>Disciplinas</h1>
      <hr>
    </div>
    <div class="row mt-3">
        <div class="col-md-6"><!-- Tabla Disciplinas-->
          <div class="d-grid mb-3">
            <button class="btn btn-primary" type="button" id="exportar">Exportar PDF</button>
          </div>
          <table id="tabla-disciplinas" class="table table-sm table-striped">
            <colgroup>
              <col width="10%"> <!-- # -->
              <col width="60%"> <!-- titulo -->
              <col width="30%"> <!-- descripcion -->
            </colgroup>
            <thead class="table-secondary">
              <tr>
              <th>#</th>
              <th>Nombre de disciplina</th>
              <th>Editar / Eliminar</th>
              </tr>
            </thead>
            <tbody>
            
            </tbody>
          </table>
          <div class="alert alert-danger" role="alert" id="alerta"></div>
        </div>

        <div class="col-md-6"> <!-- Formulario de registro-->
            <form action="" autocomplete="off" id="formulario-disciplinas" class="form-control needs-validation" novalidate>
                <div class="card">
                <div class="card-header text-center">
                    Registro de disciplinas
                </div>
                <div class="card-body">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="nombre" placeholder="Nombre" maxlength="50" required>
                        <label for="nombre">Nombre de disciplina</label>
                        <div class="invalid-feedback">Ingrese el nombre</div>
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
  document.addEventListener("DOMContentLoaded", () =>{
  let iddisciplina; 
  const tabla = document.querySelector("#tabla-disciplinas tbody");
  const formulario = document.querySelector("#formulario-disciplinas");
  const txtNombre = document.querySelector("#nombre");
  const btGuardar = document.querySelector("#guardar");
  const btCancelar = document.querySelector("#cancelar");

  const btExportar = document.querySelector("#exportar");

  alerta.classList.add('d-none');

  function renderData(){
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarDisciplinas");

    fetch("../controller/disciplina.controller.php",{
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
            <td>
              <a href='#' class='editar btn btn-success btn-sm' data-iddisciplina='${element[0]}'>
              <i class="bi bi-pencil-fill"></i>
              </a>  
              <a href='#' class='eliminar btn btn-danger btn-sm' data-iddisciplina='${element[0]}'>
              <i class="bi bi-x-square-fill"></i>
              </a>  
            </td> 
          </tr>
          `;
          tabla.innerHTML += fila;
        })
      })
      .catch(erro=>{
        alertaError();
      })
  }

  function nuevaDisciplina(){
    if(confirm("¿Desea guardar los datos?")){
      const parametros = new FormData();
      parametros.append("operacion", "registrarDisciplina");
      parametros.append("nombreDisciplina", txtNombre.value);

      fetch("../controller/disciplina.controller.php",{
        method: 'POST',
        body: parametros
      })
        .then(response => response.json())
        .then(datos => {
          if(datos.status){
            reset();
            txtNombre.focus();
          }else{
            alert(datos.message);
          }
        })
    }
  }

  function reset(){
    btGuardar.innerText = "Guardar";
    renderData();
    formulario.reset();
    formulario.classList.remove('was-validated');
  }

  function editarDisciplina() {
    if (confirm("¿Está seguro de actualizar?")) {
      const parametros = new URLSearchParams();
      parametros.append("operacion", "editarDisciplina");
      parametros.append("iddisciplina", iddisciplina);
      parametros.append("nombreDisciplina", txtNombre.value);

      fetch("../controller/disciplina.controller.php", {
        method: 'POST',
        body: parametros
      })
        .then(response => response.json())
        .then(datos => {
          if (datos.status) {
            renderData();
          } else {
            alert(datos.message);
          }
        });
    }
    iddisciplina = 0;
    
  } 

  function validar(event){
    if (!formulario.checkValidity()){
      event.preventDefault();
      event.stopPropagation();
      txtNombre.focus();
    }else{
      if (btGuardar.innerText === "Guardar") {
        nuevaDisciplina();
      } else if (btGuardar.innerText === "Actualizar") {
        editarDisciplina();
      }
    }
    formulario.classList.add('was-validated');
  }

  function alertaError(){
    tabla.innerHTML = '';
    alerta.classList.remove('d-none');
    alerta.classList.add('d-block');
    alerta.classList.add('alert-danger');
    alerta.innerHTML = "No hay datos por mostrar"; 
  }

  function generarPDF(){
      const parametros = new URLSearchParams();
      parametros.append("titulo", "Disciplinas");
      window.open(`../report/disciplina.reporte.php?${parametros}`, '_blank');
  }

  renderData();

  //Proceso de edicion
  tabla.addEventListener("click", (event) => {
    if (event.target.classList[0] === 'editar') {
      btGuardar.innerText = "Actualizar";
      iddisciplina = parseInt(event.target.dataset.iddisciplina);
      
      const parametros = new URLSearchParams();
      parametros.append("operacion", "obtenerDisciplina");
      parametros.append("iddisciplina", iddisciplina);

      fetch("../controller/disciplina.controller.php", {
        method: 'POST',
        body: parametros
      })
        .then(response => response.json())
        .then(datos => {
         txtNombre.value = datos.nombreDisciplina;
        });
    }
  });

  //Proceso de eliminación
  tabla.addEventListener("click", (event) => {
        if (event.target.classList[0] === 'eliminar') {
          if (confirm("¿Está seguro de eliminar el registro?")) {
            iddisciplina = parseInt(event.target.dataset.iddisciplina);
            
            const parametros = new URLSearchParams();
            parametros.append("operacion", "eliminarDisciplina");
            parametros.append("iddisciplina", iddisciplina);

            fetch("../controller/disciplina.controller.php", {
              method: 'POST',
              body: parametros
            })
              .then(response => response.json())
              .then(datos => {
                if (datos.status) {
                  renderData();
                } else {
                  alert(datos.message);
                }
              })
              .catch(erro =>{
                alert("No hay datos");
               });
          }
          iddisciplina = 0;
        }
  });

  btGuardar.addEventListener("click", validar);

  btCancelar.addEventListener("click",reset);

  btExportar.addEventListener("click", generarPDF);

  });
</script>
</body>
</html>