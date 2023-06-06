<?php
require_once '../model/Integrante.php';

if (isset($_POST['operacion'])){
    $integrante = new Integrante();

    if($_POST['operacion'] == 'registrar'){
        $filtros=[
            'idequipo'  =>$_POST['idequipo'],
            'iddet'     =>$_POST['iddet'],
        ];
        $respuesta = $integrante->registrar($filtros);
        echo json_encode($respuesta);
    }
    if($_POST['operacion'] == 'obtenerID'){
        $filtros=[
            'idolimpiada'  =>$_POST['idolimpiada'],
            'iddisciplina'     =>$_POST['iddisciplina'],
        ];
        $respuesta = $integrante->obtenerIDDet($filtros);
        echo json_encode($respuesta);
    }
    
}