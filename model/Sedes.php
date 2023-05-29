<?php

require_once 'Conexion.php';

class Sedes extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarSedes(){
    try{
        $consulta = $this->conexion->prepare("CALL spu_sedes_listar()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}