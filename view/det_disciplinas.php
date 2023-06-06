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
    <h1>selecion de Disciplinas por año</h1>
    <hr>
  </div>
  <form action="" autocomplete="off" id="formulario-registro" class="form-control needs-validation" novalidate>
    <div class="row">
      <div class="form-floating">
        <select name="fecha" id="fecha" class="form-select" required>
          <option value="">Seleccione</option>
        </select>
        <label for="fecha">Fecha</label>
        <div class="invalid-feedback">Complete este campo</div>
      </div>
    </div>
    <div class="row mt-3">
        <div class="col-md-6"> 
            <label class="form-control mb-2">Disciplinas</label>
            <select name="disciplinas" id="disciplinas" size="10" class="form-control">
            </select>
        </div>
  
        <div class="col-md-6">
            <label class="form-control mb-2">Disciplinas seleccionadas</label>
            <select name="agregar" id="agregar" size="10" class="form-control" required>
            </select>
            <div class="invalid-feedback">Complete este campo</div>
        </div> <!-- Fin col-md-12 -->
        <div class="row">
          <div class="col-md-12">
          <div class="d-grid gap-2 mt-4">
            <button class="btn btn-outline-secondary" type="reset" id="cancelar">Cancelar</button>
            <button class="btn btn-warning" type="button" id="guardar">Guardar</button>
          </div>
          </div>
        </div>
    </div>
  </form>
</div>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>
    document.addEventListener("DOMContentLoaded", () =>{
      const listFecha = document.querySelector("#fecha");
      const listDisciplinas = document.querySelector("#disciplinas");
      const filtro = document.querySelector("#agregar");
      const btGuardar = document.querySelector("#guardar");
      const formulario = document.querySelector("#formulario-registro");
      const btCancelar = document.querySelector("#cancelar");

      const opcionesArray = [];
      
      function listarSelect(operacion = "", objectSelect, ruta){
          const parametros = new URLSearchParams();
              parametros.append("operacion", operacion);
              fetch(ruta,{
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

      function moverDisciplinas(select) {
        opcionesArray.forEach(option => {
          select.appendChild(option);
        });
      }

      function add() {
        if (listDisciplinas.value) {
          const opcion = listDisciplinas.options[listDisciplinas.selectedIndex];
          filtro.appendChild(opcion);
          
        }
      }

      function remove() {
        if (filtro.value) {
          const opcion = filtro.options[filtro.selectedIndex];
          listDisciplinas.appendChild(opcion);
         
        }
      }

      function registrar(){
        const options = Array.from(filtro.options);
        options.forEach(element =>{
          const valor = element.value;
          
          const parametros = new FormData();
          parametros.append("operacion", "registrar");
          parametros.append("idolimpiada", parseInt(listFecha.value));
          parametros.append("iddisciplina", valor);

          fetch("../controller/detdisciplina.controller.php",{
            method: 'POST',
            body: parametros
          })
        })
        reset();
        
      }
      
      function reset(){
        filtro.innerHTML= '';
        listDisciplinas.innerHTML='';
        listarSelect("listarDisciplinas", listDisciplinas, '../controller/disciplina.controller.php');
        formulario.reset();
        formulario.classList.remove('was-validated');
      }

      function validar(event){
        if (!formulario.checkValidity()){
          event.preventDefault();
          event.stopPropagation();
        }else{
          registrar();
        }
        formulario.classList.add('was-validated');
      }
      
      listarSelect("listar", listFecha , '../controller/olimpiada.controller.php');
      listarSelect("listarDisciplinas", listDisciplinas, '../controller/disciplina.controller.php');


      listDisciplinas.addEventListener("click", add);
      filtro.addEventListener("click", remove);
      btGuardar.addEventListener("click", validar)
      btCancelar.addEventListener("click", reset)
    });
</script>
</body>
</html>