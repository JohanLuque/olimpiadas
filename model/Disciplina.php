<?php

require_once 'Conexion.php';

class Disciplina extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarDisciplinas(){
    try{
        $consulta = $this->conexion->prepare("CALL spu_disciplinas_listar()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}