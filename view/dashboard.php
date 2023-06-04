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
  <title>Dashboard</title>
  <!-- Bootstrap v5.2 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
  <div class="container">
    <div class="row mt-3">
      <ul class="nav nav-tabs justify-content-end">
        <li class="nav-item">
          <a class="nav-link active bg-warning" aria-current="page" href="./Dashboard.php">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-dark" href="./Medalleros.php">Premiaciones</a>
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
  </div> <!-- fin de container -->
  <div class="container">
  <div class="row mt-3">
      <div class="col-md-6">
        <!--Aqui renderizaremos un grafico-->
        <canvas id="graficoBarras"></canvas>
      </div>
      <div class="col-md-6">
        <!--Aqui renderizaremos un grafico-->
          <canvas id="graficoCirculo"></canvas>
      </div>
    </div>
  </div>

  <!-- Script de boostrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  
  <!-- Script de chart -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  
  <script>
    document.addEventListener("DOMContentLoaded", () =>{
      const barras = document.querySelector("#graficoBarras");
      const circulo = document.querySelector("#graficoCirculo");
      const olimpiada = document.querySelector("#leyenda-olimpiadas");
      const leyendaBarras = document.querySelector("#leyenda-olimpiadas");
      const colores=['#ff2d14', '#ff9f00', '#8fff0a', '#0ff5ff', '#d222ff'];

      const graficoIntegrantes = new Chart(circulo,{
        type: 'pie',
        data: {
          labels: [],
          datasets: [
            {
              backgroundColor: colores,
              label: 'Integrantes por año',
              data: []
            }
          ]
        }
      });

      const graficoDisciplinas = new Chart(barras,{
        type: 'line',
        data: {
          labels: [],
          datasets: [
            {
              backgroundColor: colores,
              label: ' total de disciplinas por año',
              data: []
            }
          ]
        }
      });


      function renderGraphic(coleccion = [],objectGrafic){
        let etiquetas = [];
        let datos = [];

        coleccion.forEach(element => {
          etiquetas.push(element[0]);
          datos.push(element[1]);
        });

        objectGrafic.data.labels = etiquetas;
        objectGrafic.data.datasets[0].data = datos;
        objectGrafic.update();
      }

      function loadData (operacion, objectGrafic){
        const parametros = new URLSearchParams();
        parametros.append("operacion", operacion);

        fetch('../controller/grafico.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(response => response.json())
          .then(lista => {
            renderGraphic(lista, objectGrafic);
          })
      }

    loadData("graficoIntegrantes", graficoIntegrantes);
    loadData("graficoDisciplinas", graficoDisciplinas);

    });
  </script>
</body>
</html>