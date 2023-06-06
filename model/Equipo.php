<?php

require_once 'Conexion.php';

class Equipo extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

  public function listar(){
    try{
        $consulta = $this->conexion->prepare("CALL spu_listar_equipos()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}