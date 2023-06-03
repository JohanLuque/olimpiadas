<?php

require_once 'Conexion.php';

class Integrante extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function grafica(){
      try{
        $consulta = $this->conexion->prepare("CALL spu_integrantes_fecha_grafico()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
    }
}