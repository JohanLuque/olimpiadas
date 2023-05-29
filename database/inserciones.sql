USE olimpiadas; 

INSERT INTO delegaciones (nombreDelegacion) VALUES 
	 ('Chachapoyas'),
	 ('Huaraz'),
	 ('Abancay'),
	 ('Arequipa'),
	 ('Sucre'),
	 ('Cajamarca'),
	 ('Callao'),
	 ('Cuzco'),
	 ('Huancavelica'),
	 ('Huánuco'),
	 ('Chincha'),
	 ('Chupaca'),
	 ('Trujillo'),
	 ('Chiclayo'),
	 ('Lima'),
	 ('Ucayali'),
	 ('Manu'),
	 ('Llo'),
	 ('Pasco'),
	 ('Piura'),
	 ('Puno'),
	 ('Tocache'),
	 ('Tacna'),
	 ('Tumbres'),
	 ('Atalaya');
INSERT INTO disciplinas (nombreDisciplina) VALUES	
('Futbol'),
('Volley'),
('Skeleton'),
('Atletismo'),
('Baloncesto'),
('Béisbol'),
('BMX'),
('Lucha'),
('Natacion');


INSERT INTO personas (apellidos, nombres, dni, correo, clave) VALUES
('Luque', 'Johan','71789712', 'luquejohan194@gmail.com', '12345'),
('Quispe', 'Piero','11111112', 'quispe36@gmail.com', '12345'),
('Polo', 'Andy','11111113', 'polo24@gmail.com', '12345'),
('Urruti', 'Luis','11111114', 'urruti11@gmail.com', '12345'),
('Carvallo', 'Aurelio', '11111115', 'carvallo1@gmail.com', '12345'),
('Corzo', 'Aldo','11111116', 'corzo29@gmail.com', '12345'),
('Riveros', 'Wilian','11111117', 'riveros3@gmail.com', '12345'),
('Di benedetto', 'Mathias','11111118', 'mathias4@gmail.com', '12345'),
('Cabanillas', 'Nelson','11111119', 'cabanillas27@gmail.com', '12345'),
('Calcaterra', 'Horacio','11111120', 'calcaterra10@gmail.com', '12345'),
('Perez', 'Matin','11111121', 'martin16@gmail.com', '12345'),
('Ureña', 'Rodrigo','11111122', 'rodrigo18@gmail.com', '12345'),
('Valera', 'Alex','11111123', 'valera20@gmail.com', '12345'),
('Herrera', 'Emanuel', '21111148', 'herrera15@gmail.com', '12345');

UPDATE personas SET clave= '$2y$10$9ccFmEeHI6RDM3g51IA33OyOfRS7wh5QOBlErkyCPOCvn1YPrPSRK';


INSERT INTO olimpiadas (fechainicio,nombre, lugar) VALUES
('2023-05-29','Copa Perú', 'Lima'),
('2022-05-29', 'Olimpiadas juveniles', 'Pisco'),
('2021-05-29', 'Juegos olimpicos', 'Ica'),
('2020-05-29', 'Amigos del barrio', 'Chincha'),
('2019-05-29', 'Juegos provinciales', 'Loreto');

INSERT INTO det_disciplinas (idolimpiada, iddisciplina) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2),
(5, 3),
(2, 1),
(3, 2),
(5, 1),
(1, 3);


INSERT INTO integrantes (iddelegacion, idparticipante, iddet) VALUES
(25,12,1),
(11,11,9),
(11, 10,8),
(22, 8,7),
(2, 7,7);

SELECT * FROM integrantes

-- insert into medalleros values
-- (1)

