<?php
session_start(); 

require_once '../model/Persona.php';

if(isset($_POST['operacion'])){
  $persona = new Persona();


  if($_POST['operacion'] == 'iniciarSesion'){

    $acceso = [
        "login"         => false,
        "apellidos"     =>"",
        "nombres"       =>"",
        "mensaje"       =>""
    ];

    $data = $persona->iniciarSesion($_POST['correo']);
    $claveIngresada = $_POST['clave'];
    
    if($data){
        if(password_verify($claveIngresada, $data['clave'])){
            //Registrar datos de acceso
            $acceso["login"] = true;
            $acceso["apellidos"] = $data["apellidos"];
            $acceso["nombres"] = $data["nombres"];
        }else{
            $acceso["mensaje"] = "Contraseña incorrecta";
        }
    }else{
        $acceso["mensaje"] = "No existe el usuario";
    }

    $_SESSION['seguridad'] = $acceso;
    //$_SESSION['inicio'] = date('c');
    echo json_encode($acceso);
    }

}

if (isset($_GET['operacion'])) {
    if ($_GET['operacion'] == 'destroy') {
      session_destroy();
      session_unset();
      header('Location:../index.php');
    }
  }