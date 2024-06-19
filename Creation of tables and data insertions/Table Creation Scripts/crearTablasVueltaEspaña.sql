CREATE TABLE Paises(
	idPais SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	idCiudadCapital INT NULL,
	UNIQUE(idCiudadCapital),
	UNIQUE(nombre)
);


CREATE TABLE Ciudades(
	idCiudad SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	idPais INT NOT NULL,
	FOREIGN KEY(idPais) REFERENCES Paises(idPais),
	UNIQUE(nombre)
);

ALTER TABLE Paises
ADD FOREIGN KEY(idCiudadCapital) REFERENCES Ciudades(idCiudad);

CREATE TABLE TiposPatrocinadores(
	idTipoPatrocinador SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200) NULL,
	UNIQUE(nombre)
);

CREATE TABLE Patrocinadores(
	idPatrocinador SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200) NULL,
	idTipoPatrocinador INT NOT NULL,
	FOREIGN KEY(idTipoPatrocinador) REFERENCES TiposPatrocinadores(idTipoPatrocinador),
	UNIQUE(nombre)
);

CREATE TABLE Equipos(
	idEquipo SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	descripcion VARCHAR(200) NULL,
	idPais INT NOT NULL,
	FOREIGN KEY(idPais) REFERENCES Paises(idPais),
	UNIQUE(nombre)
);

CREATE TABLE PatrocinadoresPorEquipos(
	idEquipo INT NOT NULL,
	idPatrocinador INT NOT NULL,
	PRIMARY KEY(idEquipo, idPatrocinador),
	FOREIGN KEY(idEquipo) REFERENCES Equipos(idEquipo),
	FOREIGN KEY(idPatrocinador) REFERENCES Patrocinadores(idPatrocinador)
);

CREATE TABLE Personas(
	idPersona SERIAL PRIMARY KEY,
	idPaisNacimiento INT NOT NULL,
	primerNombre VARCHAR(50) NOT NULL,
	segundoNombre VARCHAR(50) NULL DEFAULT '',
	primerApellido VARCHAR(50) NOT NULL,
	segundoApellido VARCHAR(50) NULL DEFAULT '',
	fechaDeNacimiento DATE NOT NULL,
	fechaDeRetiro DATE NULL
);

/*Trigger para validad que la persona sea mayor de edad*/
CREATE OR REPLACE FUNCTION verificarMayorEdad()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.fechaDeNacimiento + INTERVAL '18 years' > CURRENT_DATE THEN
        RAISE EXCEPTION 'La persona debe ser mayor de 18 años.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerVerificarMayorEdad
BEFORE INSERT OR UPDATE ON Personas
FOR EACH ROW
EXECUTE FUNCTION verificarMayorEdad();

/*Verificar que la fecha de retiro sea mayor a la fecha de namiemiento*/
CREATE OR REPLACE FUNCTION verificarFechaRetiro()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.fechaDeRetiro IS NOT NULL AND NEW.fechaDeRetiro <= NEW.fechaDeNacimiento THEN
        RAISE EXCEPTION 'La fecha de retiro debe ser mayor que la fecha de nacimiento.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerVerificarFechaRetiro
BEFORE INSERT OR UPDATE ON Personas
FOR EACH ROW
EXECUTE FUNCTION verificarFechaRetiro();

CREATE TABLE DirectoresGenerales(
	idPersona INT NOT NULL,
	PRIMARY KEY(idPersona),
	FOREIGN KEY(idPersona) REFERENCES Personas(idPersona)
);

CREATE TABLE DirectoresDeportivos(
	idPersona INT NOT NULL,
	PRIMARY KEY(idPersona),
	FOREIGN KEY(idPersona) REFERENCES Personas(idPersona)
);

CREATE TABLE Ciclistas(
	idPersona INT NOT NULL,
	PRIMARY KEY(idPersona),
	FOREIGN KEY(idPersona) REFERENCES Personas(idPersona)
);

CREATE TABLE Ediciones(
	idEdicion SERIAL PRIMARY KEY,
	fechaInicio DATE NOT NULL CHECK(EXTRACT(YEAR FROM fechaInicio) > 1935),
	fechaFinalizacion DATE NOT NULL,
	CONSTRAINT validarFecha CHECK(fechaFinalizacion >= fechaInicio)
);

/* Entidad asociativa */
CREATE TABLE ParticipacionesCiclistasPorEdicion(
	idParticipacionCiclistaPorEdicion SERIAL PRIMARY KEY,
	idCiclista INT NOT NULL,
	idEdicion INT NOT NULL,
	idEquipo INT NOT NULL,
	dorsal INT NOT NULL,
	FOREIGN KEY(idCiclista) REFERENCES Ciclistas(idPersona),
	FOREIGN KEY(idEdicion) REFERENCES Ediciones(idEdicion),
	FOREIGN KEY(idEquipo) REFERENCES Equipos(idEquipo),
	UNIQUE(idCiclista, idEdicion, idEquipo, dorsal)
);

CREATE TABLE ParticipacionesEquiposPorEdicion(
	idParticipacionEquipoPorEdicion SERIAL PRIMARY KEY,
	idDirectorGeneral INT NOT NULL,
	idDirectorDeportivo INT NOT NULL,
	idEdicion INT NOT NULL,
	idEquipo INT NOT NULL,
	FOREIGN KEY(idDirectorGeneral) REFERENCES DirectoresGenerales(idPersona),
	FOREIGN KEY(idDirectorDeportivo) REFERENCES DirectoresDeportivos(idPersona),
	FOREIGN KEY(idEdicion) REFERENCES Ediciones(idEdicion),
	FOREIGN KEY(idEquipo) REFERENCES Equipos(idEquipo),
	UNIQUE(idDirectorGeneral, idDirectorDeportivo, idEquipo, idEdicion)
);

CREATE TABLE DificultadesEtapas(
	idDificultadEtapa SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200) NULL,
	UNIQUE(nombre)
);

CREATE TABLE TiposDeEtapas(
	idTipoEtapa SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200) NULL,
	UNIQUE(nombre)
);

CREATE TABLE Etapas(
    idEtapa SERIAL PRIMARY KEY,
    idEdicion INT NOT NULL,
    idCiudadSalida INT NOT NULL,
    idCiudadLlegada INT NOT NULL,
    idDificultad INT NOT NULL,
    idTipoEtapa INT NOT NULL,
    numeroEtapa INT NOT NULL CHECK(numeroEtapa > 0),
    fechaRealizacion DATE NOT NULL,
    alturaMaxima NUMERIC(6,2) NOT NULL CHECK(alturaMaxima >= 0),
    distancia NUMERIC(6,2) NOT NULL CHECK(distancia >= 0),
    FOREIGN KEY(idEdicion) REFERENCES Ediciones(idEdicion),
    FOREIGN KEY(idCiudadSalida) REFERENCES Ciudades(idCiudad),
    FOREIGN KEY(idCiudadLlegada) REFERENCES Ciudades(idCiudad),
    FOREIGN KEY(idDificultad) REFERENCES DificultadesEtapas(idDificultadEtapa),
    FOREIGN KEY(idTipoEtapa) REFERENCES TiposDeEtapas(idTipoEtapa)
);

CREATE OR REPLACE FUNCTION validarFechaRealizacion()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Ediciones
        WHERE idEdicion = NEW.idEdicion
        AND NEW.fechaRealizacion BETWEEN fechaInicio AND fechaFinalizacion
    ) THEN
        RAISE EXCEPTION 'La fecha de realización no está dentro del rango de la edición correspondiente.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validarFechaRealizacionTrigger
BEFORE INSERT OR UPDATE ON Etapas
FOR EACH ROW
EXECUTE FUNCTION validarFechaRealizacion();


CREATE TABLE PatrocinadoresPorEdiciones(
	idEdicion INT NOT NULL,
	idPatrocinador INT NOT NULL,
	PRIMARY KEY(idEdicion, idPatrocinador),
	FOREIGN KEY(idEdicion) REFERENCES Ediciones(idEdicion),
	FOREIGN KEY(idPatrocinador) REFERENCES Patrocinadores(idPatrocinador)
);

CREATE TABLE TiposDeAccidentes(
	idTipoAccidente SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	UNIQUE(nombre)
);

CREATE TABLE Accidentes(
	idAccidente SERIAL PRIMARY KEY,
	idTipoAccidente INT NOT NULL,
	idCiclistaParticipacionPorEdicion INT NOT NULL,
	idEtapa INT NOT NULL,
	hora TIME NOT NULL,
	descripcion VARCHAR(200) NULL,
	FOREIGN KEY(idTipoAccidente) REFERENCES TiposDeAccidentes(idTipoAccidente),
	FOREIGN KEY(idCiclistaParticipacionPorEdicion) REFERENCES ParticipacionesCiclistasPorEdicion(idParticipacionCiclistaPorEdicion),
	FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa)
); 

CREATE TABLE TiposDeMetasParciales(
	idTipoMetaParcial SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	UNIQUE(nombre)
);

CREATE OR REPLACE FUNCTION validarKilometroFinal(idEt INT, kilometroFin NUMERIC(6,2))
RETURNS BOOLEAN AS $$
DECLARE
    distanciaEtapa NUMERIC(6,2);
BEGIN
    SELECT distancia INTO distanciaEtapa FROM Etapas WHERE idEtapa = idEt;
    
    RETURN kilometroFin >= 0 AND kilometroFin <= distanciaEtapa;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validarAltitud(idEt INT, alti NUMERIC(6,2))
RETURNS BOOLEAN AS $$
DECLARE
    alturaMaximaEtapa NUMERIC(6,2);
BEGIN
    SELECT alturaMaxima INTO alturaMaximaEtapa FROM Etapas WHERE idEtapa = idEt;
    
    RETURN alti >= 0 AND alti <= alturaMaximaEtapa;
END;
$$ LANGUAGE plpgsql;


CREATE TABLE MetasParciales(
	idMetaParcial SERIAL PRIMARY KEY,
	idTipoMetaParcial INT NOT NULL,
	idEtapa INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	kilometroFinal NUMERIC(6,2),
	altitud NUMERIC(6,2) NOT NULL,
	FOREIGN KEY(idTipoMetaParcial) REFERENCES TiposDeMetasParciales(idTipoMetaParcial),
	FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa),
   	CONSTRAINT validar_kilometro_final CHECK (validarKilometroFinal(idEtapa, kilometroFinal)),
	CONSTRAINT validar_altitud CHECK (validarAltitud(idEtapa, altitud))
);

CREATE TABLE TiposDeClasificaciones(
	idTipoClasificacion SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200) NULL,
	UNIQUE(nombre)
);

CREATE TABLE TiposDeAbandonos(
	idTipoDeAbandono SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200) NULL,
	UNIQUE(nombre)
);

CREATE TABLE Abandonos(
	idAbandono SERIAL PRIMARY KEY,
	idCiclistaParticipacionPorEdicion INT NOT NULL,
	idTipoAbandono INT NOT NULL,
	idEtapa INT NOT NULL,
	FOREIGN KEY(idCiclistaParticipacionPorEdicion) REFERENCES ParticipacionesCiclistasPorEdicion(idParticipacionCiclistaPorEdicion),
	FOREIGN KEY(idTipoAbandono) REFERENCES TiposDeAbandonos(idTipoDeAbandono),
	FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa),
	UNIQUE(idCiclistaParticipacionPorEdicion, idTipoAbandono, idEtapa)
);

CREATE OR REPLACE FUNCTION validarAbandono()
RETURNS TRIGGER AS $$
DECLARE
    abandonado BOOLEAN;
BEGIN
    SELECT TRUE INTO abandonado
    FROM Abandonos
    WHERE idCiclistaParticipacionPorEdicion = NEW.idCiclistaParticipacionPorEdicion;
    IF FOUND THEN
        RAISE EXCEPTION 'El ciclista ya ha abandonado la carrera. ';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TABLE Puestos(
	idPuesto SERIAL PRIMARY KEY,
	puesto INT NOT NULL,
	idTipoClasificacion INT NOT NULL,
	idCiclistaParticipacionPorEdicion INT NOT NULL,
	idEtapa INT NOT NULL,
	FOREIGN KEY(idTipoClasificacion) REFERENCES TiposDeClasificaciones(idTipoClasificacion),
	FOREIGN KEY(idCiclistaParticipacionPorEdicion) REFERENCES ParticipacionesCiclistasPorEdicion(idParticipacionCiclistaPorEdicion),
	FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa),
	UNIQUE(puesto, idEtapa, idCiclistaParticipacionPorEdicion, idTipoClasificacion)
);

CREATE TRIGGER validarAbandonoPuestosC
BEFORE INSERT OR UPDATE ON Puestos
FOR EACH ROW
EXECUTE FUNCTION validarAbandono();


CREATE TABLE Puntos(
	idPunto SERIAL PRIMARY KEY,
	idEtapa INT NOT NULL,
	idCiclistaParticipacionPorEdicion INT NOT NULL,
	puntosGeneral INT NOT NULL,
	puntosMontaña INT NOT NULL DEFAULT '0',
	FOREIGN KEY(idCiclistaParticipacionPorEdicion) REFERENCES ParticipacionesCiclistasPorEdicion(idParticipacionCiclistaPorEdicion),
	FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa),
	UNIQUE(idEtapa, idCiclistaParticipacionPorEdicion)
);

CREATE TRIGGER validarAbandonoPuntosC
BEFORE INSERT OR UPDATE ON Puntos
FOR EACH ROW
EXECUTE FUNCTION validarAbandono();


CREATE TABLE Bonificaciones(
	idBonificacion SERIAL PRIMARY KEY,
	idEtapa INT NOT NULL,
	idCiclistaParticipacionPorEdicion INT NOT NULL,
	bonificacion TIME NOT NULL CHECK (bonificacion > '00:00:00'),
	FOREIGN KEY(idCiclistaParticipacionPorEdicion) REFERENCES ParticipacionesCiclistasPorEdicion(idParticipacionCiclistaPorEdicion),
	FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa),
	UNIQUE(idEtapa, idCiclistaParticipacionPorEdicion)
);

CREATE TRIGGER validarAbandonoBonificacionesC
BEFORE INSERT OR UPDATE ON Bonificaciones
FOR EACH ROW
EXECUTE FUNCTION validarAbandono();

CREATE TABLE Tiempos(
	idTiempo SERIAL PRIMARY KEY,
	idEtapa INT NOT NULL,
	idCiclistaParticipacionPorEdicion INT NOT NULL,
	tiempo TIME NOT NULL CHECK (tiempo > '00:00:00'),
	FOREIGN KEY(idCiclistaParticipacionPorEdicion) REFERENCES ParticipacionesCiclistasPorEdicion(idParticipacionCiclistaPorEdicion),
	FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa),
	UNIQUE(idEtapa,idCiclistaParticipacionPorEdicion)
);

CREATE TRIGGER validarAbandonoTiemposC
BEFORE INSERT OR UPDATE ON Tiempos
FOR EACH ROW
EXECUTE FUNCTION validarAbandono();

CREATE TABLE Penalizaciones(
	idPenalizacion SERIAL PRIMARY KEY,
	idEtapa INT NOT NULL,
	idCiclistaParticipacionPorEdicion INT NOT NULL,
	penalizacion TIME NOT NULL,
	FOREIGN KEY(idCiclistaParticipacionPorEdicion) REFERENCES ParticipacionesCiclistasPorEdicion(idParticipacionCiclistaPorEdicion),
	FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa),
	UNIQUE(idEtapa, idCiclistaParticipacionPorEdicion)
);

CREATE TRIGGER validarAbandonoPenalizacionesC
BEFORE INSERT OR UPDATE ON Penalizaciones
FOR EACH ROW
EXECUTE FUNCTION validarAbandono();









