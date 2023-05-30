<?php
require_once '../model/Olimpiada.php';
require_once '../model/Disciplina.php';
require_once '../model/Participante.php';

function renderJSON($object = []){
  if($object){
    echo json_encode($object);
  }
}

if(isset($_POST['operacion'])){
  switch($_POST['operacion']){
    case 'listarOlimpiadasFecha':
      $olimpiada = new Olimpiada();
      renderJSON($olimpiada->listarOlimpiadasFechas());
      break;
    case 'listarDisciplinas':
      $disciplina = new Disciplina();
      $filtro=[
        "idolimpiada" =>$_POST["idolimpiada"]
      ];
      renderJSON($disciplina->listarDisciplinas($filtro));
      break;
    case 'listarParticipantes':
      $participante = new Participante();
      renderJSON($participante->listarParticipantes());
      break;
  }
}