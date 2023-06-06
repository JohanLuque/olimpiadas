<?php
require_once '../model/Det_disciplina.php';

if (isset($_POST['operacion'])){
    $detDisciplina = new Det_disciplina();

    if ($_POST['operacion'] == 'registrar'){
        $filtos = [
            "idolimpiada" => $_POST["idolimpiada"],
            "iddisciplina" => $_POST["iddisciplina"]
        ];
        $datos = $detDisciplina->registrar($filtos);
        if($datos){
            echo json_encode($datos);
        }
    }

}