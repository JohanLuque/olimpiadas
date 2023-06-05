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

  public function registrarOlimpiadas($datos = []) {
    $respuesta = [
      "status"  => false,
      "message" => ""
    ];
    try {
      $consulta = $this->conexion->prepare("CALL spu_registrar_olimpiadas(?,?,?,?)");
      $respuesta["status"] = $consulta->execute(array(
        $datos["nombre"],
        $datos["fechainicio"],
        $datos["fechafin"],
        $datos["lugar"]
      ));
    } catch(Exception $e) {
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getCode();
      //die($e->getMessage());
    }

    return $respuesta;
  }

  public function listar(){
    try{
        $consulta = $this->conexion->prepare("SELECT * FROM olimpiadas");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }
}