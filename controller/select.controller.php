<?php
require_once '../model/Sedes.php';
require_once '../model/Disciplina.php';
require_once '../model/Participante.php';

function renderJSON($object = []){
  if($object){
    echo json_encode($object);
  }
}

if(isset($_POST['operacion'])){
  switch($_POST['operacion']){
    case 'listarSedes':
      $sedes = new Sedes();
      renderJSON($sedes->listarSedes());
      break;
    case 'listarDisciplinas':
      $disciplinas = new Disciplina();
      renderJSON($disciplinas->listarDisciplinas());
      break;
    case 'listarParticipantes':
      $participantes = new Participante();
      renderJSON($participantes->listarParticipantes());
      break;
  }
}