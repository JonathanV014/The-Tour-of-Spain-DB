--Vista datos de Paises
CREATE OR REPLACE VIEW vistaPaises AS
SELECT pais.idPais,
	pais.nombre AS "pais",
	ciudadCapital.idCiudad AS "idciudadcapital",
    ciudadCapital.nombre AS "ciudadcapital"
FROM Paises pais
LEFT JOIN Ciudades ciudadCapital ON pais.idCiudadCapital = ciudadCapital.idCiudad
ORDER BY pais.idPais;

--Vista datos de Ciudades
CREATE OR REPLACE VIEW vistaCiudades AS
SELECT ciudad.idCiudad,
	ciudad.nombre AS "ciudad",
	pais.idPais AS "idpais",
	pais.nombre AS "pais"
FROM Ciudades ciudad
LEFT JOIN Paises pais ON ciudad.idPais = pais.idPais
ORDER BY ciudad.idCiudad;

--Vista datos de Patrocinadores
CREATE OR REPLACE VIEW vistaPatrocinadores AS
SELECT patrocinador.idPatrocinador,
	patrocinador.nombre,
	patrocinador.descripcion,
	tipoPatrocinador.idTipoPatrocinador AS "idtipopatrocinador",
	tipoPatrocinador.nombre AS "tipopatrocinador"
FROM Patrocinadores patrocinador
LEFT JOIN TiposPatrocinadores tipoPatrocinador ON patrocinador.idTipoPatrocinador = tipoPatrocinador.idTipoPatrocinador
ORDER BY patrocinador.idPatrocinador; 

--Vista datos de Equipos --OK
CREATE OR REPLACE VIEW vistaEquipos AS
SELECT equipo.idEquipo,
	equipo.nombre,
	equipo.descripcion,
	pais.idPais AS "idpaisorigen",
	pais.nombre AS "paisorigen"
FROM Equipos equipo
LEFT JOIN Paises pais ON equipo.idPais = pais.idPais
ORDER BY equipo.idEquipo; 

--Vista datos de PatrocinadoresPorEquipos
CREATE OR REPLACE VIEW vistaPatrocinadoresPorEquipos AS
SELECT
	equipo.idEquipo AS "idEquipo",
	equipo.nombre AS "equipo",
	patrocinador.idPatrocinador As "idpatrocinador",
	patrocinador.nombre AS "patrocinador"
FROM PatrocinadoresPorEquipos pae
LEFT JOIN Equipos equipo ON pae.idEquipo = equipo.idEquipo
LEFT JOIN Patrocinadores patrocinador ON pae.idPatrocinador = patrocinador.idPatrocinador
ORDER BY equipo.idEquipo;


--Vista datos de Personas
CREATE OR REPLACE VIEW vistaPersonas AS
SELECT persona.idPersona,
	CONCAT(persona.primerNombre, ' ', persona.primerApellido, ' ', persona.segundoApellido) AS "nombrecompleto",
	persona.fechaDeNacimiento,
	persona.fechaDeRetiro,
	pais.idPais AS "idpaisnacimiento",
	pais.nombre AS "paisdenacimiento"
FROM Personas persona
LEFT JOIN Paises pais ON persona.idPaisNacimiento = pais.idPais
ORDER BY persona.idPersona;

--Vista datos de DirectoresGenerales
CREATE OR REPLACE VIEW vistaDirectoresGenerales AS
SELECT directorG.idPersona,
	CONCAT(persona.primerNombre, ' ', persona.primerApellido, ' ', persona.segundoApellido) AS "nombrecompleto",
	persona.fechaDeNacimiento,
	persona.fechaDeRetiro,
	pais.idPais AS "idpaisdenacimiento",
	pais.nombre AS "paisdenacimiento"
FROM DirectoresGenerales directorG
LEFT JOIN Personas persona ON directorG.idPersona = persona.idPersona
LEFT JOIN Paises pais ON persona.idPaisNacimiento = pais.idPais
ORDER BY directorG.idPersona;

--Vista datos de DirectoresDeportivos 
CREATE OR REPLACE VIEW vistaDirectoresDeportivos AS
SELECT directorD.idPersona,
	CONCAT(persona.primerNombre, ' ', persona.primerApellido, ' ', persona.segundoApellido) AS "nombrecompleto",
	persona.fechaDeNacimiento,
	persona.fechaDeRetiro,
	pais.idPais AS "idpaisdenacimiento",
	pais.nombre AS "paisdenacimiento"
FROM DirectoresDeportivos directorD
LEFT JOIN Personas persona ON directorD.idPersona = persona.idPersona
LEFT JOIN Paises pais ON persona.idPaisNacimiento = pais.idPais
ORDER BY directorD.idPersona;

--Vista datos de Ciclistas
CREATE OR REPLACE VIEW vistaCiclista AS
SELECT ciclista.idPersona,
	CONCAT(persona.primerNombre, ' ', persona.primerApellido, ' ', persona.segundoApellido) AS "nombrecompleto",
	persona.fechaDeNacimiento,
	persona.fechaDeRetiro,
	pais.idPais AS "idpaisdenacimiento",
	pais.nombre AS "paisdenacimiento"
FROM Ciclistas ciclista
LEFT JOIN Personas persona ON ciclista.idPersona = persona.idPersona
LEFT JOIN Paises pais ON persona.idPaisNacimiento = pais.idPais
ORDER BY ciclista.idPersona;

--Vista datos de ParticipacionesCiclistasPorEdicion
CREATE OR REPLACE VIEW VistaParticipacionesCiclistasPorEdicion AS
SELECT ppe.idParticipacionCiclistaPorEdicion,
	ciclista.idPersona AS "idciclista",
    CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS "ciclista",
	ppe.dorsal,
	directorG.idPersona AS "idDirectorGeneral",
    CONCAT(directorG.primerNombre, ' ', directorG.primerApellido, ' ', directorG.segundoApellido) AS "directorgeneral",
	directorD.idPersona AS "iddirectordeportivo",
    CONCAT(directorG.primerNombre, ' ', directorD.primerApellido, ' ', directorD.segundoApellido) AS "directordeportivo",
   	edicion.idEdicion As "idEdicion",
   	edicion.fechaInicio AS "inicioedicion",
	equipo.idEquipo AS "idEquipo",
    equipo.nombre AS "equipo"
FROM ParticipacionesCiclistasPorEdicion ppe
LEFT JOIN ParticipacionesEquiposPorEdicion ppep ON ppe.idequipo = ppep.idequipo
LEFT JOIN Personas ciclista ON ppe.idCiclista = ciclista.idPersona
LEFT JOIN Personas directorG ON ppep.idDirectorGeneral = directorG.idPersona
LEFT JOIN Personas directorD ON ppep.idDirectorDeportivo = directorD.idPersona
LEFT JOIN Ediciones edicion ON ppe.idEdicion = edicion.idEdicion
LEFT JOIN Equipos equipo ON ppe.idEquipo = equipo.idEquipo
ORDER BY ppe.idParticipacionCiclistaPorEdicion;

--Vista detos de ParticipacionesEquiposPorEdicion
CREATE OR REPLACE VIEW VistaParticipacionesEquiposPorEdicion AS
SELECT 
	ppep.idParticipacionEquipoPorEdicion,
	equipo.idEquipo AS "idEquipo",
    equipo.nombre AS "equipo",
	directorG.idPersona AS "idDirectorGeneral",
    CONCAT(directorG.primerNombre, ' ', directorG.primerApellido, ' ', directorG.segundoApellido) AS "directorgeneral",
	directorD.idPersona AS "iddirectordeportivo",
    CONCAT(directorG.primerNombre, ' ', directorD.primerApellido, ' ', directorD.segundoApellido) AS "directordeportivo",
   	edicion.idEdicion As "idEdicion",
   	edicion.fechaInicio AS "inicioedicion"
FROM ParticipacionesEquiposPorEdicion ppep
LEFT JOIN Personas directorG ON ppep.idDirectorGeneral = directorG.idPersona
LEFT JOIN Personas directorD ON ppep.idDirectorDeportivo = directorD.idPersona
LEFT JOIN Ediciones edicion ON ppep.idEdicion = edicion.idEdicion
LEFT JOIN Equipos equipo ON ppep.idEquipo = equipo.idEquipo
ORDER BY ppep.idParticipacionEquipoPorEdicion;

--Vista datos de Etapas
CREATE OR REPLACE VIEW VistaEtapas AS
SELECT etapa.idEtapa,
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaedicion",
	ciudadSalida.idCiudad AS "idciudadsalida",
	ciudadSalida.nombre AS "ciudadsalida",
	ciudadLlegada.idCiudad AS "idciudadllegada",
	ciudadLlegada.nombre AS "ciudadLlegada",
	dificultad.idDificultadEtapa AS "iddificultad",
	dificultad.nombre AS "dificultad",
	tipoEtapa.idTipoEtapa AS "idtipoetapa",
	tipoEtapa.nombre AS "tipoetapa",
	etapa.numeroEtapa,
	etapa.fechaRealizacion,
	etapa.alturaMaxima AS "altura(m)",
	etapa.distancia AS "distanciaTotal(km)"
FROM Etapas etapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
LEFT JOIN Ciudades ciudadSalida ON etapa.idCiudadSalida = ciudadSalida.idCiudad
LEFT JOIN Ciudades ciudadLlegada ON etapa.idCiudadLlegada = ciudadLlegada.idCiudad
LEFT JOIN DificultadesEtapas dificultad ON etapa.idDificultad = dificultad.idDificultadEtapa
LEFT JOIN TiposDeEtapas tipoEtapa ON etapa.idTipoEtapa = tipoEtapa.idTipoEtapa
ORDER BY etapa.idEtapa;

--Vista datos PatrocinadoresPorEdiciones
CREATE OR REPLACE VIEW VistaPatrocinadoresPorEdiciones AS
SELECT edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaedicion",
	patrocinador.idPatrocinador AS "idpatrocinador",
	patrocinador.nombre AS "patrocinador"
FROM PatrocinadoresPorEdiciones ppe
LEFT JOIN Ediciones edicion ON ppe.idEdicion = edicion.idEdicion
LEFT JOIN Patrocinadores patrocinador ON ppe.idPatrocinador = patrocinador.idPatrocinador
ORDER BY edicion.idEdicion;

--Vista datos de Accidentes
CREATE OR REPLACE VIEW VistaAccidentes AS
SELECT accidente.idAccidente,
	tipoAccidente.idTipoAccidente AS"idtipoaccidente",
	tipoAccidente.nombre AS "tipoaccidente",
	ciclista.idPersona AS "idciclista",
	CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS "ciclista",
	ciclistaPartipante.dorsal,
	equipo.idEquipo AS "idequipo",
	equipo.nombre AS "equipo",
	etapa.idEtapa AS "idetapa",
	etapa.numeroEtapa AS "numeroetapa",
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaedicion",
	accidente.hora,
	accidente.descripcion
FROM Accidentes accidente
LEFT JOIN TiposDeAccidentes tipoAccidente ON accidente.idTipoAccidente = tipoAccidente.idTipoAccidente
LEFT JOIN ParticipacionesCiclistasPorEdicion ciclistaPartipante ON accidente.idCiclistaParticipacionPorEdicion = ciclistaPartipante.idParticipacionCiclistaPorEdicion
LEFT JOIN Personas ciclista ON ciclistaPartipante.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON equipo.idEquipo = ciclistaPartipante.idEquipo
LEFT JOIN Etapas etapa ON accidente.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
ORDER BY accidente.idAccidente;

--Vista datos de Puestos
CREATE OR REPLACE VIEW VistaPuestos AS
SELECT puesto.idPuesto,
	puesto.puesto,
	tipoClasificacion.idTipoClasificacion AS "idtipoclasificacion",
	tipoClasificacion.nombre AS "tipoclasificacion",
	ciclista.idPersona AS "idciclista",
	CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS "ciclista",
	ciclistaPartipante.dorsal,
	equipo.idEquipo AS "idequipo",
	equipo.nombre AS "equipo",
	etapa.idEtapa AS "idetapa",
	etapa.numeroEtapa AS "numeroetapa",
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaEdicion"
FROM Puestos puesto
LEFT JOIN TiposDeClasificaciones tipoClasificacion ON puesto.idTipoClasificacion = tipoClasificacion.idTipoClasificacion
LEFT JOIN ParticipacionesCiclistasPorEdicion ciclistaPartipante ON puesto.idCiclistaParticipacionPorEdicion = ciclistaPartipante.idParticipacionCiclistaPorEdicion
LEFT JOIN Personas ciclista ON ciclistaPartipante.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON equipo.idEquipo = ciclistaPartipante.idEquipo
LEFT JOIN Etapas etapa ON puesto.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
ORDER BY puesto.idPuesto;

--Vista datos de MetasParciales
CREATE OR REPLACE VIEW VistaMetasParciales AS
SELECT metaParcial.idMetaParcial,
	tipoMetaParcial.idTipoMetaParcial AS "idtipometaparcial",
	tipoMetaParcial.nombre AS "tipometaparcial",
	etapa.idEtapa AS "idetapa",
	etapa.numeroEtapa AS "numeroetapa",
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaEdicion",
	metaParcial.nombre AS "nombremetaparcial",
	metaParcial.kilometroFinal,
	metaParcial.altitud
FROM MetasParciales metaParcial
LEFT JOIN TiposDeMetasParciales tipoMetaParcial ON metaParcial.idTipoMetaParcial = tipoMetaParcial.idTipoMetaParcial
LEFT JOIN Etapas etapa ON metaParcial.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
ORDER BY metaParcial.idMetaParcial;

--Vista datos de Abandonos
CREATE OR REPLACE VIEW VistaAbandonos AS
SELECT abandono.idAbandono,
	ciclista.idPersona AS "idciclista",
	CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS "ciclista",
	ciclistaPartipante.dorsal,
	equipo.idEquipo AS "idequipo",
	equipo.nombre AS "equipo",
	tipoAbandono.idTipoDeAbandono AS"idtipoabanono",
	tipoAbandono.nombre AS "tipoabandono",
	etapa.idEtapa AS "idetapa",
	etapa.numeroEtapa AS "numeroetapa",
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaedicion"
FROM Abandonos abandono
LEFT JOIN ParticipacionesCiclistasPorEdicion ciclistaPartipante ON abandono.idCiclistaParticipacionPorEdicion = ciclistaPartipante.idParticipacionCiclistaPorEdicion
LEFT JOIN Personas ciclista ON ciclistaPartipante.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON equipo.idEquipo = ciclistaPartipante.idEquipo
LEFT JOIN TiposDeAbandonos tipoAbandono ON abandono.idTipoAbandono = tipoAbandono.idTipoDeAbandono
LEFT JOIN Etapas etapa ON abandono.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
ORDER BY abandono.idAbandono;

--Vista datos de Puntos
CREATE OR REPLACE VIEW VistaPuntos AS
SELECT punto.idPunto,
	etapa.idEtapa AS "idetapa",
	etapa.numeroEtapa AS "numeroetapa",
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaedicion",
	ciclista.idPersona AS "idciclista",
	CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS "ciclista",
	ciclistaPartipante.dorsal,
	equipo.idEquipo "idequipo",
	equipo.nombre AS "equipo",
	punto.puntosGeneral,
	punto.puntosMontaña
FROM Puntos punto
LEFT JOIN ParticipacionesCiclistasPorEdicion ciclistaPartipante ON punto.idCiclistaParticipacionPorEdicion = ciclistaPartipante.idParticipacionCiclistaPorEdicion
LEFT JOIN Personas ciclista ON ciclistaPartipante.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON equipo.idEquipo = ciclistaPartipante.idEquipo
LEFT JOIN Etapas etapa ON punto.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
ORDER BY punto.idPunto;

--Vista datos de Bonificaciones
CREATE OR REPLACE VIEW VistaBonificaciones AS
SELECT bonificacion.idBonificacion,
	etapa.idEtapa AS "idetapa",
	etapa.numeroEtapa AS "numeroetapa",
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaedicion",
	ciclista.idPersona AS "idciclista",
	CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS "ciclista",
	ciclistaPartipante.dorsal,
	equipo.idEquipo AS "idequipo",
	equipo.nombre AS "equipo",
	bonificacion.bonificacion
FROM Bonificaciones bonificacion
LEFT JOIN ParticipacionesCiclistasPorEdicion ciclistaPartipante ON bonificacion.idCiclistaParticipacionPorEdicion = ciclistaPartipante.idParticipacionCiclistaPorEdicion
LEFT JOIN Personas ciclista ON ciclistaPartipante.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON equipo.idEquipo = ciclistaPartipante.idEquipo
LEFT JOIN Etapas etapa ON bonificacion.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
ORDER BY bonificacion.idBonificacion;

--Vista datos de Tiempos
CREATE OR REPLACE VIEW VistaTiempos AS
SELECT tiempo.idTiempo,
	etapa.idEtapa AS "idetapa",
	etapa.numeroEtapa AS "numeroetapa",
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaedicion",
	ciclista.idPersona AS "idciclista",
	CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS "ciclista",
	ciclistaPartipante.dorsal,
	equipo.idEquipo AS"idequipo", 
	equipo.nombre AS "equipo",
	tiempo.tiempo
FROM Tiempos tiempo
LEFT JOIN ParticipacionesCiclistasPorEdicion ciclistaPartipante ON tiempo.idCiclistaParticipacionPorEdicion = ciclistaPartipante.idParticipacionCiclistaPorEdicion
LEFT JOIN Personas ciclista ON ciclistaPartipante.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON equipo.idEquipo = ciclistaPartipante.idEquipo
LEFT JOIN Etapas etapa ON tiempo.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
ORDER BY tiempo.idTiempo;

--Vista datos de Penalizaciones
CREATE OR REPLACE VIEW VistaPenalizaciones AS
SELECT penalizacion.idPenalizacion,
	etapa.idEtapa AS "idetapa",
	etapa.numeroEtapa AS "numeroetapa",
	edicion.idEdicion AS "idedicion",
	edicion.fechaInicio AS "fechaedicion",
	ciclista.idPersona AS "idciclista",
	CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS "ciclista",
	equipo.idEquipo AS "idequipo",
	ciclistaPartipante.dorsal,
	equipo.nombre AS "equipo",
	penalizacion.penalizacion 
FROM Penalizaciones penalizacion
LEFT JOIN ParticipacionesCiclistasPorEdicion ciclistaPartipante ON penalizacion.idCiclistaParticipacionPorEdicion = ciclistaPartipante.idParticipacionCiclistaPorEdicion
LEFT JOIN Personas ciclista ON ciclistaPartipante.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON equipo.idEquipo = ciclistaPartipante.idEquipo
LEFT JOIN Etapas etapa ON penalizacion.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
ORDER BY penalizacion.idPenalizacion;


