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
IN _idolimpiada INT
)
BEGIN
		SELECT idmedallero, CONCAT (personas.`apellidos`, ' ', personas.`nombres`) AS nommbreCompleto,
		disciplinas.`nombreDisciplina`, delegaciones.`nombreDelegacion`,
		puesto,
		YEAR(olimpiadas.`fechainicio`) AS fecha,
		olimpiadas.`lugar` AS lugar
		FROM medalleros
		INNER JOIN integrantes ON integrantes.idintegrante = medalleros.idintegrante
		INNER JOIN personas ON personas.idpersona = integrantes.idparticipante
		INNER JOIN delegaciones ON delegaciones.iddelegacion = integrantes.iddelegacion
		INNER JOIN det_disciplinas ON det_disciplinas.`iddet` =  integrantes.`iddet`
		INNER JOIN olimpiadas ON olimpiadas.`idolimpiada` = det_disciplinas.`idolimpiada`
		INNER JOIN disciplinas ON disciplinas.`iddisciplina` =  det_disciplinas.`iddisciplina`
		WHERE disciplinas.`iddisciplina` = _iddisciplina AND olimpiadas.`idolimpiada` = _idolimpiada
		GROUP BY disciplinas.`nombreDisciplina`, puesto
		ORDER BY puesto;
END $$
CALL SPU_lista_medallero(2,1);

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

CALL spu_listar_disciplinas(2)

DELIMITER $$
CREATE PROCEDURE spu_listar_olimpiadas()
BEGIN
	SELECT idolimpiada, YEAR(fechainicio) FROM olimpiadas
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

CALL spu_registrar_medallero();


SELECT * FROM integrantes


