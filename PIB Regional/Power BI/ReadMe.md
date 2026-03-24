## Resumen:
Este analisis se utilizaron datos del Banco Central de Chile usando la API 'bcchapi'. Se usaron datos del PIB anual de las 16 regiones y el recaudado por 
sus diferentes servicios (Pesca, Mineria, Construccion, etc..) con una coleccion que abarca desde el 2013 al 2024, se logró concluir informacion valiosa de ellos,
usando programacion en python (pandas) y estadistica, se pudo identificar:
- Una prediccion de los posible servicios dominantes en el futuro.
- Analisis COVID
- Generacion de electricidad por region y su correlacion con el PIB.


### Principales Regiones
En el año 2024
| Región | PIB |
|:--- | :--- |
|Region Metropolitana de Santiago||
|Antofagasta||
|Valparaíso||
### Principales Servicios por Región
Pregunta: ¿Que servicios son la principal fuente de PIB de cada región?
En esta seccion, me enfoque mas en averiguar las del 2024, queda pendiente un analisis historico de las regiones.

### Estudio de Tendencias
Pregunta: ¿Cuales servicios principales pueden ser remplazados en el futuro?
Se buscaba predecir en un tiempo no maypr a 30 años, cuales regiones estan pasando por un proceso de cambio economico, ...
Se utilizaron tres criterios en cada servicio para esta prediccion, el ratio de los pib no debe ser menor a 0.2, la pendiente debe ser mayor y su crecimiento acumulado debe ser mayor.

- Se encontro que las regiones de Magallanes y la antártica chilena y Los lagos en un plazo de 3 años (2027) la industria manufacturera remplacen a los 
serivios personales y administracion publica, esto posiblemente debido al alza de la venta de los salmones.
- La region del Maule tiene como PIB principa historicamente a la industria manufacturera, pero puede ser remplazada por Vivienda.
- Los rios en caso contraro a los lagos, su industria manufacturera en un plazo de 2 a 3 años puede ser remplazado por servicios personales.

