<?php
require_once '../model/Detalle_Evento.php';

if (isset($_POST['operacion'])){
    $detEvento = new Det_evento();

    if ($_POST['operacion'] == 'listarParticipantes'){
        $datos = $detEvento->listarParticipantes();
        if($datos){
            echo json_encode($datos);
        }else{
            echo `No hay datos`;
        }
    }
}