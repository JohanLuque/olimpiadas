<?php

require_once 'Conexion.php';

class Participante extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarParticipantes(){
    try{
        $consulta = $this->conexion->prepare("CALL spu_participantes_listar()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}