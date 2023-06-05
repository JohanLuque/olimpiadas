<?php
require_once '../model/Olimpiada.php';

if (isset($_POST['operacion'])){
    $olimpiada = new Olimpiada();

    if ($_POST['operacion'] == 'RegistrarOlimpiada'){
        $filtos = [
            "nombre" => $_POST["nombre"],
            "fechainicio" => $_POST["fechainicio"],
            "fechafin" => $_POST["fechafin"],
            "lugar" => $_POST["lugar"]
        ];
        $datos = $olimpiada->registrarOlimpiadas($filtos);
        if($datos){
            echo json_encode($datos);
        }
    }
    if ($_POST['operacion'] == 'listar'){
        $datos = $olimpiada->listar();
        if($datos){
            echo json_encode($datos);
        }
    }
}