<?php

require_once 'Conexion.php';

class Disciplina extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarDisciplinas($id){
    try{
        $consulta = $this->conexion->prepare("CALL spu_listar_disciplinas(?)");
        $consulta->execute(array(
          $id['idolimpiada']
        ));
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}