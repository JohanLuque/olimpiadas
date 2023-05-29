<?php
require_once '../model/Evento.php';

if (isset($_POST['operacion'])){
    $evento = new Evento();

    if ($_POST['operacion'] == 'listarEventos'){
        $datos = $evento->listarEventos();
        if($datos){
            echo json_encode($datos);
        }else{
            echo `No hay datos`;
        }
    }
}