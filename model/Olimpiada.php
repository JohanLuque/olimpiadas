<?php

require_once 'Conexion.php';

class Olimpiada extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarOlimpiadasFechas(){
    try{
        $consulta = $this->conexion->prepare("CALL spu_listar_olimpiadas()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}