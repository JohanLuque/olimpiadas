<?php
require_once 'Conexion.php';

Class Medallero extends Conexion{
    private $conexion;

    // Contructor
    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarMedalleros($datos=[]){
      try {
          $consulta = $this->conexion->prepare(" CALL spu_lista_medallero(?,?,?)");
          $consulta->execute(array(
            $datos['iddisciplina'],
            $datos['idolimpiada'],
            $datos['estado']
          ));
          return $consulta->fetchAll(PDO::FETCH_ASSOC);
        } catch(Exception $e) {
          die($e->getMessage());
        }
    }
    public function premiarMedallero($datos=[]){
      try {
        $consulta = $this->conexion->prepare("CALL spu_premiar_medallero(?,?)");
        $consulta->execute(array(
          $datos['idmedallero'],
          $datos['puesto']
        ));
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
      } catch(Exception $e) {
        die($e->getMessage());
      }
    }
}