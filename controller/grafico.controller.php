<?php
require_once '../model/Integrante.php';
require_once '../model/Det_disciplina.php';

function renderJSON($object = []){
  if($object){
    echo json_encode($object);
  }
}

if(isset($_POST['operacion'])){
  switch($_POST['operacion']){
    case 'graficoIntegrantes':
      $integrante = new Integrante();
      renderJSON($integrante->grafica());
      break;
    case 'graficoDisciplinas':
      $det_disciplina = new Det_disciplina();
      renderJSON($det_disciplina->grafica());
      break;
  }
}