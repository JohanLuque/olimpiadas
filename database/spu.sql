USE olimpiadas;

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

-- CALL spu_login_corre('luquejohan194@gmail.com');

DELIMITER $$
CREATE PROCEDURE spu_eventos_listar()
BEGIN
	SELECT e.idevento, e.nombreEvento, 
		s.`nombreSede` 'nombreSede', e.fecharealizada, d.`nombreDisciplina`,
		(SELECT CONCAT (nombres, ' ',apellidos)FROM personas WHERE idpersona = e.oro) AS Oro,
		(SELECT CONCAT (nombres, ' ',apellidos)FROM personas WHERE idpersona = e.plata) AS Plata,
		(SELECT CONCAT (nombres, ' ',apellidos)FROM personas WHERE idpersona = e.bronce) AS Bronce
		FROM eventos e
	INNER JOIN sedes  s ON s.`idsede` = e.`idsede`
	INNER JOIN disciplinas d ON d.iddisciplina = e.`iddisciplina`
	-- inner join participantes p on p.idparticipante = e.oro
	ORDER BY fecharealizada DESC;
END $$

DELIMITER $$
CREATE PROCEDURE spu_sedes_listar()
BEGIN
	SELECT idsede, nombreSede 
	FROM sedes
	ORDER BY idsede;
END $$

DELIMITER $$
CREATE PROCEDURE spu_disciplinas_listar()
BEGIN
	SELECT iddisciplina, nombreDisciplina
	FROM disciplinas
	ORDER BY iddisciplina;
END $$

DELIMITER $$
CREATE PROCEDURE spu_participantes_listar()
BEGIN
	SELECT idparticipante, concat(personas.`apellidos`, ' ' ,personas.`nombres`) as nombrecompleto
	FROM participantes
	inner join personas on personas.`idpersona` = participantes.`idpersona`
	ORDER BY personas.`apellidos`;
END $$s

delimiter $$ 
create procedure spu_registrar_evento
(
	in _nombreEvento			VARCHAR(50),
	in _idsede					INT, 
	in _fecharealizada 		CHAR(4),
	in _iddisciplina			INT,
	in _oro 					INT, 
	in _plata 					INT, 
	in _bronce 				INT 
)
begin 
	insert into eventos (nombreEvento, idsede, fecharealizada, iddisciplina, oro, plata, bronce) values
	(_nombreEvento, _idsede, _fecharealizada, _iddisciplina, _oro, _plata, _bronce);
end $$

-- call spu_registrar_evento( 'Copa Peru 2023', 2, '2023', 6, 11,12,10);

delimiter $$
create procedure spu_ver_detEvento
(
	in _id int
)
begin 
	select idparticipante, (SELECT CONCAT (nombres, ' ',apellidos) FROM personas WHERE idpersona = dt.idparticipante) AS participante
		from det_eventos dt
		where idevento = _id
		order by idparticipante;
end $$
