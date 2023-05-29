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
        <li class="nav-item">
          <a class="nav-link text-dark" href="#">sedes</a>
        </li>
        <div class="btn-group" role="group">
          <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <?php
                    if (isset($_SESSION['seguridad']) && $_SESSION['seguridad']['login']) {
                      $texto = "Usuario: ";
                      echo '<span class="ms-1 d-none d-sm-inline">' . $texto .$_SESSION['seguridad']['usuario'] . '</span>';
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
                <a class="btn btn-warning" href="#" aria-current="page">Nuevo</a>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <div class="row row-cols-2 row-cols-sm-3 g-2 mt-3" id="cards">
            <!-- Contenedor de cards -->

        </div>
    </div>
</div>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
  document.addEventListener("DOMContentLoaded", () =>{
    const contenido = document.querySelector("#cards");

    function listarEventos() {
    const parametros = new URLSearchParams();
    parametros.append("operacion", "listarEventos");

    fetch("../controller/evento.controller.php", {
      method: 'POST',
      body: parametros
    })
      .then(response => response.json())
      .then(datos => {
        console.log(datos)
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
                <p class="card-text"><small class="text-muted">Sede: ${element.nombreSede}</small></p>
                <p class="card-text text-center"><small class="text-muted">${element.fecharealizada}</small></p>
                <a href="#" class="btn btn-secondary">Ver participantes</a>
              </div>
            </div>
          </div>
          `;
          contenido.innerHTML += card;
        });
      })
    }

    listarEventos();
  });
</script>
</body>
</html>