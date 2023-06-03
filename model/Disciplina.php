<?php

require_once 'Conexion.php';

class Disciplina extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

  public function listarDisciplinas(){
    try{
        $consulta = $this->conexion->prepare("CALL spu_listar_disciplinas()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarDisciplina($dato) {
    $respuesta = [
      "status"  => false,
      "message" => ""
    ];
    try {
      $consulta = $this->conexion->prepare("CALL spu_registrar_disciplina(?)");
      $respuesta["status"] = $consulta->execute(array($dato));
    } catch(Exception $e) {
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getCode();
      //die($e->getMessage());
    }

    return $respuesta;
  }

  public function obtener($iddisciplina = 0){
    try {
      $consulta = $this->conexion->prepare("CALL spu_obtener_disciplinas(?)");
      $consulta->execute(array($iddisciplina));
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch(Exception $e) {
      die($e->getMessage());
    }
  }

  public function editarDisciplina($datos = []) {
    $respuesta = [
      "status"  => false,
      "message" => ""
    ];
    try {
      $consulta = $this->conexion->prepare("CALL spu_editar_disciplinas(?,?)");
      $respuesta["status"] = $consulta->execute(array(
        $datos["iddisciplina"],
        $datos["nombreDisciplina"]
      ));
    } catch(Exception $e) {
      //$respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getCode();
      die($e->getMessage());
    }
    
    return $respuesta;
  }

  public function eliminarDisciplina($iddisciplina = 0) {
    $respuesta = [
      "status"  => false,
      "message" => ""
    ];
    try {
      $consulta = $this->conexion->prepare("CALL spu_eliminar_disciplinas(?)");
      $respuesta["status"] = $consulta->execute(array($iddisciplina));
    } catch(Exception $e) {
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getCode();
    }
    
    return $respuesta;
  }
}