<?php

require_once 'Conexion.php';

class Usuario extends Conexion{

    private $acceso;

    public function __CONSTRUCT(){
        $this->acceso = parent::getConexion();
    }

    public function iniciarSesion($correo = ""){
        try{
            $consulta = $this->acceso->prepare("CALL spu_login_corre(?)");
            $consulta->execute(array($correo));

            return $consulta->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}