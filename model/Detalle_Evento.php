<?php

require_once 'Conexion.php';

class Det_evento extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarParticipantes($id){
    try{
        $consulta = $this->conexion->prepare("CALL spu_ver_detEvento(?)");
        $consulta->execute(array($id));
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}