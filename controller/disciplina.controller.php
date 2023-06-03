<?php
require_once '../model/Disciplina.php';

if (isset($_POST['operacion'])){
    $disciplina = new Disciplina();

    if ($_POST['operacion'] == 'listarDisciplinas'){
        $datos = $disciplina->listarDisciplinas();
        if($datos){
            echo json_encode($datos);
        }
    }
    if($_POST['operacion'] == 'registrarDisciplina'){
        $respuesta = $disciplina->registrarDisciplina($_POST['nombreDisciplina']);
        echo json_encode($respuesta);
    }
    

    if ($_POST['operacion'] == 'obtenerDisciplina') {
        $respuesta = $disciplina->obtener($_POST['iddisciplina']);
        echo json_encode($respuesta);
    }

    if ($_POST['operacion'] == 'editarDisciplina') {
        $datos = [
            "iddisciplina"      => $_POST["iddisciplina"],
            "nombreDisciplina"  => $_POST["nombreDisciplina"]
        ];
        
        $respuesta = $disciplina->editarDisciplina($datos);
        echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'eliminarDisciplina'){
        $respuesta = $disciplina->eliminarDisciplina($_POST['iddisciplina']);
        echo json_encode($respuesta);
    }
}