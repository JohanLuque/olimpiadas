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

SELECT * FROM eventos WHERE idevento = 1


SELECT
    e.idevento,
    e.nombreEvento,
    s.idsede,
    e.fecharealizada,
    d.nombreDisciplina,
    CONCAT(p_oro.apellidos, ' ', p_oro.nombres) AS nombreOro,
    CONCAT(p_plata.apellidos, ' ', p_plata.nombres) AS nombrePlata,
    CONCAT(p_bronce.apellidos, ' ', p_bronce.nombres) AS nombreBronce
FROM eventos e
INNER JOIN sedes s ON e.idsede = s.idsede
INNER JOIN disciplinas d ON e.iddisciplina = d.iddisciplina
INNER JOIN participantes par_oro ON e.oro = par_oro.idparticipante
INNER JOIN personas p_oro ON par_oro.idpersona = p_oro.idpersona
INNER JOIN participantes par_plata ON e.plata = par_plata.idparticipante
INNER JOIN personas p_plata ON par_plata.idpersona = p_plata.idpersona
INNER JOIN participantes par_bronce ON e.bronce = par_bronce.idparticipante
INNER JOIN personas p_bronce ON par_bronce.idpersona = p_bronce.idpersona;