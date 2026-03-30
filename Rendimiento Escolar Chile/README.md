
# Fuente de datos
Se coleccionaron los datos del MINEDUC de rendimiento academico entre el 2002 al 2024. [link](https://datosabiertos.mineduc.cl/resumen-de-rendimiento-por-unidad-educativa/)

# Resumen
Utilizando datos proporcionados por el MINEDUC (23 archivos csv) en los cuales se encuentra informacion acerca de cantidad de alumnos aprobados, retirados, desaprobados y trasladados, ademas de informacion del tipo de enseñanza,region, provincia, tipo de establecimiento, etc..., para una información mas detallada recomiendo ver el [documento oficial](./Rendimiento%20Escolar%20Chile/ER_Resumen_rendimiento_UE.pdf). Este analisis tiene como objetivo estudiar la evolución del rendimiento académico en Chile a lo largo del tiempo, identificar tendencias, anomalías y brechas entre distintos segmentos educativos.

Este proyecto nace de un gran interes que tengo en la educacion en Chile, deseando que me otorge un mejor conocimiento del sistema educativo a lo largo del tiempo y el analisis cuantitativo usando herramientas como python, SQL, SQL Server, SSMS y excel.

# Flujo de trabajo

 * Exportacion, limpieza, transformación y exportacion de datos en [jupyter notebook python](./Rendimiento%20Escolar%20Chile/Python/ETL_Rendimiento_Escolar.ipynb)
 * Creacion de [database](./Rendimiento%20Escolar%20Chile/SQL/creacion_database.sql)s y  [tablas](./Rendimiento%20Escolar%20Chile/SQL/creacion_tablas.sql).
 * Escritura de [queries](./Rendimiento%20Escolar%20Chile/SQL/queries.sql)

## Establecimiento por región 2024
Pregunta: ¿Cuales son las regiones que tienen mas establecimientos? ¿Cual es la cantidad de establecimientos rurales y urbano?

No es sorpresa que la región metropolitana sea donde haya mayor cantidad de establecimientos, lo interesante es ver a medida ue se aleja de la capital los establecimientos urbanos aumentan en proporcion. Esto abre las siguientes preguntas: ¿la aprobacion se ve afectada de igual manera? y ¿La aprobacion se ve afectada por la cantidad de personas en la region (almenos en basica (más facil filtrar))?

Además las 4 regiones coiciden con las regiones mas pobladas del pais en 2024 (fuente: [Link](https://www.meganoticias.cl/nacional/480287-censo-las-regiones-que-tienen-mas-habitantes-en-chile-brk-27-03-2025.html))

|Region      |Cantidad_Escuelas |Cantidad_Urbano |Cantidad_Rurales|
|----------- |----------------- |--------------- |----------------|
|13          |2786              |2672 (95.9%)           |114 (4.1%)|
|5           |1122              |985 (87.8%)            |137 (12.2%)|
|9           |1034              |456 (55.9%)            |578 (44.1%)|
|8           |1011              |732 (72.4%)            |279 (27.6)|


## Aprobacion de la enseñanza basica 
Pregunta: ¿El mejor y el peor año con respecto a los aprobados en la enseñanza básica?

Para responder se confecciona la siguiente tabla, el cual el objetivo es identificar eventos historicos o leyes que hayan podido influir a corto plazo (un año) en la aprobación.

Los eventos que mas movieron la educacion en chile fueron el COVID (educacion fortalecida, talvez por la facilidad de copias y la invension de chatgpt), la vuelta a la normalidad dio un golpe de realidad y el 2010  tambien tuvo un efecto de estudio en la educacion chilena.

|Año|Evento o Ley| Variacion Hombres|Variacion Mujeres|
|---|---|---|---|
|2006| “Revolución de los pingüinos”|-0.7%|-0.4%|
|2010|[Ley General de Educación y Terremoto](https://es-academic.com/dic.nsf/eswiki/721035/?utm_source=chatgpt.com))|-1.72%|-1.37%|
|2013|[Creacion (2011-2012) Superintendencia de Educación](https://es.wikipedia.org/wiki/Superintendencia_de_Educaci%C3%B3n#:~:text=La%20Superintendencia%20de%20Educaci%C3%B3n%20en,la%20Intendencia%20de%20Educaci%C3%B3n%20Parvularia.)|0.63%|0.60%|
|2018|Creación del SLEP(2017)|-0.19%|-0.3%|
|2020-2021|COVID|6.4% & -1.3%|5.1% & -1.2%|
|2022|Vuelta a la Normalidad|-4.51%|-4.01%|

Notas:
- El 2009 se instauro una ley que modificaba los procesos de admision, lamentablemente no se ven afectos notorsio debido al terremoto de febrero del 2010. Si bien solamente afecta principalemente a la region del bio-bio y alrededores, hay que hacer un analisis mas profundo en las que no sufrieron efectos directos. (más probable que hayan aumentado los retiros)
- El SLEP tiene mas impacto en al educación publica, por lo que tambien emrece su propio analisis.

## Aprobacion segun tipo de enseñanza
Pregunta: ¿Que tipo de enseñanza tiene mayor tasa de aprobacion y de retiros en el 2024?

Se obtuvo el promedio de aprobados y reprobados segun el tipo de enseñanza en el 2024, dondela educacion basica y media para menores se destaca en primer lugar con mejor promedio de aprobacion y de las mas bajas de reprobados. A continuación se destacan algunas de ellas:

|Codigo|Enseñanza|Destacado|Masculino|Femenino|
|---|---|---|---|---|
|510|Media T-P Industrial|Menor aprobacion Femeninda de menores|86.35%| 87%|
|510|Media T-P Industrial|Menor aprobacion Masculina de menores|86.35%| 87%|
