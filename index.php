<?php
/* session_start();

//si el usuario ya tiene una sesion activa... Entonces NO DEBE ESTAR AQUI!!

if(isset($_SESSION['seguridad']) && $_SESSION['seguridad']['login']){
        header('Location:/view/dashboard.html');
} */
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <!-- Bootstrap v5.2 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  
</head>
<body>
  <div class="container mt-4">
    <div class="row">
      <div class="col-md-8 mt-4 bg-secondary text-center">
          <img src="./img/logo.png" alt="" class="" class="img-fluid img-thumbnail">
      </div>
      <div class="col-md-4 mt-4 ">
        <h3>Hola!!</h3>
        <h2>Good morning</h2>
        <h3 class="text-center mt-4 mb-5">
          inicia sesión con tu cuenta
        </h3>
        <div class="form-floating mb-3 mt-5">
          <input type="email" class="form-control" id="correo" autofocus maxlength="50">
          <label for="correo">Correo electronico</label>
        </div>
        <div class="form-floating">
          <input type="password" class="form-control" id="clave"  maxlength="50">
          <label for="clave">Contraseña</label>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="vercontra">
            <label class="form-check-label" for="vercontra">ver</label>
          </div>
        </div>
        <div class="d-grid gap-2 mt-4">
          <button class="btn btn-warning" type="button" id="acceder">Acceder</button>
        </div> 
      </div>
    </div>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", ()=>{
      const ver = document.querySelector("#vercontra");
      const clave = document.querySelector("#clave");
      const correo = document.querySelector("#correo");
      const btAcceder = document.querySelector("#acceder");

      function login(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "iniciarSesion");
        parametros.append("correo", correo.value);
        parametros.append("clave", clave.value);

        fetch("./controller/usuario.controller.php",{
          method:"POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            if(datos.login){
              alert(`Bienvenido: ${datos.apellidos} ${datos.nombres}`);
              window.location.href = `./view/dashboard.html`;
            }
            else{
              alert(datos.mensaje);
            }
          })
      }

      function visualizar (){
        if (this.checked) {
          clave.type = 'text';
        } else {
          clave.type = 'password';
        }
      }

      ver.addEventListener('change', visualizar);

      btAcceder.addEventListener('click', login);

      clave.addEventListener('keypress', function(e) {
        if (e.keyCode == 13){
          login();
        }
      });
    });
  </script>
</body>
</html>