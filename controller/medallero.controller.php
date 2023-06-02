<?php
require_once '../model/Medallero.php';

if (isset($_POST['operacion'])){
    $medallero = new Medallero();

    if ($_POST['operacion'] == 'listarMedalleros'){
        $filtos = [
            "iddisciplina" => $_POST["iddisciplina"],
            "idolimpiada" => $_POST["idolimpiada"],
            "estado" => $_POST["estado"]
        ];
        $datos = $medallero->listarMedalleros($filtos);
        if($datos){
            echo json_encode($datos);
        }
    }
    if($_POST['operacion'] == 'premiarMedallero'){
        $datos = [
            "idmedallero"       =>$_POST['idmedallero'],
            "puesto"            =>$_POST['puesto']
        ];
        $medallero->premiarMedallero($datos);
    }
}