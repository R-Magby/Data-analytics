## Resumen:
Este analisis se utilizaron datos del Banco Central de Chile usando la API 'bcchapi'. Se usaron datos del PIB anual de las 16 regiones y el recaudado por 
sus diferentes servicios (Pesca, Mineria, Construccion, etc..) con una coleccion que abarca desde el 2013 al 2024, se logró concluir informacion valiosa de ellos,
usando programacion en python (pandas) y estadistica, se pudo identificar:
- Una prediccion de los posible servicios dominantes en el futuro.
- Analisis COVID
- Generacion de electricidad por region y su correlacion con el PIB.
Este proyecto continua con un informe en power BI, donde se visualiza este informacion, conteniendo las siguientes secciones (por ahora):
- PIB por regiones
- Servicios

## Power BI
Con el fin de visualizar este proyecto se confecciono un informe con las siguientes secciones:
- PIB por Región: Efoque en el PIB generado por region en cada año (no en su servicio).
<figure>
   <img src="Power BI/page_1.png" alt="drawing" width="500"/>
  <figcaption>Mapa de Chile con region coloreada segun su PIB, graficos de lineas mostrando la region metropolitana y las 5 regiones que mas contribuyen, tarjetas de crecimiento con su año anterior y grafico de barra de las regiones.</figcaption>
</figure

## Analisis Detallado:

### Principales Regiones
En el año 2024
| Región | PIB |
|:--- | :--- |
|Region Metropolitana de Santiago||
|Antofagasta||
|Valparaíso||
### Principales Servicios por Región
Pregunta: ¿Que servicios son la principal fuente de PIB de cada región?

En esta seccion, me enfoque mas en averiguar los tres servicios que mas generan PIB del 2024 en cada region, queda pendiente un analisis historico de las regiones.
El resultado fue una notoria dominancia de los servicios personales	y  servicios financieros y empresariales, si bien esto responde la pregunta, queda la intriga si ¿Estos servicios entregan la mayor cantidad de PIB? si no ¿Cuanto se diferencia con el principal servicio del pais?
Para la vista mas detallada se puede consultar la [tabla.1](Tablas/Serv_x_region.md).
### Estudio de Tendencias
Pregunta: ¿Cuales servicios principales pueden ser remplazados en el futuro?

Se buscaba predecir en un tiempo no maypr a 30 años, cuales regiones estan pasando por un proceso de cambio economico, ...
Se utilizaron tres criterios en cada servicio para esta prediccion, el ratio de los pib no debe ser menor a 0.2, la pendiente debe ser mayor y su crecimiento acumulado debe ser mayor.

- Se encontro que las regiones de Magallanes y la antártica chilena y Los lagos en un plazo de 3 años (2027) la industria manufacturera remplacen a los 
serivios personales y administracion publica, esto posiblemente debido al alza de la venta de los salmones.
- La region del Maule tiene como PIB principa historicamente a la industria manufacturera, pero puede ser remplazada por Vivienda.
- Los rios en caso contraro a los lagos, su industria manufacturera en un plazo de 2 a 3 años puede ser remplazado por servicios personales.

### Analisis COVID.
Al tener datos economicos es necesario hacer un analisis de estos eventos que afectan a la economia nacional (y global en este caso). Es por ello que me realicé
las siguientes preguntas: ¿En que afecto la pandemia a los servicios de las regiones? y ¿El PIB post-pandemia recupero lo proyectado del PIB pre-pandemia?

Para esto se dividieron los datos, pre y post, sin considerar el 2020, se estudio el cambio de la tendencia, la volatilidad y el crecimiento acumulado compuesto (CAGR), para ello se tuvieron que normalizar los datos, ya que pre pandemia se consideran 7 años y post 4 años.

- El cambio de la tendencia en la regiones provoco un rebote gigante, teniendo una pendiente muy positiva, causada por el efecto rebote de la pandemia.
- La volatilidad tuvo efecto distinto en cada region, algunos post pandemia la redujo haciendo un efecto de estabilizador, mientras que otras sufrieron una mayor inestabilidad, aunque puede ser atribuido al efecto rebote.
- El CAGR ...

### Relacion del PIB con la Generacion de Electricidad

Preguntas: ¿El aumento de generacion de electrcidad implica aumento en el PIB o viceversa? y ¿Este aumento puede atribuirse al crecimiento del año anterior?

Del mismo banco central es posible descargar datos menduales de la generacion y distribucion de electrcidad (Mwh) de algunas regiones, para poder relacionarlo con el PIB se calculo el promedio de cada año. 
Lo interesante se encuentra en el norte (Antofagasta y Atacama ) donde un el PIB tiene un mayor impacto cuando crece la generacion de electricidad del año anterior en la region, esto posiblemente debido al rubro minero. Mientras que algunas regiones (Los lagos, Ñuble y Arica y parinacota) con principal rubro los Servicios personales (Actividades deportivas, artisticas, de entretencion, peluquerias,etc...) arrastran la demanda energetica.

Los demas presentan datos no significativos, lo puede deberse a ajustes anuales y no presentan una tendencia alcista o bajista.

El dato interesante es Valparaíso, genera electricidad que no se traduce en crecimiento económico local, posiblemente, el cierre progresivo de las plantas a carbon. Su economía crece por servicios, comercio y turismo, no por industria electrointensiva.
Para mayor detalle acerca de la [Tabla.2](Tablas/Elec_x_PIB.md)

