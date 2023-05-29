<?php
require_once 'Conexion.php';

Class Evento extends Conexion{
    private $conexion;

    // Contructor
    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function listarEventos(){
        try {
            $consulta = $this->conexion->prepare("CALL spu_eventos_listar()");
            $consulta->execute();
            return $consulta->fetchAll(PDO::FETCH_ASSOC);
          } catch(Exception $e) {
            die($e->getMessage());
          }
    }
}