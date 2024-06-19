/* 1. ¿Cuál es el numero, distancia, altitud maxima y dificultad de la etapa 
más extensa en km en la edición 2023 de la competición La Vuelta a España? */

CREATE OR REPLACE VIEW VistaEtapaMasExtensa2023 AS
SELECT 
	numeroEtapa, 
	distancia, 
	alturaMaxima,
    (SELECT 
	 	nombre 
	 FROM DificultadesEtapas 
	 WHERE idDificultadEtapa = Etapas.idDificultad) AS dificultad
FROM Etapas
WHERE idEdicion = (
        SELECT 
			idEdicion 
        FROM Ediciones 
        WHERE EXTRACT(YEAR FROM fechaInicio) = 2023
        LIMIT 1 )
ORDER BY distancia DESC
LIMIT 1;

SELECT * FROM VistaEtapaMasExtensa2023;


/* 2. ¿Cuáles fueron los competidores ganadores de las etapas segun su tipo de clasificacion
en la edición 2023 de la competición La Vuelta a España? */

CREATE VIEW GanadoresEtapasClasificaciones2023 AS
SELECT 
    E.numeroEtapa,
    E.fechaRealizacion,
    (SELECT CONCAT(C.primerNombre, ' ', C.primerApellido)
 	FROM Personas C
 	WHERE C.idPersona = PCE.idCiclista) AS NombreCiclista,
    TC.nombre AS TipoClasificacion
FROM Etapas E
INNER JOIN Puestos P ON E.idEtapa = P.idEtapa
INNER JOIN ParticipacionesCiclistasPorEdicion PCE ON P.idCiclistaParticipacionPorEdicion = PCE.idParticipacionCiclistaPorEdicion
INNER JOIN TiposDeClasificaciones TC ON P.idTipoClasificacion = TC.idTipoClasificacion
WHERE 
    P.puesto = 1
    AND E.idEdicion = (SELECT idEdicion FROM Ediciones WHERE EXTRACT(YEAR FROM fechaInicio) = 2023)
ORDER BY E.numeroEtapa;

SELECT * FROM GanadoresEtapasClasificaciones2023; 


/* 3. ¿Cuál es el promedio de tiempo que le llevo a todos los ciclistas
terminar la etapa 2 de la edicón 2023 de la Vuelta a españa?  */

CREATE VIEW PromedioTiempoEtapa2Edición2024 AS
SELECT 
	AVG(tiempo) AS promedioTiempo
FROM Tiempos
WHERE idEtapa = (SELECT 
					idEtapa 
				 FROM Etapas 
				 WHERE numeroEtapa = 2 AND idEdicion = (SELECT 
															idEdicion 
														FROM Ediciones 
														WHERE EXTRACT(YEAR FROM fechaInicio) = 2023
														LIMIT 1
														)
					LIMIT 1
				 );

SELECT * FROM PromedioTiempoEtapa2Edición2024; 


/* 4.¿Cuál fue el promedio de abandonos de los ciclistas que compitieron en la edición
2023 y 2024 de La Vuelta España? */

CREATE VIEW VistaPromedioAbandonos AS
SELECT
    e.idEdicion,
    EXTRACT(YEAR FROM e.fechaInicio) AS año,
    COUNT(DISTINCT p.idCiclista) AS total_ciclistas,
    COUNT(DISTINCT a.idTipoAbandono) AS total_abandonos,
    ROUND(COUNT(DISTINCT a.idTipoAbandono) / COUNT(DISTINCT p.idCiclista)::NUMERIC, 2) AS promedio_abandonos
FROM Ediciones e
JOIN ParticipacionesCiclistasPorEdicion p ON e.idEdicion = p.idEdicion
LEFT JOIN Abandonos a ON p.idParticipacionCiclistaPorEdicion = a.idCiclistaParticipacionPorEdicion
WHERE EXTRACT(YEAR FROM e.fechaInicio) BETWEEN 2023 AND 2024
GROUP BY e.idEdicion, año;

SELECT * FROM VistaPromedioAbandonos;


/* 5. ¿En qué fecha comenzó y en qué fecha finalizó cada edición de la vuelta a España desde el 2023
al 2024 y que equipos ganaron la etapa 2 de cada edición? */

CREATE OR REPLACE VIEW VistaEdicionEquipos AS
SELECT  
    e.idEdicion,
    e.fechaInicio,
    e.fechaFinalizacion,
    eq.nombre AS nombreEquipo
FROM Ediciones e
JOIN Etapas et ON e.idEdicion = et.idEdicion
JOIN Puestos p ON et.idEtapa = p.idEtapa
JOIN ParticipacionesCiclistasPorEdicion ppe ON p.idCiclistaParticipacionPorEdicion = ppe.idParticipacionCiclistaPorEdicion
JOIN Equipos eq ON ppe.idEquipo = eq.idEquipo
WHERE
    e.fechaInicio >= '2023-01-01' AND e.fechaFinalizacion <= '2024-12-31'
    AND p.idTipoClasificacion = 5
	AND p.puesto = 1
	AND et.numeroEtapa= 2; 

SELECT * FROM VistaEdicionEquipos;


/* 6. Cuál fue el recorrido, el ganador, el tiempo que tardo de la   primera  etapa que tuvo
dificultad moderada en la clasificación individual por puntos de la edición 2023 y que tipo de etapa era?*/
						
CREATE VIEW VistaEtapaMayorDificultad AS
SELECT 
    e.idEdicion,
    et.distancia AS recorrido,
    p.primerNombre AS nombre,
    p.primerApellido AS apellido,
    t.tiempo AS tiempo_ganador,
    te.nombre AS tipo_etapa,
	pt.puesto
FROM Ediciones e
JOIN Etapas et ON e.idEdicion = et.idEdicion
JOIN Puestos pt ON et.idEtapa = pt.idEtapa
JOIN DificultadesEtapas de ON et.idDificultad = de.idDificultadEtapa
JOIN Puestos ps ON et.idEtapa = ps.idEtapa
JOIN TiposDeClasificaciones tdc ON ps.idTipoClasificacion = tdc.idTipoClasificacion
JOIN Personas p ON ps.idCiclistaParticipacionPorEdicion = p.idPersona
JOIN Tiempos t ON ps.idCiclistaParticipacionPorEdicion = t.idCiclistaParticipacionPorEdicion
JOIN TiposDeEtapas te ON et.idTipoEtapa = te.idTipoEtapa
WHERE
    EXTRACT(YEAR FROM e.fechaInicio) = 2023
	AND tdc.idTipoClasificacion =  6
	AND et.idDificultad = 2
	AND pt.puesto = 1
	LIMIT 1;

SELECT * FROM VistaEtapaMayorDificultad;


--7. ¿Cuál es el promedio de edad por equipos en la edición más reciente de la Vuelta a España?

CREATE OR REPLACE VIEW vistaPromedioEdadCiclistasEquiposEdicionActual AS
SELECT
    equipo.idEquipo AS idEquipo,
    equipo.nombre AS nombreEquipo,
    ROUND(AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, ciclista.fechaDeNacimiento))), 0) AS promedioDeEdadCiclistas
FROM 
    ParticipacionesCiclistasPorEdicion ppe
LEFT JOIN Personas ciclista ON ppe.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON ppe.idEquipo = equipo.idEquipo
LEFT JOIN Ediciones edicion ON ppe.idEdicion = edicion.idEdicion
WHERE EXTRACT(YEAR FROM edicion.fechaInicio) = (
    SELECT MAX(EXTRACT(YEAR FROM ed.fechaInicio))
    FROM ParticipacionesCiclistasPorEdicion papoed
    LEFT JOIN Ediciones ed ON papoed.idEdicion = ed.idEdicion)
GROUP BY equipo.nombre, equipo.idEquipo
ORDER BY promedioDeEdadCiclistas DESC;

SELECT * FROM vistaPromedioEdadCiclistasEquiposEdicionActual;


--8. ¿Cual es el ciclista que más bonificaciones ganó en la edición 2023?

CREATE OR REPLACE VIEW ciclistasConMasBonificaciones2023 AS
SELECT 
	CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS ciclista,
	equipo.nombre AS nombreEquipo,
	SUM(bonificacion.bonificacion) AS bonificacionTotal
FROM Bonificaciones bonificacion
LEFT JOIN ParticipacionesCiclistasPorEdicion ciclistaPartipante ON bonificacion.idCiclistaParticipacionPorEdicion = ciclistaPartipante.idParticipacionCiclistaPorEdicion
LEFT JOIN Personas ciclista ON ciclistaPartipante.idCiclista = ciclista.idPersona
LEFT JOIN Equipos equipo ON ciclistaPartipante.idEquipo = equipo.idEquipo
LEFT JOIN Etapas etapa ON bonificacion.idEtapa = etapa.idEtapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
WHERE EXTRACT(YEAR FROM edicion.fechaInicio) = '2023'
GROUP BY ciclista, nombreEquipo
ORDER BY bonificacionTotal DESC
LIMIT 1;

SELECT * FROM ciclistasConMasBonificaciones2023;


--9. ¿Cuál es la distancia total recorrida por los competidores en el año 2023 de la Vuelta a España?

CREATE OR REPLACE VIEW recorridoTotalCiclistas2023 AS
SELECT 
	edicion.fechaInicio AS fechaInicioEdicion,
	edicion.fechaFinalizacion AS fechaFinalizacionEdicion,
	SUM(etapa.distancia) AS distanciaTotalKm
FROM Etapas etapa
LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
WHERE EXTRACT(YEAR FROM edicion.fechaInicio) = '2023'
GROUP BY edicion.fechaInicio, edicion.fechaFinalizacion;

SELECT * FROM recorridoTotalCiclistas2023;
