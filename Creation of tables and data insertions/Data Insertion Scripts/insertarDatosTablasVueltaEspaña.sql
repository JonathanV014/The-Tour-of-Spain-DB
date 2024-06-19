-- Insertar datos en la tabla Paises (TERMINADO 2023)
INSERT INTO Paises (nombre) VALUES
    ('Alemania'), -- 1
    ('Australia'), -- 2
    ('Bélgica'), -- 3
    ('Nueva Zelanda'), -- 4
    ('Austria'), -- 5
    ('Francia'), -- 6
    ('Polonia'), -- 7
    ('Luxemburgo'), -- 8
    ('España'), -- 9
	('Italia'), -- 10
	('Estados Unidos'), -- 11
	('Kazajistán'), -- 12
	('Colombia'), --13
	('Eslovenia'), --14
	('Paises Bajos'), --15
	('Rusia'), --16
	('Portugal'), --17
	('Reino Unido'), --18
	('Brunéi'), --19
	('Andorra'); --20

-- Insertar datos en la tabla Ciudades (TERMINADO 2023)
INSERT INTO Ciudades (nombre, idPais) VALUES
	--Ciudades Capitales
	('Berlin', 1), -- 1
	('Canberra', 2),--2
	('Bruselas', 3),--3
	('Wellington', 4),--4
	('Viena', 5),--5
	('Paris', 6),--6
	('Varsovia', 7),--7
	('Luxemburgo', 8),--8
	('Madrid', 9),--9
	('Roma', 10),--10
	('Washington DC', 11),--11
	('Nursultan', 12), --12
	('Bogotá', 13),--13
	('Liubliana', 14),--14
	('Amsterdan', 15),--15
	('Moscú', 16),--16
	('Lisboa', 17),--17
	('Londres', 18),--18
	('Bandar Seri Begawan', 19),--19
	('Andorra la Vieja', 20),--20
	
	--Ciudades no capitales de recorridos
	('Barcelona', 9), --21
	('Mataró', 9), --22
	('Súria', 9), --23
	('Andorra La Vella', 20), --24
	('Morella', 9), --25
	('Vall Duixó', 9), -- 26  
	('Utiel', 9), -- 27  
	('Dénia', 9), -- 28  
	('Cartagena', 9), -- 29  
	('Valladolid', 9), -- 30 
	('Lerma', 9), -- 31   
	('Ólvega', 9), -- 32   
	('Formigal', 9), -- 33    
	('Sauveterre de Bearn', 6), -- 34
	('Pamplona', 9), -- 35  
	('Liencres Playa', 9), -- 36  
	('Ribadesella', 9), -- 37  
	('Pola de Allande', 9), -- 38  
	('La Bañeza', 9), -- 39    
	('Manzanares El Real', 9), --40    
	('Hipódromo Zarzuela', 9), -- 41  
	('Arinsal', 20), -- 42    
	('Tarragona', 9), -- 43   
	('Burriana', 9), --44   
	('Javalambre', 9), -- 45  
	('Oliva', 9), -- 46   
	('Xorret', 9), -- 47   
	('Caravaca de la Cruz', 9), -- 48   
	('Laguna Negra-Vinuesa', 9), -- 49   
	('Zaragoza', 9), -- 50 
	('Tourmalet', 6), -- 51   
	('Larra Belagua', 9), -- 52 
	('Lekunberri', 9), -- 53 
	('Bejes', 9), -- 54
    ('Angliru', 9), -- 55
    ('La Cruz de Linares', 9), -- 56
    ('Íscar', 9), -- 57
    ('Guadarrama', 9); -- 58
	
	
-- Actualizar la tabla Paises para establecer las capitales (TERMINADO 2023)
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 1) WHERE idPais = 1;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 2) WHERE idPais = 2;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 3) WHERE idPais = 3;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 4) WHERE idPais = 4;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 5) WHERE idPais = 5;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 6) WHERE idPais = 6;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 7) WHERE idPais = 7;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 8) WHERE idPais = 8;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 9) WHERE idPais = 9;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 10) WHERE idPais = 10;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 11) WHERE idPais = 11;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 12) WHERE idPais = 12;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 13) WHERE idPais = 13;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 14) WHERE idPais = 14;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 15) WHERE idPais = 15;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 16) WHERE idPais = 16;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 17) WHERE idPais = 17;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 18) WHERE idPais = 18;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 19) WHERE idPais = 19;
UPDATE Paises SET idCiudadCapital = (SELECT idCiudad FROM Ciudades WHERE idCiudad = 20) WHERE idPais = 20;


-- Insertar tipos de patrocinadores (TERMINADO 2023)
INSERT INTO TiposPatrocinadores (nombre, descripcion) 
VALUES
    ('Principal', 'Compañias y marcas que proporcionan los recursos de la edición'),
    ('Oficial', 'Compañias y marcas que proporcionan los recursos de la edición'),
    ('Medios oficiales', 'Canales que transmiten la competición'),
	('Equipos', 'Compañias y marcas que proporcionan los recursos de los equipos');


-- Insertar patrocinadores (TERMINADO 2023)
INSERT INTO Patrocinadores (nombre, descripcion, idTipoPatrocinador) 
VALUES
    ('Movistar', 'Es una empresa de telecomunicaciones', 4),
    ('Caisse d''Epargne', 'French bank', 4),
    ('Astana', 'Kazakhstani cycling team', 1),
    ('Azucar Manuelita', 'Beverage company', 2),
    ('Red Bull', 'Energy drink company', 2),
    ('Decathlon', 'Sports equipment retailer', 3),
    ('Volkswagen', 'Automobile manufacturer', 3),
    ('Microsoft', 'Technology company', 1),
    ('McDonalds', 'Fast food restaurant chain', 4),
    ('Puma', 'Sportswear and equipment manufacturer', 4),
    ('Amazon', 'E-commerce company', 4);

-- Insertar equipos (TERMINADO 2023)
INSERT INTO Equipos (nombre, descripcion, idPais) 
VALUES
    ('Alpecin-Deceuninck', 'Equipo belga de ciclismo profesional', 3), --1
    ('Team Arkea - Samsic', 'Equipo francés de ciclismo profesional', 6), --2
    ('Astana Qazaqstan Team', 'Equipo kazajo de ciclismo profesional', 12), --3
    ('Bahrain Victorious', 'Equipo de ciclismo profesional de Bahréin', 19), --4
    ('Bora - Hansgrohe', 'Equipo alemán de ciclismo profesional', 1), --5
    ('Cofidis', 'Equipo francés de ciclismo profesional', 6), --6
    ('Movistar Team', 'Equipo español de ciclismo profesional', 9), --7
    ('Groupama-FDJ', 'Equipo francés de ciclismo profesional', 6); --8

-- Insertar relaciones entre patrocinadores y equipos (TERMINADO 2023)
INSERT INTO PatrocinadoresPorEquipos (idEquipo, idPatrocinador) 
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
	(1, 6),
    (2, 7),
    (3, 8),
    (4, 1),
    (5, 2);


-- Insertar nombres de directores y ciclistas (TERMINADO 2023) 
INSERT INTO Personas (idPaisNacimiento, primerNombre, segundoNombre, primerApellido, 
					  segundoApellido, fechaDeNacimiento) VALUES
	-- Directores Generales
	(1, 'Miguel', 'Angel', 'López', 'García', '1975-01-15'), --1
	(2, 'Juan', 'Carlos', 'Martínez', 'Fernández', '1970-03-22'), --2
	(3, 'Pedro', 'Luis', 'Gómez', 'Sánchez', '1965-06-10'), --3
	(4, 'Carlos', 'Alberto', 'Rodríguez', 'Díaz', '1978-11-30'), --4
	(5, 'Luis', 'Miguel', 'Hernández', 'Pérez', '1980-08-19'), --5
	(6, 'Francisco', 'José', 'Martín', 'Ruiz', '1968-04-02'), --6
	(7, 'José', 'Antonio', 'González', 'Molina', '1972-07-15'), --7
	(8, 'Raúl', 'Manuel', 'Ramírez', 'Santos', '1977-12-25'), --8
 
	-- Directores Deportivos
	(1, 'Ángel', 'Luis', 'Mendoza', 'Vega', '1966-03-11'), --9
	(2, 'Oscar', 'Iván', 'Ortega', 'Jiménez', '1971-11-25'), --10
	(3, 'Manuel', 'Francisco', 'Soler', 'Paredes', '1968-07-23'), --11
	(4, 'Ramón', 'Eduardo', 'Rivera', 'Fuentes', '1970-05-12'), --12
	(5, 'Ricardo', 'Esteban', 'Cabrera', 'Peña', '1973-04-09'), --13
	(6, 'Antonio', 'Joaquín', 'Suárez', 'Méndez', '1965-01-30'), --14
	(7, 'Pablo', 'Gabriel', 'Romero', 'Silva', '1972-10-22'), --15
	(8, 'Ignacio', 'Fabián', 'Herrera', 'Giménez', '1978-02-17'), --16

	-- Ciclistas
	(1, 'Maurice', '', 'Ballerstedt', '', '2001-01-16'), --17
	(2, 'Kaden', '', 'Groves', '', '1998-12-23'), --18
	(3, 'Jimmy', '', 'Janssens', '', '1989-05-30'), --19
	(1, 'Jason', '', 'Osborne', '', '1994-03-20'), --20
	(3, 'Edward', '', 'Planckarert', '', '1995-02-01'), --21
	(3, 'Robbe', '', 'Ghys', '', '1997-01-11'), --22
	(4, 'Samuel', '', 'Gaze', '', '1995-12-12'), --23
	(5, 'Tobias', '', 'Bayer', '', '1999-11-17'), --24

	(6, 'Kevin', '', 'Vauquelin', '', '2001-04-26'), --25
	(6, 'Elie', '', 'Gesbert', '', '1995-07-01'), --26
	(6, 'Hugo', '', 'Hofstetter', '', '1994-02-13'), --27
	(6, 'Mathis', '', 'Le Berre', '', '2001-04-16'), --28
	(6, 'Kevin', '', 'Ledanois', '', '1993-07-13'), --29
	(7, 'Lucas', '', 'Owsian', '', '1990-02-24'), --30
	(8, 'Michel', '', 'Ries', '', '1998-03-11'), --31
	(9, 'Cristian', 'Rodriguez', 'Martin', '', '1995-03-03'), --32

	(10, 'Samuele', '', 'Battistella', '', '1998-11-14'), --33
	(9, 'David', 'De La', 'Cruz', '', '1989-05-06'), --34
	(9, 'Luis', 'Leon', 'Sanchez', '', '1983-11-24'), --35
	(9, 'Javier', 'Romo', 'Oliver', '', '1999-01-06'), --36
	(11, 'Joseph', 'Lloyd', 'Dombrowski', '', '1991-05-12'), --37
	(12, 'Vadim', '', 'Pronskiy', '', '1998-06-04'), --38
	(10, 'Fabio', '', 'Fellline', '', '1990-03-29'), --39
	(12, 'Andrey', '', 'Zeits', '', '1986-12-12'), --40

	(13, 'Santiago', 'Buitrago', 'Sanchez', '', '1999-09-26'), --41
	(10, 'Damiano', '', 'Caruso', '', '1987-10-12'), --42
	(14, 'Matevz', '', 'Govekar', '', '2000-04-17'), --43
	(7, 'Kamil', '', 'Gradek', '', '1990-09-17'), --44
	(9, 'Mikel', '', 'Landa', '', '1989-12-13'), --45
	(15, 'Wout', '', 'Poels', '', '1987-10-01'), --46
	(1, 'Jashs', '', 'Sutterlin', '', '1992-11-01'), --47
	(10, 'Antonio', '', 'Tiberi', '', '2001-06-24'), --48

	(16, 'Aleksamdr', '', 'Vlasov', '', '1996-04-23'), --49
	(1, 'Nico', '', 'Denz', '', '1994-02-15'), --50
	(1, 'Emanuel', '', 'Buchmann', '', '1992-11-18'), --51
	(13, 'Sergion', 'Andres', 'Higuita', 'Garcia', '1997-08-01'), --52
	(1, 'Lennard', '', 'Kamna', '', '1996-09-09'), --53
	(1, 'Jonas', '', 'Koch', '', '1993-06-25'), --54
	(3, 'Cian', '', 'Uijtdebroeks', '', '2003-02-28'), --55
	(1, 'Ben', '', 'Zwiehoff', '', '1994-02-22'), --56

	(9, 'Jesus', '', 'Herrada', '', '1990-07-26'), --57
	(10, 'Davide', '', 'Cimolai', '', '1989-08-13'), --58
	(6, 'Francois', '', 'Bidard', '', '1992-03-19'), --59
	(17, 'Andre', '', 'Carvalho', '', '1997-10-31'), --60
	(6, 'Bryan', '', 'Coquard', '', '1992-04-25'), --61
	(9, 'Ruben', '', 'Fernandez', '', '1991-03-01'), --62
	(9, 'Jose', '', 'Herrada', '', '1985-10-01'), --63
	(6, 'Remy', '', 'Rochas', '', '1996-05-18'), --64

	(9, 'Enric', '', 'Mas', '', '1995-01-07'), --65
	(9, 'Joge', '', 'Arcas', '', '1992-07-08'), --66
	(17, 'Ruben', '', 'Guerreiro', '', '1994-07-06'), --67
	(9, 'Imanol', '', 'Erviti', '', '1983-11-15'), --68
	(9, 'Ivan', 'Garcia', 'Cortina', '', '1995-11-20'), --69
	(9, 'Oier', 'Lazkano', 'Lopez', '', '1999-11-07'), --70
	(17, 'Nelson', '', 'Oliveira', '', '1989-03-06'), --71
	(13, 'Einer', 'Augusto', 'Rubio', 'Reyez', '1998-02-22'), --72

	(6, 'Rudy', '', 'Molard', '', '1989-09-17'), --73
	(6, 'Lenny', '', 'Martinez', '', '2003-07-11'), --74
	(18, 'Lewis', '', 'Askey', '', '2001-05-04'), --75
	(6, 'Clement', '', 'Davy', '', '1998-07-17'), --76
	(10, 'Lorenzo', '', 'Germani', '', '2002-03-03'), --77
	(6, 'Romain', '', 'Gregoire', '', '2003-01-21'), --78
	(2, 'Michael', '', 'Storer', '', '1997-02-28'), --79
	(18, 'Samuel', '', 'Watson', '', '2001-09-24'); --80

-- Insertar directores generales (TERMINADO 2023)
DO $$
BEGIN
    FOR i IN 1..8 LOOP
        EXECUTE format('INSERT INTO DirectoresGenerales (idPersona) VALUES (%s)', i);
    END LOOP;
END $$;

-- Insertar directores deportivos (TERMINADO 2023)
DO $$
BEGIN
    FOR i IN 9..16 LOOP
        EXECUTE format('INSERT INTO DirectoresDeportivos (idPersona) VALUES (%s)', i);
    END LOOP;
END $$;

-- Insertar ciclistas (TERMINADO 2023)
DO $$
BEGIN
    FOR i IN 17..80 LOOP
        EXECUTE format('INSERT INTO Ciclistas (idPersona) VALUES (%s)', i);
    END LOOP;
END $$;


-- Insertar ediciones (TERMINADO)
INSERT INTO Ediciones (fechaInicio, fechaFinalizacion) 
VALUES
 	('2023-08-26', '2023-09-18'), --1
    ('2024-08-24', '2024-09-15'); --2

-- Para la Edición 1 (2023)
INSERT INTO ParticipacionesEquiposPorEdicion (idEdicion, idEquipo, idDirectorGeneral, idDirectorDeportivo) VALUES
	(1, 1, 1, 9),
	(1, 2, 2, 10),
	(1, 3, 3, 11),
	(1, 4, 4, 12),
	(1, 5, 5, 13),
	(1, 6, 6, 14),
	(1, 7, 7, 15),
	(1, 8, 8, 16);

-- Para la Edición 2 (2024)
INSERT INTO ParticipacionesEquiposPorEdicion (idEdicion, idEquipo, idDirectorGeneral, idDirectorDeportivo) VALUES
  	(2, 1, 8, 16), --Edición 2 
	(2, 2, 2, 10),
	(2, 3, 3, 11),
	(2, 4, 4, 12),
	(2, 5, 5, 13),
	(2, 6, 6, 14),
	(2, 7, 7, 15),
	(2, 8, 1, 9);
	
-- Insertar participaciones por edición(TERMINADO 2023)
INSERT INTO ParticipacionesCiclistasPorEdicion (idCiclista, idEdicion, idEquipo, dorsal) 
VALUES
	--2023
    (17, 1, 1, 82), --1 --Alpecin-Deceuninck
    (18, 1, 1, 81), --2
    (19, 1, 1, 86), --3
    (20, 1, 1, 87), --4
    (21, 1, 1, 88), --5
    (22, 1, 1, 85), --6
	(23, 1, 1, 84), --7
	(24, 1, 1, 83), --8
    --c  c   c  nc 
	(25, 1, 2, 171), --9 Team Arkea - Samsic
    (26, 1, 2, 172), --10
    (27, 1, 2, 173), --11
    (28, 1, 2, 174), --12
    (29, 1, 2, 175), --13
    (30, 1, 2, 176), --14
	(31, 1, 2, 177), --15
	(32, 1, 2, 178), --16
	
	(33, 1, 3, 191), --17 Astana Qazaqstan Team
    (34, 1, 3, 192), --18
    (35, 1, 3, 193), --19
    (36, 1, 3, 194), --20
    (37, 1, 3, 195), --21
    (38, 1, 3, 196), --22
	(39, 1, 3, 197), --23
	(40, 1, 3, 198), --24
	
	(41, 1, 4, 41), --25 Bahrain Victorius
    (42, 1, 4, 42), --26
    (43, 1, 4, 43), --27
    (44, 1, 4, 44), --28
    (45, 1, 4, 45), --29
    (46, 1, 4, 46), --30
	(47, 1, 4, 47), --31
	(48, 1, 4, 48), --32

	(49, 1, 5, 71), --33 Bora - Hansgrohe
    (50, 1, 5, 72), --34
    (51, 1, 5, 73), --35
    (52, 1, 5, 74), --36
    (53, 1, 5, 75), --37
    (54, 1, 5, 76), --38
	(55, 1, 5, 77), --39
	(56, 1, 5, 78), --40
	
	(57, 1, 6, 151), --41 Cofidis
    (58, 1, 6, 152), --42
    (59, 1, 6, 153), --43
    (60, 1, 6, 154), --44
    (61, 1, 6, 155), --45
    (62, 1, 6, 156), --46
	(63, 1, 6, 157), --47
	(64, 1, 6, 158), --48
	
	(65, 1, 7, 141), --49 Movistar Team
    (66, 1, 7, 142), --50
    (67, 1, 7, 143), --51
    (68, 1, 7, 144), --52
    (69, 1, 7, 145), --53
    (70, 1, 7, 146), --54
	(71, 1, 7, 147), --55
	(72, 1, 7, 148), --56
	
	(73, 1, 8, 61), --57 Groupama-fdj
    (74, 1, 8, 62), --58
    (75, 1, 8, 63), --59
    (76, 1, 8, 64), --60
	(77, 1, 8, 65), --61
	(78, 1, 8, 66), --62
	(79, 1, 8, 67), --63
	(80, 1, 8, 68); --64

-- Insertar participaciones por edición (2024)
INSERT INTO ParticipacionesCiclistasPorEdicion (idCiclista, idEdicion, idEquipo, dorsal)
VALUES
    --2024
	(17, 2, 1, 200), --65 --Alpecin-Deceuninck
    (18, 2, 1, 201), --66
    (19, 2, 1, 202), --67
    (20, 2, 1, 203), --68
    (21, 2, 1, 204), --69
    (22, 2, 1, 205), --70
	(23, 2, 1, 206), --71
	(24, 2, 1, 207), --72
	
	--c  c   c  nc 
	(25, 2, 2, 208), --73 Team Arkea - Samsic
    (26, 2, 2, 209), --74
    (27, 2, 2, 210), --75
    (28, 2, 2, 211), --76
    (29, 2, 2, 212), --77
    (30, 2, 2, 213), --78
	(31, 2, 2, 214), --79
	(32, 2, 2, 215), --80
	
	(33, 2, 3, 191), --81 Astana Qazaqstan Team
    (34, 2, 3, 192), --82
    (35, 2, 3, 193), --83
    (36, 2, 3, 194), --84
    (37, 2, 3, 195), --85
    (38, 2, 3, 196), --86
	(39, 2, 3, 197), --87
	(40, 2, 3, 198), --88
	
	(41, 2, 4, 41), --89 Bahrain Victorius
    (42, 2, 4, 42), --90
    (43, 2, 4, 43), --91
    (44, 2, 4, 44), --92
    (45, 2, 4, 45), --93
    (46, 2, 4, 46), --94
	(47, 2, 4, 47), --95
	(48, 2, 4, 48), --96
	
	(49, 2, 5, 71), --97 Bora - Hansgrohe
    (50, 2, 5, 72), --98
    (51, 2, 5, 73), --99
    (52, 2, 5, 74), --100
    (53, 2, 5, 75), --101
    (54, 2, 5, 76), --102
	(55, 2, 5, 77), --103
	(56, 2, 5, 78), --104

	(57, 2, 6, 151), --105 Cofidis
    (58, 2, 6, 152), --106
    (59, 2, 6, 153), --107
    (60, 2, 6, 154), --108
    (61, 2, 6, 155), --109
    (62, 2, 6, 156), --110
	(63, 2, 6, 157), --111
	(64, 2, 6, 158), --112
	
	(65, 2, 7, 141), --113 Movistar Team
    (66, 2, 7, 142), --114
    (67, 2, 7, 143), --115
    (68, 2, 7, 144), --116
    (69, 2, 7, 145), --117
    (70, 2, 7, 146), --118
	(71, 2, 7, 147), --119
	(72, 2, 7, 148), --120
	
	(73, 2, 8, 61), --121 Groupama-fdj
    (74, 2, 8, 62), --122
    (75, 2, 8, 63), --123
    (76, 2, 8, 64), --124
	(77, 2, 8, 65), --125
	(78, 2, 8, 66), --126
	(79, 2, 8, 67), --127
	(80, 2, 8, 68); --128


-- Insertar dificultades de etapas(TERMINADO)
INSERT INTO DificultadesEtapas (nombre, descripcion) 
VALUES
    ('Fácil', 'Etapas con perfil mayormente llano'), --1
    ('Moderada', 'Etapas con algunas subidas y descensos'), --2
    ('Difícil', 'Etapas con puertos de montaña y terrenos escarpados'), --3
    ('Extrema', 'Etapas con terrenos muy difíciles y puertos de alta montaña'); --4

-- Insertar tipos de etapas(TERMINADO)
INSERT INTO TiposDeEtapas (nombre, descripcion) 
VALUES
    ('Llana', 'Etapas con terreno mayormente plano'), --1
	('Media Montaña', 'Etapas con terreno mayormente plano'), --2
    ('Montaña', 'Etapas con puertos de montaña y terreno escarpado'), --3
    ('Contra Reloj Individual', 'Etapas contra el reloj, donde los ciclistas compiten individualmente contra el tiempo'), --4
    ('Onduladas', 'Etapas con combinación de terrenos variados'), --5
	('Contra Reloj Por Equipos', 'Etapas con combinación de terrenos variados'); --6


-- Insertar etapas (TERMINADO 2023)
INSERT INTO Etapas (idEdicion, idCiudadSalida, idCiudadLlegada, idDificultad, idTipoEtapa, numeroEtapa, fechaRealizacion, alturaMaxima, distancia) 
VALUES
    -- Etapas para idEdicion 2023
    (1, 21, 21, 1, 6, 1, '2023-08-26', 30.00, 14.60),
    (1, 22, 21, 2, 5, 2, '2023-08-27', 870.00, 181.30),
    (1, 23, 42, 4, 3, 3, '2023-08-28', 1980.00, 158.50),
    (1, 24, 43, 2, 5, 4, '2023-08-29', 798.00, 183.40),
    (1, 25, 44, 2, 5, 5, '2023-08-30', 932.00, 185.70),
    (1, 26, 45, 4, 3, 6, '2023-08-31', 1956.00, 181.30),
    (1, 27, 46, 1, 1, 7, '2023-09-01', 718.00, 188.80),
    (1, 28, 47, 4, 3, 8, '2023-09-02', 1098.00, 164.80),
    (1, 29, 48, 4, 3, 9, '2023-09-03', 1089.00, 180.90),
    (1, 30, 30, 1, 4, 10, '2023-09-05', 754.00, 25.00),
    (1, 31, 49, 3, 2, 11, '2023-09-06', 1730.00, 163.20),
    (1, 32, 50, 1, 1, 12, '2023-09-07', 984.00, 165.40),
    (1, 33, 51, 4, 3, 13, '2023-09-08', 2115.00, 134.70),
    (1, 34, 52, 4, 3, 14, '2023-09-09', 1587.00, 161.70),
    (1, 35, 53, 3, 2, 15, '2023-09-10', 1031.00, 156.50),
    (1, 36, 54, 3, 2, 16, '2023-09-12', 529.00, 119.70),
    (1, 37, 55, 4, 3, 17, '2023-09-13', 1558.00,  124.4),
    (1, 38, 56, 4, 3, 18, '2023-09-14', 1347.00, 178.90),
    (1, 39, 57, 1, 1, 19, '2023-09-15', 778.00, 177.40),
    (1, 40, 58, 3, 2, 20, '2023-09-16', 1409.00, 208.40),
    (1, 41, 9, 1, 1, 21, '2023-09-17', 651.00, 101.40);

-- Insertar etapas (TERMINADO 2024)
INSERT INTO Etapas (idEdicion, idCiudadSalida, idCiudadLlegada, idDificultad, idTipoEtapa, numeroEtapa, fechaRealizacion, alturaMaxima, distancia) 
VALUES
    -- Etapas para idEdicion 2024
    (2, 42, 22, 2, 5, 1, '2024-08-24', 820.00, 167.80),
    (2, 43, 23, 3, 3, 2, '2024-08-25', 1975.00, 145.60),
    (2, 44, 24, 1, 1, 3, '2024-08-26', 716.00, 180.30),
    (2, 45, 25, 3, 2, 4, '2024-08-27', 1630.00, 155.40),
    (2, 46, 26, 4, 3, 5, '2024-08-28', 2050.00, 173.70),
    (2, 47, 27, 1, 1, 6, '2024-08-29', 734.00, 168.30),
    (2, 48, 28, 4, 3, 7, '2024-08-30', 1140.00, 142.80), -- Día de descanso
    (2, 49, 29, 3, 2, 8, '2024-09-01', 1500.00, 190.90),
    (2, 50, 30, 1, 1, 9, '2024-09-02', 810.00, 165.00),
    (2, 51, 31, 4, 3, 10, '2024-09-03', 1880.00, 158.20),
    (2, 52, 32, 2, 5, 11, '2024-09-04', 750.00, 194.40),
    (2, 53, 33, 3, 2, 12, '2024-09-05', 1675.00, 151.70),
    (2, 54, 34, 4, 3, 13, '2024-09-06', 2135.00, 137.70),
    (2, 55, 35, 1, 1, 14, '2024-09-08', 790.00, 175.50),
    (2, 56, 36, 4, 3, 15, '2024-09-09', 1320.00, 168.90),
    (2, 57, 37, 2, 5, 16, '2024-09-10', 680.00, 199.60),
    (2, 58, 38, 3, 2, 17, '2024-09-11', 1550.00, 144.80),
    (2, 9, 39, 4, 3, 18, '2024-09-12', 1980.00, 159.20),
    (2, 10, 40, 1, 1, 19, '2024-09-13', 850.00, 170.40),
    (2, 11, 41, 3, 2, 20, '2024-09-14', 1650.00, 175.40),
    (2, 22, 42, 1, 1, 21, '2024-09-15', 720.00, 181.40);


-- Insertar tipos de metas parciales (TERMINADO)
INSERT INTO TiposDeMetasParciales(nombre) 
VALUES
    ('Montaña categoria 1'), --1
	('Montaña categoria 2'), --2
	('Montaña categoria 3'), --3
    ('Sprint'); --4

--Insertar datos de PatrocinadoresPorEdiciones 2023 (TERMINADO)
INSERT INTO PatrocinadoresPorEdiciones(idEdicion, idPatrocinador) 
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (2, 3);
	
-- Insertar datos de PatrocinadoresPorEdiciones (2024)
INSERT INTO PatrocinadoresPorEdiciones(idEdicion, idPatrocinador) 
VALUES
    (2, 4), -- Asociación de Ciclismo Profesional
    (2, 5), -- Agencia de Viajes CicloTours
    (2, 6); -- Compañía de Bebidas Energéticas Xcelerate


-- Insertar tipos de accidentes (TERMINADO)
INSERT INTO TiposDeAccidentes (nombre) 
VALUES
    ('Caída'),
    ('Colisión'),
    ('Lesión muscular');


-- Insertar accidentes 2023(TERMINADO)
INSERT INTO Accidentes (idTipoAccidente, idCiclistaParticipacionPorEdicion, idEtapa, hora, descripcion) 
VALUES
    (1, 7, 8, '10:30:00', 'Caída en una curva'),
    (2, 9, 15, '14:45:00', 'Colisión con otro ciclista'),
	(3, 10, 15, '09:40:00', 'Ligamento cruzado');

-- Insertar accidentes (2024)
INSERT INTO Accidentes (idTipoAccidente, idCiclistaParticipacionPorEdicion, idEtapa, hora, descripcion) 
VALUES
    (1, 73, 7, '11:15:00', 'Caída en el descenso'),
    (2, 100, 13, '10:20:00', 'Colisión con un objeto en la carretera'),
    (3, 105, 18, '12:30:00', 'Calambre en el muslo'),
    (3, 116, 10, '08:55:00', 'Desmayo repentino durante la subida'),
    (2, 113, 20, '15:00:00', 'Avería en la cadena de la bicicleta');


-- Insertar metas parciales (TERMINADO 2023)
INSERT INTO MetasParciales (idTipoMetaParcial, idEtapa, nombre, altitud, kilometroFinal) 
VALUES
	(4, 2, 'Cornellia de Llobregat', 20, 163), --1
	(3, 2, 'Coll De Sant Bartomeu', 388, 7.6), --2
	(2, 2, 'Coll Destenalles', 870, 66.3), --3
	(3, 2, 'Catell de Montjuic', 163, 178.2), --4
	(4, 3, 'Andorra La Vella', 1003, 116.7), --5
	(1, 3, 'Coll D Ordino', 1980, 137.1), --6
	(1, 3, 'Arinsal-Andorra', 1914, 158.5), --7
	(3, 4, 'Alto de Beltal', 798, 130.8), --8
	(3, 4, 'Coll de Lilla', 580, 154), --9
	(4, 4, 'Vals', 225, 164), --10
	(2, 5, 'Collado de la Ibola', 793, 132.5), --11
	(4, 5, 'Nules', 12, 175.3),--12
	(3, 6, 'Puerto de Arrenillas', 900, 48.8),--13
	(3, 6, 'Alto Fuente de Rubielos', 1003, 83.1),--14
	(4, 6, 'Torrijas', 1340, 161.6),--15
	(1, 6, 'Observatorio Astrofisico Javalambre', 1956, 181.30),--16
	(4, 7, 'Cullera', 15, 166.8),--17
	(2, 8, 'Alto de Vall dEbo', 540, 28.8), --18
	(3, 8, 'Puerto de Tollos', 830, 49.4), --19
	(2, 8, 'Puerto de Benifallim', 1015, 81.7), --20
	(2, 8, 'Puerto de la Carrasqueta', 1020, 110.2), --21
	(4, 8, 'Ibi', 761, 124.5), --22
	(1, 8, 'Xorret de Catí', 1098, 161.7), --23
	(1, 9, 'Puerto Casas de la Marina la Perdiz', 855, 60.1), --24
	(4, 9, 'Cehegín', 534, 169.2), --25
	(4, 11, 'Vinuesa', 1105, 145), --26
	(4, 12, 'Villanueva de Gállego', 254, 131.9), --27
	(3, 13, 'Puerto de Portalet', 1794, 4.4), --28
	(2, 13, 'Col dAubisque', 1709, 48.7), --29
	(1, 13, 'Col de Spandelles', 1378, 82), --30
	(4, 13, 'Pierrefitte Nestalas', 477, 103.4), --31
	(2, 13, 'Col Du Tourmalet', 2115, 134.7), --32
	(2, 14, 'Col Hourcére', 1440, 65.2), --33
	(2, 14, 'Puerto de Larrau', 1579, 109), --34
	(3, 14, 'Puerto de Laza', 1119, 123.1), --35
	(4, 14, 'Uztárroz', 901, 130.2), --36
	(1, 14, 'Puerto de Belagua', 1587, 156.2), --37
	(3, 15, 'Puerto de Lizarraga', 1031, 79.8), --38
	(2, 15, 'Puerto de Zuarrarrate', 800, 120.3), --39
	(4, 15, 'Irurtzun', 460, 141.3), --40
	(2, 15, 'Puerto de Zuarrate', 800, 149.8), --41
	(4, 16, 'Unquera', 10, 93.3), --42
	(2, 16, 'Bejes', 529, 119.70), --43
	(1, 17, 'Alto de la Colladiella', 848, 75.8), --44
	(4, 17, 'Figareo', 237, 91.3), --45
	(1, 17, 'Alto del Cordal', 790, 103.3), --46
	(2, 17, 'Alto de L Angliru', 1558, 124.4), --47
	(2, 18, 'Alto de las Estacas', 742, 48.8), --48
	(1, 18, 'Puerto de San Lorenzo', 1347, 88.6), --49
	(3, 18, 'Alto de Tenebredo', 507, 121.2), --50
	(1, 18, 'Puerto La Cruz de Linares', 845, 153.9), --51
	(4, 18, 'Proaza', 190, 162.6), --52
	(1, 18, 'La Cruz de Linares', 845, 178.9), --53
	(4, 19, 'Mojados', 721, 157.8), --54
	(3, 20, 'Collado del Portazgo', 1295, 22), --55
	(3, 20, 'Puerto de la Cruz Verde', 1256, 43), --56
	(3, 20, 'La Escondida', 1268, 70.8), --57
	(3, 20, 'Alto de Santa Maria de la Alameda', 1317, 87), --58
	(3, 20, 'Alto de Robledondo', 1409, 94), --59
	(3, 20, 'La Encontrada', 1268, 124.2), --60
	(3, 20, 'Bajo de Santa Maria de la Alameda', 1317, 140.4), --61
	(3, 20, 'Bajo de Roblecuadra', 1409, 147.4), --62
	(3, 20, 'Estacion de la Cruz Roja', 1256, 181), --63
	(3, 20, 'Alto de San Lorenzo del Escorial', 1214, 195.6), --64
	(4, 21, 'Madrid Rios', 642, 54.7); --65


-- Insertar metas parciales del 2024 (Corrección)
INSERT INTO MetasParciales (idTipoMetaParcial, idEtapa, nombre, altitud, kilometroFinal) 
VALUES
    (4, 22, 'Puerto de la Cantera', 122, 100.0), --1
    (3, 23, 'Coll de Ribes', 816, 57.0), --2
    (4, 24, 'Puerto de la Creueta', 716, 30.0), --3 (Corrección)
    (3, 25, 'Coll de la Merolla', 800, 25.0), --4
    (1, 26, 'Coll de Bóixols', 975, 125.0), --5
    (3, 27, 'Coll de Beixalís', 734, 55.0), --6
    (4, 28, 'Puerto de la Gallina', 1140.00, 112.0), --7
    (3, 29, 'Puerto de la Bonaigua', 1500, 15.0), --8
    (4, 30, 'Coll de Jou', 810.00, 10.0), --9
    (3, 31, 'Puerto de la Gallina Pelada', 1470, 12.0), --10
    (3, 32, 'Coll de Sant Geroni', 750, 18.0), --11
    (4, 33, 'Puerto de Camprodon', 350, 10.0), --12
    (2, 34, 'Col dAubisque', 1709, 40.0), --13
    (4, 35, 'Uztárroz', 780, 120.0), --14
    (4, 36, 'Irurtzun', 460, 120.0), --15
    (4, 37, 'Unquera', 10, 93.3), --16
    (4, 38, 'Figareo', 237, 91.3), --17
    (1, 39, 'Puerto de San Lorenzo', 800, 75.8), --18
    (4, 40, 'Mojados', 721, 157.8), --19
    (3, 41, 'Collado del Portazgo', 800, 22.0), --20
    (4, 42, 'Madrid Rios', 642, 54.7); --21

-- Insertar tipos de clasificaciones (TERMINADO)
INSERT INTO TiposDeClasificaciones (nombre, descripcion) 
VALUES
    ('Montaña', 'Clasificación de montaña'), --1
    ('Puntos', 'Clasificación por puntos'), --2
    ('Joven', 'Clasificación de jóvenes'), --3
	('Combativo', 'Clasificación por puntos'), --4
	('Equipo', 'Clasificación por puntos'),--5
	('Individual', 'Clasificación por puntos');--6

-- Insertar tipos de abandonos
INSERT INTO TiposDeAbandonos (nombre, descripcion) 
VALUES
    ('Abanono por Lesión', 'Abandona durante la etapa'),
    ('No toma salida', 'No comienza la etapa');


--DESHABILITAR COMENTARIO PARA NO DEJAR PARTICIPAR A LOS CICLISTAS EN LAS ETAPAS 
-- Insertar abandonos
--INSERT INTO Abandonos (idCiclistaParticipacionPorEdicion, idTipoAbandono, idEtapa) 
--VALUES
--    (1, 1, 1),
--    (65, 1, 2);


-- Insertar puestos
INSERT INTO Puestos (idTipoClasificacion, idCiclistaParticipacionPorEdicion, idEtapa, puesto) 
VALUES

	--Puestos para la clasificacion de tipo Montaña
		--No hubo puestos de montaña etapa 1
		--Etapa 2 
			(1, 42, 2, 2), --17 Astana Qazaqstan Team
			(1, 17, 2, 1), --57 Groupama-fdj
			(1, 57, 2, 3),
			
	--Puestos para la clasificacion de tipo Puntos

		--No hubo puestos Puntos Generales en etapa 1 2023
		--Etapa 2 2023 

			(2, 1, 2, 6), --1 --Alpecin-Deceuninck
			(2, 2, 2, 1), --2
			(2, 17, 2, 2), --17 Astana Qazaqstan Team	
			(2, 41, 2, 5), --41 Cofidis
			(2, 49, 2, 3), --49 Movistar Team
			(2, 57, 2, 4), --57 Groupama-fdj
			
	--Puestos para la clasificacion de tipo Jovenes
	
		--No hubo clasificacion joven etapa 1 2023
		--Etapa 2 2023
			(3, 1, 2, 1), --1 --Alpecin-Deceuninck
			(3, 2, 2, 4),
			(3, 3, 2, 19),
			(3, 9, 2, 5), --9 Team Arkea - Samsic
			(3, 10, 2, 16),
			(3, 11, 2, 17),
			(3, 17, 2, 3), --17 Astana Qazaqstan Team
			(3, 19, 2, 6),
			(3, 20, 2, 11),
			(3, 25, 2, 9), --25 Bahrain Victorius
			(3, 26, 2, 13),
			(3, 27, 2, 21),
			(3, 33, 2, 12), --33 Bora - Hansgrohe
			(3, 49, 2, 10), --49 Movistar Team
			(3, 50, 2, 14),
			(3, 57, 2, 2), --57 Groupama-fdj
			(3, 58, 2, 7),
			(3, 59, 2, 8),
			(3, 60, 2, 15),
			(3, 61, 2, 18),
			(3, 62, 2, 20),
			
	--Puestos para la clasificacion de tipo Combativo
	
		--No hubo clasificacion de tipo combativo en la vuelta etapa1 2023
		--Etapa 2
			(4, 17, 2, 1), --Astana
		
	--Puestos para la clasificacion de tipo Grupos
		--Etapa 1 2023
			
			(5, 1, 1, 7), --1 --Alpecin-Deceuninck
			(5, 9, 1, 8), --9 Team Arkea - Samsic
			(5, 17, 1, 4), --17 Astana Qazaqstan Team
			(5, 25, 1, 3), --25 Bahrain Victorius
			(5, 33, 1, 6), --33 Bora - Hansgrohe
			(5, 41, 1, 5), --41 Cofidis
			(5, 49, 1, 1), --49 Movistar Team
			(5, 57, 1, 2), --57 Groupama-fdj
		--Etapa 2 2023
			(5, 1, 2, 2), --1 --Alpecin-Deceuninck
			(5, 9, 2, 6), --9 Team Arkea - Samsic
			(5, 17, 2, 1), --17 Astana Qazaqstan Team
			(5, 25, 2, 8), --25 Bahrain Victorius
			(5, 33, 2, 5), --33 Bora - Hansgrohe
			(5, 41, 2, 7), --41 Cofidis
			(5, 49, 2, 4), --49 Movistar Team
			(5, 57, 2, 3), --57 Groupama-fdj
			
	--Puestos para la clasificacion de tipo Individual
		--No hubo para etapa 1 2023
		--Etapa 2 2023
		(6, 1, 2, 25), --1 --Alpecin-Deceuninck
		(6, 2, 2, 2), --2
		(6, 3, 2, 3), --3
		(6, 4, 2, 4), --4
		(6, 5, 2, 5), --5
		(6, 6, 2, 6), --6
		(6, 7, 2, 60), --7
		(6, 8, 2, 59), --8

		(6, 9, 2, 17), --9 Team Arkea - Samsic
		(6, 10, 2, 18), --10
		(6, 11, 2, 19), --11
		(6, 12, 2, 20), --12
		(6, 13, 2, 21), --13
		(6, 14, 2, 22), --14
		(6, 15, 2, 23), --15
		(6, 16, 2, 24), --16

		(6, 17, 2, 7), --17 Astana Qazaqstan Team
		(6, 18, 2, 1), --18
		(6, 19, 2, 26), --19
		(6, 20, 2, 27), --20
		(6, 21, 2, 28), --21
		(6, 22, 2, 29), --22
		(6, 23, 2, 30), --23
		(6, 24, 2, 31), --24

		(6, 25, 2, 32), --25 Bahrain Victorius
		(6, 26, 2, 33), --26
		(6, 27, 2, 34), --27
		(6, 28, 2, 35), --28
		(6, 29, 2, 36), --29
		(6, 30, 2, 57), --30
		(6, 31, 2, 63), --31
		(6, 32, 2, 64), --32 a

		(6, 33, 2, 37), --33 Bora - Hansgrohe
		(6, 34, 2, 38), --34
		(6, 35, 2, 39), --35
		(6, 36, 2, 40), --36
		(6, 37, 2, 41), --37
		(6, 38, 2, 42), --38
		(6, 39, 2, 43), --39
		(6, 40, 2, 44), --40

		(6, 41, 2, 45), --41 Cofidis
		(6, 42, 2, 46), --42
		(6, 43, 2, 47), --43
		(6, 44, 2, 48), --44
		(6, 45, 2, 49), --45
		(6, 46, 2, 56), --46
		(6, 47, 2, 50), --47
		(6, 48, 2, 62), --48

		(6, 49, 2, 51), --49 Movistar Team
		(6, 50, 2, 52), --50
		(6, 51, 2, 53), --51
		(6, 52, 2, 54), --52
		(6, 53, 2, 55), --53
		(6, 54, 2, 8), --54
		(6, 55, 2, 9), --55
		(6, 56, 2, 10), --56

		(6, 57, 2, 11), --57 Groupama-fdj
		(6, 58, 2, 12), --58
		(6, 58, 2, 13), --59
		(6, 60, 2, 14), --60
		(6, 61, 2, 15), --61
		(6, 62, 2, 16), --62
		(6, 63, 2, 58), --63
		(6, 64, 2, 61); --64

-- 2024
-- Insertar puestos
INSERT INTO Puestos (idTipoClasificacion, idCiclistaParticipacionPorEdicion, idEtapa, puesto) 
VALUES

	--Puestos para la clasificacion de tipo Montaña
		--No hubo puestos de montaña etapa 1
		--Etapa 2 
			(1, 106, 23, 2), --17 Astana Qazaqstan Team
			(1, 81, 23, 1), --57 Groupama-fdj
			(1, 121, 23, 3),
			
	--Puestos para la clasificacion de tipo Puntos

		--No hubo puestos Puntos Generales en etapa 1 2023
		--Etapa 2 2023 

			(2, 65, 23, 6), --1 --Alpecin-Deceuninck
			(2, 66, 23, 1), --2
			(2, 81, 23, 2), --17 Astana Qazaqstan Team	
			(2, 105, 23, 5), --41 Cofidis
			(2, 113, 23, 3), --49 Movistar Team
			(2, 121, 23, 4), --57 Groupama-fdj
			
	--Puestos para la clasificacion de tipo Jovenes
	
		--No hubo clasificacion joven etapa 1 2023
		--Etapa 2 2023
			(3, 65, 23, 1), --1 --Alpecin-Deceuninck
			(3, 66, 23, 4),
			(3, 67, 23, 19),
			(3, 73, 23, 5), --9 Team Arkea - Samsic
			(3, 74, 23, 16),
			(3, 75, 23, 17),
			(3, 81, 23, 3), --17 Astana Qazaqstan Team
			(3, 82, 23, 6),
			(3, 84, 23, 11),
			(3, 89, 23, 9), --25 Bahrain Victorius
			(3, 90, 23, 13),
			(3, 91, 23, 21),
			(3, 97, 23, 12), --33 Bora - Hansgrohe
			(3, 113, 23, 10), --49 Movistar Team
			(3, 114, 23, 14),
			(3, 121, 23, 2), --57 Groupama-fdj
			(3, 122, 23, 7),
			(3, 123, 23, 8),
			(3, 124, 23, 15),
			(3, 125, 23, 18),
			(3, 126, 23, 20),
	
	--Puestos para la clasificacion de tipo Combativo
	
		--No hubo clasificacion de tipo combativo en la vuelta etapa1 2023
		--Etapa 2
			(4, 87, 23, 1), --Astan6
		
	--Puestos para la clasificacion de tipo Grupos
		--Etapa 1 2023
			
			(5, 65, 22, 7), --1 --Alpecin-Deceuninck
			(5, 73, 22, 8), --9 Team Arkea - Samsic
			(5, 81, 22, 4), --17 Astana Qazaqstan Team
			(5, 89, 22, 3), --25 Bahrain Victorius
			(5, 97, 22, 6), --33 Bora - Hansgrohe
			(5, 105, 22, 5), --41 Cofidis
			(5, 113, 22, 1), --49 Movistar Team
			(5, 121, 22, 2), --57 Groupama-fdj
		--Etapa 2 2023
			(5, 65, 23, 2), --1 --Alpecin-Deceuninck
			(5, 73, 23, 6), --9 Team Arkea - Samsic
			(5, 81, 23, 1), --17 Astana Qazaqstan Team
			(5, 89, 23, 8), --25 Bahrain Victorius
			(5, 97, 23, 5), --33 Bora - Hansgrohe
			(5, 105, 23, 7), --41 Cofidis
			(5, 113, 23, 4), --49 Movistar Team
			(5, 121, 23, 3), --57 Groupama-fdj
			
	--Puestos para la clasificacion de tipo Individual
		--No hubo para etapa 1 2023
		--Etapa 2 2023
		(6, 65, 23, 25), --1 --Alpecin-Deceuninck
		(6, 66, 23, 2), --2
		(6, 67, 23, 3), --3
		(6, 68, 23, 4), --4
		(6, 69, 23, 5), --5
		(6, 70, 23, 6), --6
		(6, 71, 23, 60), --7
		(6, 72, 23, 59), --8

		(6, 73, 23, 17), --9 Team Arkea - Samsic
		(6, 74, 23, 18), --10
		(6, 75, 23, 19), --11
		(6, 76, 23, 20), --12
		(6, 77, 23, 21), --13
		(6, 78, 23, 22), --14
		(6, 79, 23, 23), --15
		(6, 80, 23, 24), --16

		(6, 81, 23, 7), --17 Astana Qazaqstan Team
		(6, 82, 23, 1), --18
		(6, 83, 23, 26), --19
		(6, 84, 23, 27), --20
		(6, 85, 23, 28), --21
		(6, 86, 23, 29), --22
		(6, 87, 23, 30), --23
		(6, 88, 23, 31), --24

		(6, 89, 23, 32), --25 Bahrain Victorius
		(6, 90, 23, 33), --26
		(6, 91, 23, 34), --27
		(6, 92, 23, 35), --28
		(6, 93, 23, 36), --29
		(6, 94, 23, 57), --30
		(6, 95, 23, 63), --31
		(6, 96, 23, 64), --32 a

		(6, 97, 23, 37), --33 Bora - Hansgrohe
		(6, 98, 23, 38), --34
		(6, 99, 23, 39), --35
		(6, 100, 23, 40), --36
		(6, 101, 23, 41), --37
		(6, 102, 23, 42), --38
		(6, 103, 23, 43), --39
		(6, 104, 23, 44), --40

		(6, 105, 23, 45), --41 Cofidis
		(6, 106, 23, 46), --42
		(6, 107, 23, 47), --43
		(6, 108, 23, 48), --44
		(6, 109, 23, 49), --45
		(6, 110, 23, 56), --46
		(6, 111, 23, 50), --47
		(6, 112, 23, 62), --48

		(6, 113, 23, 51), --49 Movistar Team
		(6, 114, 23, 52), --50
		(6, 115, 23, 53), --51
		(6, 116, 23, 54), --52
		(6, 117, 23, 55), --53
		(6, 118, 23, 8), --54
		(6, 119, 23, 9), --55
		(6, 120, 23, 10), --56

		(6, 121, 23, 11), --57 Groupama-fdj
		(6, 122, 23, 12), --58
		(6, 123, 23, 13), --59
		(6, 124, 23, 14), --60
		(6, 125, 23, 15), --61
		(6, 126, 23, 16), --62
		(6, 127, 23, 58), --63
		(6, 128, 23, 61); --64

---DEPRONTO BORRAR
-- Etapa 3 2023
INSERT INTO Puestos (idTipoClasificacion, idCiclistaParticipacionPorEdicion, idEtapa, puesto) 
VALUES
    (1, 19, 3, 1), -- 19
    (1, 23, 3, 2), -- 23
    (1, 27, 3, 3), -- 27
-- Etapa 4 2023
    (1, 31, 4, 1), -- 31
    (1, 35, 4, 2), -- 35
    (1, 39, 4, 3); -- 39
	
-- Etapa 3
INSERT INTO Puestos (idTipoClasificacion, idCiclistaParticipacionPorEdicion, idEtapa, puesto) 
VALUES
    (2, 21, 3, 1), -- 21
    (2, 25, 3, 2), -- 25
    (2, 29, 3, 3), -- 29
    (2, 33, 3, 4), -- 33
    (2, 37, 3, 5), -- 37
    (2, 41, 3, 6), -- 41
-- Etapa 4
    (2, 22, 4, 1), -- 22
    (2, 26, 4, 2), -- 26
    (2, 30, 4, 3), -- 30
    (2, 34, 4, 4), -- 34
    (2, 38, 4, 5), -- 38
    (2, 42, 4, 6); -- 42

-- Etapa 3
INSERT INTO Puestos (idTipoClasificacion, idCiclistaParticipacionPorEdicion, idEtapa, puesto) 
VALUES
    (3, 1, 3, 1), -- 18
    (3, 2, 3, 2), -- 20
    (3, 3, 3, 3), -- 22
    (3, 9, 3, 4), -- 24
    (3, 10, 3, 5), -- 26
    (3, 11, 3, 6), -- 28
    (3, 17, 3, 7), -- 30
    (3, 20, 3, 8), -- 32
    (3, 49, 3, 9), -- 34
    (3, 50, 3, 10), -- 36
-- Etapa 4
    (3, 1, 4, 7), -- 19
    (3, 9, 4, 6), -- 21
    (3, 17, 4, 5), -- 23
    (3, 25, 4, 4), -- 25
    (3, 34, 4, 3), -- 27
    (3, 42, 4, 2), -- 29
    (3, 62, 4, 1); -- 31
	
-- Etapa 3
INSERT INTO Puestos (idTipoClasificacion, idCiclistaParticipacionPorEdicion, idEtapa, puesto) 
VALUES
    (4, 25, 3, 1), -- 17
-- Etapa 4
    (4, 33, 4, 1); -- 24


-- Etapa 3
INSERT INTO Puestos (idTipoClasificacion, idCiclistaParticipacionPorEdicion, idEtapa, puesto) 
VALUES
    (5, 1, 3, 1), -- 18
    (5, 9, 3, 2), -- 24
    (5, 17, 3, 3), -- 30
    (5, 25, 3, 4), -- 36
    (5, 33, 3, 5), -- 42
    (5, 41, 3, 6), -- 48
    (5, 49, 3, 7), -- 54
    (5, 57, 3, 8), -- 60
-- Etapa 4
    (5, 57, 4, 1), -- 19
    (5, 49, 4, 2), -- 25
    (5, 41, 4, 3), -- 31
    (5, 33, 4, 4), -- 37
    (5, 25, 4, 5), -- 43
    (5, 17, 4, 6), -- 49
    (5, 9, 4, 7), -- 55
    (5, 1, 4, 8); -- 61
	
-- Etapa 3
INSERT INTO Puestos (idTipoClasificacion, idCiclistaParticipacionPorEdicion, idEtapa, puesto) 
VALUES
    (6, 1, 3, 1), --1 --Alpecin-Deceuninck
	(6, 2, 3, 2), --2
	(6, 3, 3, 3), --3
	(6, 4, 3, 4), --4
	(6, 5, 3, 5), --5
	(6, 6, 3, 6), --6
	(6, 7, 3, 63), --7
	(6, 8, 3, 64), --8

	(6, 9, 3, 7), --9 Team Arkea - Samsic
	(6, 10, 3, 8), --10
	(6, 11, 3, 9), --11
	(6, 12, 3, 10), --12
	(6, 13, 3, 11), --13
	(6, 14, 3, 12), --14
	(6, 15, 3, 13), --15
	(6, 16, 3, 14), --16

	(6, 17, 3, 15), --17 Astana Qazaqstan Team
	(6, 18, 3, 16), --18
	(6, 19, 3, 17), --19
	(6, 20, 3, 18), --20
	(6, 21, 3, 19), --21
	(6, 22, 3, 20), --22
	(6, 23, 3, 21), --23
	(6, 24, 3, 22), --24

	(6, 25, 3, 23), --25 Bahrain Victorius
	(6, 26, 3, 24), --26
	(6, 27, 3, 25), --27
	(6, 28, 3, 26), --28
	(6, 29, 3, 27), --29
	(6, 30, 3, 28), --30
	(6, 31, 3, 29), --31
	(6, 32, 3, 30), --32

	(6, 33, 3, 31), --33 Bora - Hansgrohe
	(6, 34, 3, 32), --34
	(6, 35, 3, 33), --35
	(6, 36, 3, 34), --36
	(6, 37, 3, 35), --37
	(6, 38, 3, 36), --38
	(6, 39, 3, 37), --39
	(6, 40, 3, 38), --40

	(6, 41, 3, 39), --41 Cofidis
	(6, 42, 3, 40), --42
	(6, 43, 3, 41), --43
	(6, 44, 3, 42), --44
	(6, 45, 3, 43), --45
	(6, 46, 3, 44), --46
	(6, 47, 3, 45), --47
	(6, 48, 3, 46), --48

	(6, 49, 3, 47), --49 Movistar Team
	(6, 50, 3, 48), --50
	(6, 51, 3, 49), --51
	(6, 52, 3, 50), --52
	(6, 53, 3, 51), --53
	(6, 54, 3, 52), --54
	(6, 55, 3, 53), --55
	(6, 56, 3, 54), --56

	(6, 57, 3, 55), --57 Groupama-fdj
	(6, 58, 3, 56), --58
	(6, 58, 3, 57), --59
	(6, 60, 3, 58), --60
	(6, 61, 3, 59), --61
	(6, 62, 3, 60), --62
	(6, 63, 3, 61), --63
	(6, 64, 3, 62), --64
	
-- Etapa 4
    (6, 1, 4, 64), --1 --Alpecin-Deceuninck
	(6, 2, 4, 63), --2
	(6, 3, 4, 62), --3
	(6, 4, 4, 61), --4
	(6, 5, 4, 60), --5
	(6, 6, 4, 59), --6
	(6, 7, 4, 58), --7
	(6, 8, 4, 57), --8

	(6, 9, 4, 56), --9 Team Arkea - Samsic
	(6, 10, 4, 55), --10
	(6, 11, 4, 54), --11
	(6, 12, 4, 53), --12
	(6, 13, 4, 52), --13
	(6, 14, 4, 51), --14
	(6, 15, 4, 50), --15
	(6, 16, 4, 49), --16

	(6, 17, 4, 48), --17 Astana Qazaqstan Team
	(6, 18, 4, 47), --18
	(6, 19, 4, 46), --19
	(6, 20, 4, 45), --20
	(6, 21, 4, 44), --21
	(6, 22, 4, 43), --22
	(6, 23, 4, 42), --23
	(6, 24, 4, 41), --24

	(6, 25, 4, 40), --25 Bahrain Victorius
	(6, 26, 4, 39), --26
	(6, 27, 4, 38), --27
	(6, 28, 4, 37), --28
	(6, 29, 4, 36), --29
	(6, 30, 4, 35), --30
	(6, 31, 4, 34), --31
	(6, 32, 4, 33), --32

	(6, 33, 4, 32), --33 Bora - Hansgrohe
	(6, 34, 4, 31), --34
	(6, 35, 4, 30), --35
	(6, 36, 4, 29), --36
	(6, 37, 4, 28), --37
	(6, 38, 4, 27), --38
	(6, 39, 4, 26), --39
	(6, 40, 4, 25), --40

	(6, 41, 4, 24), --41 Cofidis
	(6, 42, 4, 23), --42
	(6, 43, 4, 22), --43
	(6, 44, 4, 21), --44
	(6, 45, 4, 20), --45
	(6, 46, 4, 19), --46
	(6, 47, 4, 18), --47
	(6, 48, 4, 17), --48

	(6, 49, 4, 16), --49 Movistar Team
	(6, 50, 4, 15), --50
	(6, 51, 4, 14), --51
	(6, 52, 4, 13), --52
	(6, 53, 4, 12), --53
	(6, 54, 4, 11), --54
	(6, 55, 4, 10), --55
	(6, 56, 4, 9), --56

	(6, 57, 4, 8), --57 Groupama-fdj
	(6, 58, 4, 7), --58
	(6, 58, 4, 6), --59
	(6, 60, 4, 5), --60
	(6, 61, 4, 4), --61
	(6, 62, 4, 3), --62
	(6, 63, 4, 2), --63
	(6, 64, 4, 1); --64
	
--FIN ELIMINAR

-- Insertar puntos
INSERT INTO Puntos(idEtapa, idCiclistaParticipacionPorEdicion, puntosGeneral, puntosMontaña) 
VALUES

	--Etapa 1 2023
		--No hubo puntos en etapa 1
	--Etapa 2 2023
		(2, 1, 10, 0), --1 --Alpecin-Deceuninck
		(2, 2, 25, 0), --2
		(2, 17, 17, 6), --17 Astana Qazaqstan Team
		(2, 41, 13, 0), --41 Cofidis
		(2, 42, 0, 4), --42
		(2, 49, 15, 0), --49 Movistar Team
		(2, 57, 13, 2), --57 Groupama-fdj

	--Etapa 2 2024
		(23, 65, 8, 0), --1 --Alpecin-Deceuninck
		(23, 66, 23, 0), --2
		(23, 81, 15, 7), --17 Astana Qazaqstan Team
		(23, 105, 11, 0), --41 Cofidis
		(23, 106, 0, 5), --42
		(23, 113, 12, 0), --49 Movistar Team
		(23, 121, 11, 3); --57 Groupama-fdj
		
--Tal vez eliminar
-- Etapa 3 2023
INSERT INTO Puntos (idEtapa, idCiclistaParticipacionPorEdicion, puntosGeneral, puntosMontaña) 
VALUES
    -- Clasificación de Montaña
    (3, 19, 0, 10), -- 1er lugar Montaña
    (3, 23, 0, 6),  -- 2do lugar Montaña
    (3, 27, 0, 4),  -- 3er lugar Montaña

    -- Clasificación por Puntos
    (3, 21, 25, 0), -- 1er lugar Puntos Generales
    (3, 25, 20, 0), -- 2do lugar Puntos Generales
    (3, 29, 15, 0), -- 3er lugar Puntos Generales
    (3, 33, 10, 0), -- 4to lugar Puntos Generales
    (3, 37, 5, 0),  -- 5to lugar Puntos Generales
    (3, 41, 2, 0),  -- 6to lugar Puntos Generales

-- Etapa 4 2023
    -- Clasificación de Montaña
    (4, 31, 0, 9), -- 1er lugar Montaña
    (4, 35, 0, 6),  -- 2do lugar Montaña
    (4, 39, 0, 4),  -- 3er lugar Montaña

    -- Clasificación por Puntos
    (4, 22, 22, 0), -- 1er lugar Puntos Generales
    (4, 26, 18, 0), -- 2do lugar Puntos Generales
    (4, 30, 15, 0), -- 3er lugar Puntos Generales
    (4, 34, 4, 0), -- 4to lugar Puntos Generales
    (4, 38, 4, 0),  -- 5to lugar Puntos Generales
    (4, 42, 2, 0);  -- 6to lugar Puntos Generales
--TERMINA EL ELIMINAR

-- Insertar bonificaciones
INSERT INTO Bonificaciones (idEtapa, idCiclistaParticipacionPorEdicion, bonificacion) 
VALUES

	--Etapa 1 2023 
		--No hubo bonificaciones en etapa 1
	--Etapa 2 2023
		(2, 1, '00:00:06'), --1 --Alpecin-Deceuninck	
		(2, 57, '00:00:04'), --57 Groupama-fdj
	--Etapa 2 2024
		(23, 65, '00:00:06'), --1 --Alpecin-Deceuninck	
		(23, 121, '00:00:04'); --57 Groupama-fdj

--TAL VEZ ELIMINAR
-- Insertar bonificaciones
INSERT INTO Bonificaciones (idEtapa, idCiclistaParticipacionPorEdicion, bonificacion) 
VALUES
    -- Etapa 3 2023
    (3, 19, '00:00:10'), -- 1er lugar en bonificación, ciclista ID 19
    (3, 25, '00:00:06'), -- 2do lugar en bonificación, ciclista ID 21
    (3, 60, '00:00:04'), -- 3er lugar en bonificación, ciclista ID 23

    -- Etapa 4 2023
    (4, 22, '00:00:10'), -- 1er lugar en bonificación, ciclista ID 22
    (4, 36, '00:00:06'), -- 2do lugar en bonificación, ciclista ID 24
    (4, 1, '00:00:04'); -- 3er lugar en bonificación, ciclista ID 26

--FIN ELIMINAR


-- Insertar tiempos
INSERT INTO Tiempos (idEtapa, idCiclistaParticipacionPorEdicion, tiempo) 
VALUES
    --Etapa 1 2023
		(1, 1, '00:18:11'), --1 --Alpecin-Deceuninck
		(1, 2, '00:18:11'), --2
		(1, 3, '00:18:11'), --3
		(1, 4, '00:18:11'), --4
		(1, 5, '00:18:11'), --5
		(1, 6, '00:18:11'), --6
		(1, 7, '00:18:11'), --7
		(1, 8, '00:18:11'), --8

		(1, 9, '00:18:48'), --9 Team Arkea - Samsic
		(1, 10, '00:18:48'), --10
		(1, 11, '00:18:48'), --11
		(1, 12, '00:18:48'), --12
		(1, 13, '00:18:48'), --13
		(1, 14, '00:18:48'), --14
		(1, 15, '00:18:48'), --15
		(1, 16, '00:18:48'), --16

		(1, 17, '00:17:47'), --17 Astana Qazaqstan Team
		(1, 18, '00:17:47'), --18
		(1, 19, '00:17:47'), --19
		(1, 20, '00:17:47'), --20
		(1, 21, '00:17:47'), --21
		(1, 22, '00:17:47'), --22
		(1, 23, '00:17:47'), --23
		(1, 24, '00:17:47'), --24

		(1, 25, '00:17:40'), --25 Bahrain Victorius
		(1, 26, '00:17:40'), --26
		(1, 27, '00:17:40'), --27
		(1, 28, '00:17:40'), --28
		(1, 29, '00:17:40'), --29
		(1, 30, '00:17:40'), --30
		(1, 31, '00:17:40'), --31
		(1, 32, '00:17:40'), --32

		(1, 33, '00:17:58'), --33 Bora - Hansgrohe
		(1, 34, '00:17:58'), --34
		(1, 35, '00:17:58'), --35
		(1, 36, '00:17:58'), --36
		(1, 37, '00:17:58'), --37
		(1, 38, '00:17:58'), --38
		(1, 39, '00:17:58'), --39
		(1, 40, '00:17:58'), --40

		(1, 41, '00:17:52'), --41 Cofidis
		(1, 42, '00:17:52'), --42
		(1, 43, '00:17:52'), --43
		(1, 44, '00:17:52'), --44
		(1, 45, '00:17:52'), --45
		(1, 46, '00:17:52'), --46
		(1, 47, '00:17:52'), --47
		(1, 48, '00:17:52'), --48

		(1, 49, '00:17:30'), --49 Movistar Team
		(1, 50, '00:17:30'), --50
		(1, 51, '00:17:30'), --51
		(1, 52, '00:17:30'), --52
		(1, 53, '00:17:30'), --53
		(1, 54, '00:17:30'), --54
		(1, 55, '00:17:30'), --55
		(1, 56, '00:17:30'), --56

		(1, 57, '00:17:36'), --57 Groupama-fdj
		(1, 58, '00:17:36'), --58
		(1, 59, '00:17:36'), --59
		(1, 60, '00:17:36'), --60
		(1, 61, '00:17:36'), --61
		(1, 62, '00:17:36'), --62
		(1, 63, '00:17:36'), --63
		(1, 64, '00:17:36'), --64
	 --Etapa 2 2023
		(2, 1, '04:10:06'), --1 --Alpecin-Deceuninck
		(2, 2, '04:10:06'), --2
		(2, 3, '04:10:06'), --3
		(2, 4, '04:10:06'), --4
		(2, 5, '04:10:06'), --5
		(2, 6, '04:10:06'), --6
		(2, 7, '04:13:04'), --7
		(2, 8, '04:13:04'), --8

		(2, 9, '04:10:06'), --9 Team Arkea - Samsic
		(2, 10, '04:10:06'), --10
		(2, 11, '04:10:06'), --11
		(2, 12, '04:10:06'), --12
		(2, 13, '04:10:06'), --13
		(2, 14, '04:10:06'), --14
		(2, 15, '04:10:06'), --15
		(2, 16, '04:10:06'), --16

		(2, 17, '04:10:06'), --17 Astana Qazaqstan Team
		(2, 18, '04:09:47'), --18
		(2, 19, '04:10:06'), --19
		(2, 20, '04:10:06'), --20
		(2, 21, '04:10:06'), --21
		(2, 22, '04:10:06'), --22
		(2, 23, '04:10:06'), --23
		(2, 24, '04:10:06'), --24

		(2, 25, '04:10:06'), --25 Bahrain Victorius
		(2, 26, '04:10:06'), --26
		(2, 27, '04:10:06'), --27
		(2, 28, '04:10:06'), --28
		(2, 29, '04:10:06'), --29
		(2, 30, '04:10:42'), --30
		(2, 31, '04:17:08'), --31
		(2, 32, '04:18:59'), --32

		(2, 33, '04:10:06'), --33 Bora - Hansgrohe
		(2, 34, '04:10:06'), --34
		(2, 35, '04:10:06'), --35
		(2, 36, '04:10:06'), --36
		(2, 37, '04:10:06'), --37
		(2, 38, '04:10:06'), --38
		(2, 39, '04:10:06'), --39
		(2, 40, '04:10:06'), --40

		(2, 41, '04:10:06'), --41 Cofidis
		(2, 42, '04:10:06'), --42
		(2, 43, '04:10:06'), --43
		(2, 44, '04:10:06'), --44
		(2, 45, '04:10:06'), --45
		(2, 46, '04:10:42'), --46
		(2, 47, '04:10:06'), --47
		(2, 48, '04:15:31'), --48

		(2, 49, '04:10:06'), --49 Movistar Team
		(2, 50, '04:10:06'), --50
		(2, 51, '04:10:06'), --51
		(2, 52, '04:10:06'), --52
		(2, 53, '04:10:06'), --53
		(2, 54, '04:10:06'), --54
		(2, 55, '04:10:06'), --55
		(2, 56, '04:10:06'), --56

		(2, 57, '04:10:06'), --57 Groupama-fdj
		(2, 58, '04:10:06'), --58
		(2, 59, '04:10:06'), --59
		(2, 60, '04:10:06'), --60
		(2, 61, '04:10:06'), --61
		(2, 62, '04:10:06'), --62
		(2, 63, '04:11:42'), --63
		(2, 64, '04:15:31'), --64

    --Etapa 1 2024
		(22, 65, '00:18:11'), --1 --Alpecin-Deceuninck
		(22, 66, '00:18:11'), --2
		(22, 67, '00:18:11'), --3
		(22, 68, '00:18:11'), --4
		(22, 69, '00:18:11'), --5
		(22, 70, '00:18:11'), --6
		(22, 71, '00:18:11'), --7
		(22, 72, '00:18:11'), --8

		(22, 73, '00:18:48'), --9 Team Arkea - Samsic
		(22, 74, '00:18:48'), --10
		(22, 75, '00:18:48'), --11
		(22, 76, '00:18:48'), --12
		(22, 77, '00:18:48'), --13
		(22, 78, '00:18:48'), --14
		(22, 79, '00:18:48'), --15
		(22, 80, '00:18:48'), --16

		(22, 81, '00:17:47'), --17 Astana Qazaqstan Team
		(22, 82, '00:17:47'), --18
		(22, 83, '00:17:47'), --19
		(22, 84, '00:17:47'), --20
		(22, 85, '00:17:47'), --21
		(22, 86, '00:17:47'), --22
		(22, 87, '00:17:47'), --23
		(22, 88, '00:17:47'), --24

		(22, 89, '00:17:40'), --25 Bahrain Victorius
		(22, 90, '00:17:40'), --26
		(22, 91, '00:17:40'), --27
		(22, 92, '00:17:40'), --28
		(22, 93, '00:17:40'), --29
		(22, 94, '00:17:40'), --30
		(22, 95, '00:17:40'), --31
		(22, 96, '00:17:40'), --32

		(22, 97, '00:17:58'), --33 Bora - Hansgrohe
		(22, 98, '00:17:58'), --34
		(22, 99, '00:17:58'), --35
		(22, 100, '00:17:58'), --36
		(22, 101, '00:17:58'), --37
		(22, 102, '00:17:58'), --38
		(22, 103, '00:17:58'), --39
		(22, 104, '00:17:58'), --40

		(22, 105, '00:17:52'), --41 Cofidis
		(22, 106, '00:17:52'), --42
		(22, 107, '00:17:52'), --43
		(22, 108, '00:17:52'), --44
		(22, 109, '00:17:52'), --45
		(22, 110, '00:17:52'), --46
		(22, 111, '00:17:52'), --47
		(22, 112, '00:17:52'), --48

		(22, 113, '00:17:30'), --49 Movistar Team
		(22, 114, '00:17:30'), --50
		(22, 115, '00:17:30'), --51
		(22, 116, '00:17:30'), --52
		(22, 117, '00:17:30'), --53
		(22, 118, '00:17:30'), --54
		(22, 119, '00:17:30'), --55
		(22, 120, '00:17:30'), --56

		(22, 121, '00:17:36'), --57 Groupama-fdj
		(22, 122, '00:17:36'), --58
		(22, 123, '00:17:36'), --59
		(22, 124, '00:17:36'), --60
		(22, 125, '00:17:36'), --61
		(22, 126, '00:17:36'), --62
		(22, 127, '00:17:36'), --63
		(22, 128, '00:17:36'), --64
			
	 --Etapa 2 2024
		(23, 65, '04:10:06'), --1 --Alpecin-Deceuninck
		(23, 66, '04:10:06'), --2
		(23, 67, '04:10:06'), --3
		(23, 68, '04:10:06'), --4
		(23, 69, '04:10:06'), --5
		(23, 70, '04:10:06'), --6
		(23, 71, '04:13:04'), --7
		(23, 72, '04:13:04'), --8

		(23, 73, '04:10:06'), --9 Team Arkea - Samsic
		(23, 74, '04:10:06'), --10
		(23, 75, '04:10:06'), --11
		(23, 76, '04:10:06'), --12
		(23, 77, '04:10:06'), --13
		(23, 78, '04:10:06'), --14
		(23, 79, '04:10:06'), --15
		(23, 80, '04:10:06'), --16

		(23, 81, '04:10:06'), --17 Astana Qazaqstan Team
		(23, 82, '04:09:47'), --18
		(23, 83, '04:10:06'), --19
		(23, 84, '04:10:06'), --20
		(23, 85, '04:10:06'), --21
		(23, 86, '04:10:06'), --22
		(23, 87, '04:10:06'), --23
		(23, 88, '04:10:06'), --24

		(23, 89, '04:10:06'), --25 Bahrain Victorius
		(23, 90, '04:10:06'), --26
		(23, 91, '04:10:06'), --27
		(23, 92, '04:10:06'), --28
		(23, 93, '04:10:06'), --29
		(23, 94, '04:10:42'), --30
		(23, 95, '04:17:08'), --31
		(23, 96, '04:18:59'), --32

		(23, 97, '04:10:06'), --33 Bora - Hansgrohe
		(23, 98, '04:10:06'), --34
		(23, 99, '04:10:06'), --35
		(23, 100, '04:10:06'), --36
		(23, 101, '04:10:06'), --37
		(23, 102, '04:10:06'), --38
		(23, 103, '04:10:06'), --39
		(23, 104, '04:10:06'), --40

		(23, 105, '04:10:06'), --41 Cofidis
		(23, 106, '04:10:06'), --42
		(23, 107, '04:10:06'), --43
		(23, 108, '04:10:06'), --44
		(23, 109, '04:10:06'), --45
		(23, 110, '04:10:42'), --46
		(23, 111, '04:10:06'), --47
		(23, 112, '04:15:31'), --48

		(23, 113, '04:10:06'), --49 Movistar Team
		(23, 114, '04:10:06'), --50
		(23, 115, '04:10:06'), --51
		(23, 116, '04:10:06'), --52
		(23, 117, '04:10:06'), --53
		(23, 118, '04:10:06'), --54
		(23, 119, '04:10:06'), --55
		(23, 120, '04:10:06'), --56
			
		(23, 121, '04:10:06'), --57 Groupama-fdj
		(23, 122, '04:10:06'), --58
		(23, 123, '04:10:06'), --59
		(23, 124, '04:10:06'), --60
		(23, 125, '04:10:06'), --61
		(23, 126, '04:10:06'), --62
		(23, 127, '04:11:42'), --63
		(23, 128, '04:15:31'); --64


--TAL VEZ ELIMINAR 
-- Etapa 3 2023

INSERT INTO Tiempos (idEtapa, idCiclistaParticipacionPorEdicion, tiempo) 
VALUES
    -- Etapa 3 2023
	(3, 1, '04:10:10'), -- 1 - Alpecin-Deceuninck
    (3, 2, '04:10:12'), -- 2
    (3, 3, '04:10:14'), -- 3
    (3, 4, '04:10:16'), -- 4
    (3, 5, '04:10:18'), -- 5
    (3, 6, '04:10:20'), -- 6
    (3, 7, '04:13:00'), -- 7
    (3, 8, '04:13:02'), -- 8

    (3, 9, '04:10:22'), -- 9 Team Arkea - Samsic
    (3, 10, '04:10:24'), -- 10
    (3, 11, '04:10:26'), -- 11
    (3, 12, '04:10:28'), -- 12
    (3, 13, '04:10:30'), -- 13
    (3, 14, '04:10:32'), -- 14
    (3, 15, '04:10:34'), -- 15
    (3, 16, '04:10:36'), -- 16

    (3, 17, '04:10:38'), -- 17 Astana Qazaqstan Team
    (3, 18, '04:10:40'), -- 18
    (3, 19, '04:10:42'), -- 19
    (3, 20, '04:10:44'), -- 20
    (3, 21, '04:10:46'), -- 21
    (3, 22, '04:10:48'), -- 22
    (3, 23, '04:10:50'), -- 23
    (3, 24, '04:10:52'), -- 24

    (3, 25, '04:10:54'), -- 25 Bahrain Victorius
    (3, 26, '04:10:56'), -- 26
    (3, 27, '04:10:58'), -- 27
    (3, 28, '04:11:00'), -- 28
    (3, 29, '04:11:02'), -- 29
    (3, 30, '04:11:04'), -- 30
    (3, 31, '04:11:06'), -- 31
    (3, 32, '04:11:08'), -- 32

    (3, 33, '04:11:10'), -- 33 Bora - Hansgrohe
    (3, 34, '04:11:12'), -- 34
    (3, 35, '04:11:14'), -- 35
    (3, 36, '04:11:16'), -- 36
    (3, 37, '04:11:18'), -- 37
    (3, 38, '04:11:20'), -- 38
    (3, 39, '04:11:22'), -- 39
    (3, 40, '04:11:24'), -- 40

    (3, 41, '04:11:26'), -- 41 Cofidis
    (3, 42, '04:11:28'), -- 42
    (3, 43, '04:11:30'), -- 43
    (3, 44, '04:11:32'), -- 44
    (3, 45, '04:11:34'), -- 45
    (3, 46, '04:11:36'), -- 46
    (3, 47, '04:11:38'), -- 47
    (3, 48, '04:11:40'), -- 48

    (3, 49, '04:11:42'), -- 49 Movistar Team
    (3, 50, '04:11:44'), -- 50
    (3, 51, '04:11:46'), -- 51
    (3, 52, '04:11:48'), -- 52
    (3, 53, '04:11:50'), -- 53
    (3, 54, '04:11:52'), -- 54
    (3, 55, '04:11:54'), -- 55
    (3, 56, '04:11:56'), -- 56

    (3, 57, '04:11:58'), -- 57 Groupama-fdj
    (3, 58, '04:12:00'), -- 58
    (3, 59, '04:12:02'), -- 59
    (3, 60, '04:12:04'), -- 60
    (3, 61, '04:12:06'), -- 61
    (3, 62, '04:12:08'), -- 62
    (3, 63, '04:12:10'), -- 63
    (3, 64, '04:12:12'); -- 64
-- Etapa 4 2023
INSERT INTO Tiempos (idEtapa, idCiclistaParticipacionPorEdicion, tiempo) 
VALUES
    -- Etapa 4 2023
    (4, 1, '04:12:12'), -- 1 - Alpecin-Deceuninck
    (4, 2, '04:12:10'), -- 2
    (4, 3, '04:12:08'), -- 3
    (4, 4, '04:12:06'), -- 4
    (4, 5, '04:12:04'), -- 5
    (4, 6, '04:12:02'), -- 6
    (4, 7, '04:12:00'), -- 7
    (4, 8, '04:11:58'), -- 8

    (4, 9, '04:11:56'), -- 9 Team Arkea - Samsic
    (4, 10, '04:11:54'), -- 10
    (4, 11, '04:11:52'), -- 11
    (4, 12, '04:11:50'), -- 12
    (4, 13, '04:11:48'), -- 13
    (4, 14, '04:11:46'), -- 14
    (4, 15, '04:11:44'), -- 15
    (4, 16, '04:11:42'), -- 16

    (4, 17, '04:11:40'), -- 17 Astana Qazaqstan Team
    (4, 18, '04:11:38'), -- 18
    (4, 19, '04:11:36'), -- 19
    (4, 20, '04:11:34'), -- 20
    (4, 21, '04:11:32'), -- 21
    (4, 22, '04:11:30'), -- 22
    (4, 23, '04:11:28'), -- 23
    (4, 24, '04:11:26'), -- 24

    (4, 25, '04:11:24'), -- 25 Bahrain Victorius
    (4, 26, '04:11:22'), -- 26
    (4, 27, '04:11:20'), -- 27
    (4, 28, '04:11:18'), -- 28
    (4, 29, '04:11:16'), -- 29
    (4, 30, '04:11:14'), -- 30
    (4, 31, '04:11:12'), -- 31
    (4, 32, '04:11:10'), -- 32

    (4, 33, '04:11:08'), -- 33 Bora - Hansgrohe
    (4, 34, '04:11:06'), -- 34
    (4, 35, '04:11:04'), -- 35
    (4, 36, '04:11:02'), -- 36
    (4, 37, '04:11:00'), -- 37
    (4, 38, '04:10:58'), -- 38
    (4, 39, '04:10:56'), -- 39
    (4, 40, '04:10:54'), -- 40

    (4, 41, '04:10:52'), -- 41 Cofidis
    (4, 42, '04:10:50'), -- 42
    (4, 43, '04:10:48'), -- 43
    (4, 44, '04:10:46'), -- 44
    (4, 45, '04:10:44'), -- 45
    (4, 46, '04:10:42'), -- 46
    (4, 47, '04:10:40'), -- 47
    (4, 48, '04:10:38'), -- 48

    (4, 49, '04:10:36'), -- 49 Movistar Team
    (4, 50, '04:10:34'), -- 50
    (4, 51, '04:10:32'), -- 51
    (4, 52, '04:10:30'), -- 52
    (4, 53, '04:10:28'), -- 53
    (4, 54, '04:10:26'), -- 54
    (4, 55, '04:10:24'), -- 55
    (4, 56, '04:10:22'), -- 56

    (4, 57, '04:10:20'), -- 57 Groupama-fdj
    (4, 58, '04:10:18'), -- 58
    (4, 59, '04:10:16'), -- 59
    (4, 60, '04:10:14'), -- 60
    (4, 61, '04:10:12'), -- 61
    (4, 62, '04:10:10'), -- 62
    (4, 63, '04:10:08'), -- 63
    (4, 64, '04:10:06'); -- 64



--Insertar penalizaciones
INSERT INTO Penalizaciones(idEtapa, idCiclistaParticipacionPorEdicion, penalizacion)
VALUES 
	(1, 1, '00:00:6'),
	(1, 2, '00:00:2'),
	(1, 3, '00:00:10'),
	--Etapa 2 2023
	(2, 4, '00:00:6'),
	(2, 5, '00:00:2'),
	(2, 6, '00:00:10'),
	--Etapa 3 2023
	(3, 7, '00:00:6'),
	(3, 8, '00:00:2'),
	(3, 9, '00:00:10'),
	--Etapa 4 2023
	(4, 10, '00:00:6'),
	(4, 11, '00:00:2'),
	(4, 12, '00:00:10'),
	
	--Etapa 2 2024
	(23, 65, '00:00:6'),
	(23, 66, '00:00:2'),
	(23, 67, '00:00:10');
	