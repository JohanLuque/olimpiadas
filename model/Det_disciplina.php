<?php

require_once 'Conexion.php';

class Det_disciplina extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarDet_disciplinas($id){
    try{
        $consulta = $this->conexion->prepare("CALL spu_listar_detDisciplinas(?)");
        $consulta->execute(array(
          $id['idolimpiada']
        ));
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}