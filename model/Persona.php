<?php

require_once 'Conexion.php';

class Persona extends Conexion{

    private $conexion;

    public function __CONSTRUCT(){
        $this->conexion = parent::getConexion();
    }

    public function iniciarSesion($correo = ""){
        try{
            $consulta = $this->conexion->prepare("CALL spu_login_corre(?)");
            $consulta->execute(array($correo));

            return $consulta->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}