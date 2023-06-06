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

    public function registrar($datos=[]) {
      try {
        $consulta = $this->conexion->prepare("CALL spu_registrar_integrantes(?,?)");
        $consulta->execute(array(
          $datos['idequipo'],
          $datos['iddet']
        )); 
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
      } catch(Exception $e) {
        die($e->getMessage());
      }
    } 

    public function obtenerIDDet($datos=[]) {
      try {
        $consulta = $this->conexion->prepare("SELECT * FROM det_disciplinas WHERE idolimpiada= ? AND iddisciplina = ?");
        $consulta->execute(array(
          $datos['idolimpiada'],
          $datos['iddisciplina']
        )); 
        return $consulta->fetch(PDO::FETCH_ASSOC);
      } catch(Exception $e) {
        die($e->getMessage());
      }
    }
}