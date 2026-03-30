USE [Rendimiento_Escolar]
GO

/*Estadistica Basica global por fecha*/

SELECT "Date", AVG(APR_MUJ_TO) media,
		STDEV(APR_MUJ_TO) desviacion,
		MIN(APR_MUJ_TO) minimo,
		MAX(APR_MUJ_TO) maximo
FROM Registro
GROUP BY "Date"
ORDER BY "Date"
;


SELECT AVG(APR_HOM_TO) media,
		STDEV(APR_HOM_TO) desviacion,
		MIN(APR_HOM_TO) minimo,
		MAX(APR_HOM_TO) maximo
FROM Registro
where COD_ENSE = 110
;

/*¿Cuales son las regiones que tienen mas establecimientos? ¿Cual es la cantidad de establecimientos rurales y urbano?*/
WITH CTE_Region AS (
	SELECT DISTINCT COD_REG_RBD AS Region,
			 Registro.RBD AS Establecimiento,
			 RURAL_RBD AS Rural
	FROM Registro 
		JOIN REGION ON Registro.RBD = REGION.RBD
	WHERE Registro."Date" = (SELECT MAX("Date") FROM Registro)
)
SELECT  Region,
		COUNT(*) AS Cantidad_Escuelas,
		SUM(CASE WHEN Rural = 0 THEN 1 ELSE 0 END) AS Cantidad_Urbano,
		SUM(CASE WHEN Rural = 1 THEN 1 ELSE 0 END) AS Cantidad_Rurales
FROM CTE_Region
GROUP BY Region
ORDER BY Cantidad_Escuelas DESC
;

/*NOTA: No especifican si los establecimientos cerrados son definitivos o no (incluso en la pandemia hay pocos)*/
/*¿El mejor y el peor año con respecto a los aprobados en la enseñanza básica?*/

WITH Total_escuela AS (
	SELECT "Date", 
			RBD,
			APR_HOM_TO,
			APR_MUJ_TO,
			REP_HOM_TO,
			REP_MUJ_TO,
			COALESCE(APR_HOM_TO,0) + COALESCE(REP_HOM_TO,0) + COALESCE(RET_HOM_TO,0) + COALESCE(TRA_HOM_TO,0)AS Total_Hombres,
			COALESCE(APR_MUJ_TO,0) + COALESCE(REP_MUJ_TO,0) + COALESCE(RET_MUJ_TO,0)+ COALESCE(TRA_MUJ_TO,0) AS Total_Mujeres
	FROM Registro
	WHERE COD_ENSE = 110 /*Solo establecimientos de educación básica*/
), 
Tasas AS (
	SELECT	Total_escuela."Date",
			(SUM(Total_escuela.APR_HOM_TO) * 100.0) / NULLIF(SUM(Total_Hombres), 0) AS Tasa_Aprobacion_Hombres,
			(SUM(Total_escuela.APR_MUJ_TO) * 100.0) / NULLIF(SUM(Total_Mujeres), 0) AS Tasa_Aprobacion_Femenino /*,
			(Registro.REP_HOM_TO * 100.0) / NULLIF(Total_Hombres, 0) AS Tasa_Desaprobacion_Hombres,
			(Registro.REP_MUJ_TO * 100.0) / NULLIF(Total_Mujeres, 0) AS Tasa_Desaprobacion_Femenino*/
	FROM Total_escuela
	GROUP BY Total_escuela."Date"
)
SELECT Tasas."Date", 
		Tasa_Aprobacion_Hombres,
		100 * (Tasa_Aprobacion_Hombres - LAG(Tasa_Aprobacion_Hombres,1) OVER (ORDER BY "Date"))/LAG(Tasa_Aprobacion_Hombres,1) OVER (ORDER BY "Date") AS Variacion_Tasa_Hombre,
		Tasa_Aprobacion_Femenino,
		100 * (Tasa_Aprobacion_Femenino - LAG(Tasa_Aprobacion_Femenino,1) OVER (ORDER BY "Date"))/LAG(Tasa_Aprobacion_Femenino,1) OVER (ORDER BY "Date") AS Variacion_Tasa_Femenino
FROM Tasas 
;



/*¿Que tipo de enseñanza tiene mayor tasa de aprobacion y de retiros en el 2024?*/

WITH Total_escuela AS (
	SELECT COD_ENSE, 
			RBD,
			"Date",
			APR_HOM_TO,
			APR_MUJ_TO,
			REP_HOM_TO,
			REP_MUJ_TO,
			COALESCE(APR_HOM_TO,0) + COALESCE(REP_HOM_TO,0) + COALESCE(RET_HOM_TO,0) + COALESCE(TRA_HOM_TO,0)  AS Total_Hombres,
			COALESCE(APR_MUJ_TO,0) + COALESCE(REP_MUJ_TO,0) + COALESCE(RET_MUJ_TO,0) + COALESCE(TRA_MUJ_TO,0)AS Total_Mujeres
	FROM Registro
	WHERE "Date" = 2024 /*Solo establecimientos de educación básica*/
)

SELECT	COD_ENSE,
		SUM(total_hombres) AS Total_Hombres,	
		SUM(total_mujeres) AS Total_Mujeres,
		(SUM(Total_escuela.APR_HOM_TO) * 100.0) / NULLIF(SUM(Total_Hombres), 0) AS Tasa_Aprobacion_Hombres,
		(SUM(Total_escuela.APR_MUJ_TO) * 100.0) / NULLIF(SUM(Total_Mujeres), 0) AS Tasa_Aprobacion_Femenino ,
		(SUM(Total_escuela.REP_HOM_TO) * 100.0) / NULLIF(SUM(Total_Hombres), 0) AS Tasa_Desaprobado_Hombres,
		(SUM(Total_escuela.REP_MUJ_TO) * 100.0) / NULLIF(SUM(Total_Mujeres), 0) AS Tasa_Desaprobado_Femenino
FROM Total_escuela
GROUP BY COD_ENSE
ORDER BY  Tasa_Aprobacion_Femenino DESC
;
