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
    
    public function grafica(){
      try{
        $consulta = $this->conexion->prepare("CALL spu_disciplinas_fecha_grafico()");
        $consulta->execute();
        return $consulta->fetchAll(PDO::FETCH_NUM);
      }catch(Exception $e){
        die($e->getMessage());
      }
    }

    public function registrar($datos = []){
      $respuesta = [
        "status"  => false,
        "message" => ""
      ];
      try{
        $consulta = $this->conexion->prepare("CALL spu_registar_Detdisciplina(?,?)");
        $respuesta["status"] = $consulta->execute(array(
          $datos["idolimpiada"],
          $datos["iddisciplina"]
        ));
      }catch(Exception $e){
        $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getCode();
        //$respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
      }
      return $respuesta;
    }
}