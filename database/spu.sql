USE olimpiadas;

DELIMITER $$
CREATE PROCEDURE spu_login_corre
(
	IN _correo VARCHAR(50)
)
BEGIN 
	SELECT idpersona,apellidos,nombres, correo, clave
	FROM personas
	WHERE correo = _correo; 
END $$

DELIMITER $$
CREATE PROCEDURE spu_lista_medallero
(
IN _iddisciplina INT ,
IN _idolimpiada INT, 
IN _estado CHAR(1)
)
BEGIN
		SELECT idmedallero, CONCAT (personas.`apellidos`, ' ', personas.`nombres`) AS nommbreCompleto,
		disciplinas.`nombreDisciplina`, delegaciones.`nombreDelegacion` AS equipo,
		puesto, 
		YEAR(olimpiadas.`fechainicio`) AS fecha,
		olimpiadas.`lugar` AS lugar
		FROM medalleros
		INNER JOIN integrantes ON integrantes.idintegrante = medalleros.idintegrante
		INNER JOIN equipos ON equipos.`idequipo`  = integrantes.`idintegrante`
		INNER JOIN personas ON personas.idpersona = equipos.idparticipante
		INNER JOIN delegaciones ON delegaciones.iddelegacion = equipos.iddelegacion
		INNER JOIN det_disciplinas ON det_disciplinas.`iddet` =  integrantes.`iddet`
		INNER JOIN olimpiadas ON olimpiadas.`idolimpiada` = det_disciplinas.`idolimpiada`
		INNER JOIN disciplinas ON disciplinas.`iddisciplina` =  det_disciplinas.`iddisciplina`
		WHERE disciplinas.`iddisciplina` = _iddisciplina AND olimpiadas.`idolimpiada` = _idolimpiada
		AND medalleros.estado = _estado
		-- GROUP BY disciplinas.`nombreDisciplina`
		ORDER BY puesto;
END $$

DELIMITER $$
CREATE PROCEDURE spu_listar_disciplinas
(
IN _idolimpiada INT
)
BEGIN
	SELECT iddet, disciplinas.`nombreDisciplina`
	FROM det_disciplinas
	INNER JOIN  disciplinas ON disciplinas.`iddisciplina` = det_disciplinas.`iddisciplina`
	INNER JOIN olimpiadas ON olimpiadas.`idolimpiada` = det_disciplinas.`idolimpiada`
	WHERE olimpiadas.`idolimpiada` = _idolimpiada;
END $$


DELIMITER $$
CREATE PROCEDURE spu_listar_olimpiadas()
BEGIN
	SELECT idolimpiada, YEAR(fechainicio),CONCAT(nombre, ' - ', YEAR(fechainicio)) AS modal FROM olimpiadas
	ORDER BY fechainicio DESC;
END $$

DELIMITER $$
CREATE PROCEDURE spu_registrar_medallero
(
	IN _idparticipante INT,
	IN _puesto		TINYINT
)
BEGIN
	INSERT INTO medalleros (idparticipante, puesto) VALUES 
	(_idparticipante, _puesto);
END$$


DELIMITER $$
CREATE PROCEDURE spu_premiar_medallero
(
IN _idmedallero INT,
IN _puesto TINYINT 
)
BEGIN 
	UPDATE medalleros SET
		puesto  = _puesto,
		estado = '1'
	WHERE idmedallero = _idmedallero;
END $$



