<?php
require_once '../model/Medallero.php';

if (isset($_POST['operacion'])){
    $medallero = new Medallero();

    if ($_POST['operacion'] == 'listarMedalleros'){
        $filtos = [
            "iddisciplina" => $_POST["iddisciplina"],
            "idolimpiada" => $_POST["idolimpiada"]
        ];
        $datos = $medallero->listarMedalleros($filtos);
        if($datos){
            echo json_encode($datos);
        }
    }
}