USE olimpiadas

DELIMITER $$
CREATE PROCEDURE spu_login_corre
(
	IN _correo VARCHAR(50)
)
BEGIN 
	SELECT idusuario,personas.`apellidos` 'apellidos', personas.`nombres` 'nombres', personas.`correo` 'correo', usuario, clave
	FROM usuarios
	INNER JOIN personas ON personas.`idpersona` = usuarios.`idpersona`
	WHERE personas.`correo` = _correo; 
END $$

CALL spu_login_corre('luquejohan194@gmail.com');