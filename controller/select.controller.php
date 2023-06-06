<?php
require_once '../model/Olimpiada.php';
require_once '../model/Det_disciplina.php';
require_once '../model/Equipo.php';

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
    case 'listarDetDisciplinas':
      $det_disciplina = new Det_disciplina();
      $filtro=[
        "idolimpiada" =>$_POST["idolimpiada"]
      ];
      renderJSON($det_disciplina->listarDet_disciplinas($filtro));
      break;
    case 'listarEquipos' :
      $equipo = new Equipo();
      renderJSON($equipo->listar());
      break;
  }
}