/* 1. Función que calcula la diferencia de tiempo en la llegada de dos ciclistas en 
una etapa, dada la edición, etapa e id de ambos*/

CREATE OR REPLACE FUNCTION obtenerDiferenciaTiempo(
    _idEdicion INT,
    _idEtapa INT,
    _idPrimerCiclista INT,
    _idSegundoCiclista INT) 
RETURNS INTERVAL AS
$$
	DECLARE
	    tiempoPrimerCiclista INTERVAL;
	    tiempoSegundoCiclista INTERVAL;
	    diferenciaTiempo INTERVAL;
	BEGIN
	    -- Obtener el tiempo del primer ciclista
	    SELECT tiempo INTO tiempoPrimerCiclista
	    FROM Tiempos
	    WHERE idEtapa = _idEtapa AND idCiclistaParticipacionPorEdicion = _idPrimerCiclista;
		
	    -- Obtener el tiempo del segundo ciclista
	    SELECT tiempo INTO tiempoSegundoCiclista
	    FROM Tiempos
	    WHERE idEtapa = _idEtapa AND idCiclistaParticipacionPorEdicion = _idSegundoCiclista;
	
	    -- Calcular la diferencia de tiempo
	    diferenciaTiempo := tiempoSegundoCiclista - tiempoPrimerCiclista;
	
	    RETURN diferenciaTiempo;
	END;
$$ 
LANGUAGE plpgsql;

SELECT * FROM obtenerDiferenciaTiempo(1, 2, 31, 32) AS diferenciaTiempo1; 


/* 2. Funcion que calcula la etapa con mayor cantidad de bonificaciones dado el año de la edición, retornando
dicha etapa y el número de bonificaciones ganadas en la etapa
*/

CREATE OR REPLACE FUNCTION etapaConMasBonificaciones(añoEdicion INT)
RETURNS TABLE(idEtapa INT, numeroBonificaciones INTEGER) AS $$
BEGIN
    RETURN QUERY
    SELECT b.idEtapa, COUNT(*) :: INTEGER AS numeroBonificaciones
    FROM Bonificaciones b
    INNER JOIN ParticipacionesCiclistasPorEdicion pce ON b.idCiclistaParticipacionPorEdicion = pce.idParticipacionCiclistaPorEdicion
    INNER JOIN Etapas e ON b.idEtapa = e.idEtapa
    INNER JOIN Ediciones ed ON e.idEdicion = ed.idEdicion
    WHERE EXTRACT(YEAR FROM ed.fechaInicio) = añoEdicion
    GROUP BY b.idEtapa
    ORDER BY numeroBonificaciones DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM etapaConMasBonificaciones(2023);


/* 3. ¿Cuáles son todas las etapas de la edición 2023 que tienen como meta parcial 
un Sprint o Montaña Categoría 1?*/

CREATE OR REPLACE FUNCTION obtenerNumerosEtapaPorMeta(edic DATE, tiposMetas TEXT[])
RETURNS TABLE (
    fechaEdicion DATE,
    numeroEtapa INT,
    ciudadSalida VARCHAR,
    ciudadLlegada VARCHAR,
    fechaRealizacion DATE,
    alturaMaxima NUMERIC(6,2),
    distanciaTotal NUMERIC(6,2),
    tipoEtapa VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT ON(etapa.numeroEtapa)
        edicion.fechaInicio AS fechaEdicion,
        etapa.numeroEtapa AS numeroEtapa,
        ciudadSal.nombre AS ciudadSalida,
        ciudadLleg.nombre AS ciudadLlegada,
        etapa.fechaRealizacion AS fechaRealizacion,
        etapa.alturaMaxima AS alturaMaxima,
        etapa.distancia AS distanciaTotal,
        tipoEtapa.nombre AS tipoEtapa
    FROM MetasParciales mp
	LEFT JOIN Etapas etapa ON mp.idEtapa = etapa.idEtapa
    LEFT JOIN Ediciones edicion ON etapa.idedicion = edicion.idedicion
    LEFT JOIN Ciudades ciudadSal ON etapa.idciudadsalida = ciudadSal.idciudad
    LEFT JOIN Ciudades ciudadLleg ON etapa.idciudadllegada = ciudadLleg.idciudad
    LEFT JOIN TiposDeEtapas tipoEtapa ON etapa.idTipoEtapa = tipoetapa.idtipoetapa
	LEFT JOIN tiposDeMetasParciales tmp ON mp.idTipoMetaParcial = tmp.idTipoMetaParcial
    WHERE edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
    AND tmp.nombre = ANY(tiposMetas)
    ORDER BY etapa.numeroEtapa;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM obtenerNumerosEtapaPorMeta('2023-08-26', ARRAY['Sprint', 'Montaña categoria 1']);


-- 4. ¿Cuál es la etapa que más accidentes ha presentado entre las ediciones de la Vuelta a España 2023 y 2024?

CREATE OR REPLACE FUNCTION etapaConMasAccidentesEdicion(fechas TEXT[])
RETURNS TABLE (
    idEtapa INTEGER,
	numeroEtapa INTEGER,
	fechaInicioEdicion DATE,
	fechaFinalizacionEdicion DATE,
    totalAccidentesEnEtapa BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
	etapa.idEtapa AS idEtapa,
	etapa.numeroEtapa AS numeroEtapa,
	edicion.fechaInicio AS fechaInicioEdicion,
	edicion.fechaFinalizacion AS fechaFinalizacionEdicion,
	COUNT(accidente.idAccidente) AS totalAccidentesEnEtapa
	FROM Etapas etapa
	LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
	LEFT JOIN Accidentes accidente ON etapa.idEtapa = accidente.idEtapa
	WHERE EXTRACT(YEAR FROM edicion.fechaInicio)::TEXT = ANY(fechas)
	GROUP BY etapa.idEtapa, edicion.fechaInicio, edicion.fechaFinalizacion
	ORDER BY totalAccidentesEnEtapa DESC
	LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM etapaConMasAccidentesEdicion(ARRAY['2023', '2024']);


-- 5. Dada una etapa y una edicion mostrar la clasificacion individual de esa etapa

CREATE OR REPLACE FUNCTION clasificacionIndividual(numEtapa INT, edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Corredor TEXT,
    Equipo VARCHAR,
    Tiempos TIME,
	Diferencia INTERVAL,
	B TIME,
	P TIME
) AS $$
BEGIN
    RETURN QUERY
		SELECT puesto.puesto AS Puesto,
		CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS Corredor,
		equipo.nombre AS Equipo,
		tiempo.tiempo AS Tiempos,
		(tiempo.tiempo - (
			SELECT tiempo.tiempo
			FROM tiempos tiempo
			LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON tiempo.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
			LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
			LEFT JOIN Etapas etapa ON tiempo.idEtapa = etapa.idEtapa
			LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
			WHERE etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
			ORDER BY tiempo.tiempo ASC
			LIMIT 1
		)) AS Diferencia,
		COALESCE(bonificacion.bonificacion, '00:00:00') AS B,
		COALESCE(penalizacion.penalizacion, '00:00:00') AS P
		FROM Puestos puesto
		LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON puesto.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
		LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
		LEFT JOIN TiposDeClasificaciones tp ON puesto.idTipoClasificacion = tp.idTipoClasificacion
		LEFT JOIN Tiempos tiempo ON puesto.idEtapa = tiempo.idEtapa AND puesto.idCiclistaParticipacionPorEdicion = tiempo.idCiclistaParticipacionPorEdicion
		LEFT JOIN Bonificaciones bonificacion ON puesto.idEtapa = bonificacion.idEtapa AND puesto.idCiclistaParticipacionPorEdicion = bonificacion.idCiclistaParticipacionPorEdicion
		LEFT JOIN Penalizaciones penalizacion ON puesto.idEtapa = penalizacion.idEtapa AND puesto.idCiclistaParticipacionPorEdicion = penalizacion.idCiclistaParticipacionPorEdicion
		LEFT JOIN Equipos equipo ON participante.idEquipo = equipo.idEquipo
		LEFT JOIN Etapas etapa ON puesto.idEtapa = etapa.idEtapa
		LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
		WHERE tp.nombre = 'Individual' AND etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
		ORDER BY Puesto ASC;
END
$$ LANGUAGE plpgsql;

SELECT * FROM clasificacionIndividual(4, '2023-08-26');
SELECT * FROM clasificacionIndividual(2, '2024-08-24');


-- 6. Dada una etapa y una edicion mostrar la clasificacion de puntos de esa etapa

CREATE OR REPLACE FUNCTION clasificacionPuntosGenerales(numEtapa INT, edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Corredor TEXT,
    Equipo VARCHAR,
    Puntos INTEGER
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        puest.puesto AS Puesto,
        CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS Corredor,
        equipo.nombre AS Equipo,
        COALESCE(punto.puntosGeneral, 0) AS Puntos
    FROM Puestos puest
    LEFT JOIN Puntos punto ON puest.idCiclistaParticipacionPorEdicion = punto.idCiclistaParticipacionPorEdicion AND puest.idetapa = punto.idetapa
    LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON puest.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
    LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
    LEFT JOIN Equipos equipo ON equipo.idEquipo = participante.idEquipo
    LEFT JOIN TiposDeClasificaciones tp ON puest.idTipoClasificacion = tp.idTipoClasificacion
    LEFT JOIN Etapas etapa ON puest.idEtapa = etapa.idEtapa
    LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
    WHERE tp.nombre = 'Puntos'
    AND etapa.numeroEtapa = numEtapa
    AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
    ORDER BY puest.puesto;
END
$$ LANGUAGE plpgsql;

SELECT * FROM clasificacionPuntosGenerales(2, '2023-08-26');
SELECT * FROM clasificacionPuntosGenerales(2, '2024-08-24');

--7. Dada una etapa y una edicion mostrar la clasificacion de puntos de montaña de esa etapa

CREATE OR REPLACE FUNCTION clasificacionPuntosMontaña(numEtapa INT, edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Corredor TEXT,
    Equipo VARCHAR,
    Puntos INTEGER
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        puest.puesto AS Puesto,
        CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS Corredor,
        equipo.nombre AS Equipo,
        COALESCE(punto.puntosMontaña, 0) AS Puntos
    FROM Puestos puest
    LEFT JOIN Puntos punto ON puest.idCiclistaParticipacionPorEdicion = punto.idCiclistaParticipacionPorEdicion AND puest.idEtapa = punto.idetapa
    LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON puest.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
    LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
    LEFT JOIN Equipos equipo ON equipo.idEquipo = participante.idEquipo
    LEFT JOIN TiposDeClasificaciones tp ON puest.idTipoClasificacion = tp.idTipoClasificacion
    LEFT JOIN Etapas etapa ON puest.idEtapa = etapa.idEtapa
    LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
    WHERE tp.nombre = 'Montaña'
    AND etapa.numeroEtapa = numEtapa
    AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
    ORDER BY puest.puesto;
END
$$ LANGUAGE plpgsql;

SELECT * FROM clasificacionPuntosMontaña(2, '2023-08-26');
SELECT * FROM clasificacionPuntosMontaña(2, '2024-08-24');


-- 8. Dada una etapa y una edicion mostrar la clasificacion de Joven de esa etapa

CREATE OR REPLACE FUNCTION clasificacionJoven(numEtapa INT, edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Corredor TEXT,
    Equipo VARCHAR,
    Tiempos TIME,
	Diferencia INTERVAL,
	B TIME,
	P TIME
) AS $$
BEGIN
    RETURN QUERY
		SELECT puesto.puesto AS Puesto,
		CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS Corredor,
		equipo.nombre AS Equipo,
		tiempo.tiempo AS Tiempos,
		(tiempo.tiempo - (
			SELECT tiempo.tiempo
			FROM tiempos tiempo
			LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON tiempo.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
			LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
			LEFT JOIN Etapas etapa ON tiempo.idEtapa = etapa.idEtapa
			LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
			WHERE etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
			ORDER BY tiempo.tiempo ASC
			LIMIT 1
		)) AS Diferencia,
		COALESCE(bonificacion.bonificacion, '00:00:00') AS B,
		COALESCE(penalizacion.penalizacion, '00:00:00') AS P
		FROM Puestos puesto
		LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON puesto.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
		LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
		LEFT JOIN TiposDeClasificaciones tp ON puesto.idTipoClasificacion = tp.idTipoClasificacion
		LEFT JOIN Tiempos tiempo ON puesto.idEtapa = tiempo.idEtapa AND puesto.idCiclistaParticipacionPorEdicion = tiempo.idCiclistaParticipacionPorEdicion
		LEFT JOIN Bonificaciones bonificacion ON puesto.idEtapa = bonificacion.idEtapa AND puesto.idCiclistaParticipacionPorEdicion = bonificacion.idCiclistaParticipacionPorEdicion
		LEFT JOIN Penalizaciones penalizacion ON puesto.idEtapa = penalizacion.idEtapa AND puesto.idCiclistaParticipacionPorEdicion = penalizacion.idCiclistaParticipacionPorEdicion
		LEFT JOIN Equipos equipo ON participante.idEquipo = equipo.idEquipo
		LEFT JOIN Etapas etapa ON puesto.idEtapa = etapa.idEtapa
		LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
		WHERE tp.nombre = 'Joven' AND etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
		ORDER BY Puesto ASC;
END
$$ LANGUAGE plpgsql;

SELECT * FROM clasificacionJoven(2, '2023-08-26');
SELECT * FROM clasificacionJoven(2, '2024-08-24');


--9. Dada una etapa y una edicion mostrar la clasificacion de Equipos de esa etapa

CREATE OR REPLACE FUNCTION clasificacionEquipos(numEtapa INT, edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Equipo VARCHAR,
	Tiempos INTERVAL,
    Diferencia INTERVAL,
	Penalizacion TIME
) AS $$
BEGIN
    RETURN QUERY
		SELECT 
		puesto.puesto AS Puesto,
		equipo.nombre AS Equipo,
		(SELECT SUM(tiempo.tiempo) FROM (
			SELECT tiempo
			FROM Tiempos t
			LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON t.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
			LEFT JOIN Equipos nombreEquipo ON participante.idEquipo = nombreEquipo.idEquipo
			LEFT JOIN Etapas etapa ON t.idEtapa = etapa.idEtapa
			LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
			WHERE etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
			AND nombreEquipo.nombre = equipo.nombre
			ORDER BY tiempo ASC
			LIMIT 3
		) AS tiempo) AS Tiempos,
		 (
			(SELECT SUM(tiempo.tiempo) FROM (
				SELECT tiempo
				FROM Tiempos t
				LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON t.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
				LEFT JOIN Equipos nombreEquipo ON participante.idEquipo = nombreEquipo.idEquipo
				LEFT JOIN Etapas etapa ON t.idEtapa = etapa.idEtapa
				LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
				WHERE etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
				AND nombreEquipo.nombre = equipo.nombre
				ORDER BY tiempo ASC
				LIMIT 3) AS tiempo)
		) - (
			SELECT CAST(tiempoMinimo.totalTiempo AS TIME) AS tiempo_convertido
			FROM (
				SELECT 
					(
						SELECT SUM(t.tiempo)
						FROM (
							SELECT tiempo.tiempo
							FROM Tiempos tiempo
							LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON tiempo.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
							LEFT JOIN Equipos nombreEquipo ON participante.idEquipo = nombreEquipo.idEquipo
							LEFT JOIN Etapas etapa ON tiempo.idEtapa = etapa.idEtapa
							LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
							WHERE etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion 
							AND nombreEquipo.nombre = equipo.nombre
							ORDER BY tiempo.tiempo ASC
							LIMIT 3
						) AS t
					) AS totalTiempo
				FROM Equipos equipo
				LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON equipo.idEquipo = participante.idEquipo
				LEFT JOIN Tiempos tiempo ON participante.idParticipacionCiclistaPorEdicion = tiempo.idCiclistaParticipacionPorEdicion
				LEFT JOIN Etapas etapa ON tiempo.idEtapa = etapa.idEtapa
				LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
				WHERE etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion
				GROUP BY equipo.nombre
				ORDER BY totalTiempo ASC ) AS tiempoMinimo
				LIMIT 1 ) AS Diferencia,
		COALESCE(penalizacion.penalizacion, '00:00:00') AS Penalizacion
	FROM Puestos puesto
	LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON puesto.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
	LEFT JOIN Equipos equipo ON participante.idEquipo = equipo.idEquipo
	LEFT JOIN Tiempos tiempo ON puesto.idEtapa = tiempo.idEtapa AND puesto.idCiclistaParticipacionPorEdicion = tiempo.idCiclistaParticipacionPorEdicion
	LEFT JOIN Etapas etapa ON tiempo.idEtapa = etapa.idEtapa
	LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idedicion
	LEFT JOIN Penalizaciones penalizacion ON puesto.idEtapa = penalizacion.idEtapa AND puesto.idCiclistaParticipacionPorEdicion = penalizacion.idCiclistaParticipacionPorEdicion
	LEFT JOIN tiposdeclasificaciones tipoCap ON puesto.idtipoclasificacion = tipoCap.idtipoclasificacion
	WHERE tipoCap.nombre = 'Equipo' AND etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion  
	ORDER BY puesto.puesto;
END
$$ LANGUAGE plpgsql;

SELECT * FROM clasificacionEquipos(2, '2023-08-26');
SELECT * FROM clasificacionEquipos(2, '2024-08-24');


--10. Dada una etapa y una edicion mostrar la clasificacion de Combativo de esa etapa

CREATE OR REPLACE FUNCTION clasificacionCombativo(numEtapa INT, edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Corredor TEXT,
    Equipo VARCHAR
) AS $$
BEGIN
    RETURN QUERY  
	SELECT puesto.puesto AS Puesto,
		CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS Corredor,
		equipo.nombre AS Equipo
	FROM Puestos puesto 
	LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON puesto.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
	LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
	LEFT JOIN Equipos equipo ON participante.idEquipo = equipo.idEquipo 
	LEFT JOIN Etapas etapa ON puesto.idetapa = etapa.idetapa
	LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
	LEFT JOIN tiposdeclasificaciones tipoCap ON puesto.idtipoclasificacion = tipoCap.idtipoclasificacion
	WHERE tipoCap.nombre = 'Combativo' AND etapa.numeroEtapa = numEtapa AND edic BETWEEN edicion.fechaInicio AND edicion.fechaFinalizacion;
END
$$ LANGUAGE plpgsql;

SELECT * FROM clasificacionCombativo(2, '2023-08-26');
SELECT * FROM clasificacionCombativo(2, '2024-08-24');



--11. Dada una edicion calcular la clasificaion general individual hasta la ultima etapa en la que va la edicion
CREATE OR REPLACE FUNCTION clasificacionGeneralIndividual(edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Corredor TEXT,
    Equipo VARCHAR,
    Tiempos INTERVAL,
    Diferencia INTERVAL,
    B INTERVAL,
    P INTERVAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        ROW_NUMBER() OVER (ORDER BY SUM(tiempo.tiempo) ASC)::integer AS Puesto,
        CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS Corredor,
        equipo.nombre AS Equipo,
        SUM(tiempo.tiempo) AS Tiempos,
        SUM(tiempo.tiempo) - MIN(SUM(tiempo.tiempo)) OVER () AS Diferencia,
        SUM(COALESCE(bonificacion.bonificacion, '00:00:00')) AS B,
        SUM(COALESCE(penalizacion.penalizacion, '00:00:00')) AS P
    FROM Tiempos tiempo
    LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON tiempo.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
    LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
    LEFT JOIN Equipos equipo ON participante.idEquipo = equipo.idEquipo
    LEFT JOIN Bonificaciones bonificacion ON tiempo.idEtapa = bonificacion.idEtapa AND tiempo.idCiclistaParticipacionPorEdicion = bonificacion.idCiclistaParticipacionPorEdicion
    LEFT JOIN Penalizaciones penalizacion ON tiempo.idEtapa = penalizacion.idEtapa AND tiempo.idCiclistaParticipacionPorEdicion = penalizacion.idCiclistaParticipacionPorEdicion
    LEFT JOIN Etapas etapa ON tiempo.idEtapa = etapa.idEtapa
    LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
    WHERE edicion.fechaInicio <= edic AND edicion.fechaFinalizacion >= edic
    GROUP BY ciclista.primerNombre, ciclista.primerApellido, ciclista.segundoApellido, equipo.nombre
    ORDER BY Tiempos ASC;
END
$$ LANGUAGE plpgsql;

SELECT * FROM clasificacionGeneralIndividual('2023-08-26');
SELECT * FROM clasificacionGeneralIndividual('2024-08-24');


--12. Dada una edicion calcular la clasificaion de puntos hasta la ultima etapa en la que va la edicion
CREATE OR REPLACE FUNCTION clasificacionGeneralPuntosG(edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Corredor TEXT,
    Equipo VARCHAR,
    Puntos INTEGER
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        ROW_NUMBER() OVER (ORDER BY SUM(punto.puntosGeneral) DESC)::integer AS Puesto,
        CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS Corredor,
        equipo.nombre AS Equipo,
        SUM(COALESCE(punto.puntosGeneral, 0))::integer AS Puntos
    FROM Puntos punto
    LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON punto.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
    LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
    LEFT JOIN Equipos equipo ON participante.idEquipo = equipo.idEquipo
    LEFT JOIN Etapas etapa ON punto.idEtapa = etapa.idEtapa
    LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
    WHERE edicion.fechaInicio <= edic AND edicion.fechaFinalizacion >= edic
    GROUP BY ciclista.primerNombre, ciclista.primerApellido, ciclista.segundoApellido, equipo.nombre
    HAVING SUM(COALESCE(punto.puntosGeneral, 0)) > 0
    ORDER BY Puntos DESC;
END
$$ LANGUAGE plpgsql;

SELECT * FROM  clasificacionGeneralPuntosG('2023-08-26');
SELECT * FROM  clasificacionGeneralPuntosG('2024-08-24');

--13. Dada una edicion calcular la clasificaion de puntos de montaña hasta la ultima etapa en la que va la edicion
CREATE OR REPLACE FUNCTION clasificacionGeneralPuntosMontañaG(edic DATE)
RETURNS TABLE(
    Puesto INTEGER,
    Corredor TEXT,
    Equipo VARCHAR,
    Puntos INTEGER
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        ROW_NUMBER() OVER (ORDER BY SUM(punto.puntosMontaña) DESC)::integer AS Puesto,
        CONCAT(ciclista.primerNombre, ' ', ciclista.primerApellido, ' ', ciclista.segundoApellido) AS Corredor,
        equipo.nombre AS Equipo,
        SUM(COALESCE(punto.puntosMontaña, 0))::integer AS Puntos
    FROM Puntos punto
    LEFT JOIN ParticipacionesCiclistasPorEdicion participante ON punto.idCiclistaParticipacionPorEdicion = participante.idParticipacionCiclistaPorEdicion
    LEFT JOIN Personas ciclista ON participante.idCiclista = ciclista.idPersona
    LEFT JOIN Equipos equipo ON participante.idEquipo = equipo.idEquipo
    LEFT JOIN Etapas etapa ON punto.idEtapa = etapa.idEtapa
    LEFT JOIN Ediciones edicion ON etapa.idEdicion = edicion.idEdicion
    WHERE edicion.fechaInicio <= edic AND edicion.fechaFinalizacion >= edic
    GROUP BY ciclista.primerNombre, ciclista.primerApellido, ciclista.segundoApellido, equipo.nombre
    HAVING SUM(COALESCE(punto.puntosMontaña, 0)) > 0
    ORDER BY Puntos DESC;
END
$$ LANGUAGE plpgsql;

SELECT * FROM  clasificacionGeneralPuntosMontañaG('2023-08-26');
SELECT * FROM  clasificacionGeneralPuntosMontañaG('2024-08-24');




