--Trabajo realizado por Jacobo Arévalo Zea, id: 000516215

---------------------------------------------------------------------------------------------------------------------------
--CONSULTAS
--DECIDI ELEGIR EL ENFOQUE DEL ANALISIS TEMPORAL
---------------------------------------------------------------------------------------------------------------------------

--CONSULTA 1: 
--QUIERO VER POR DIA CUAL ES LA CIUDAD DE ORIGEN QUE MAS PASAJEROS TIENE

--Mi cte es la consulta interna que agrupa los viajes por fecha y ciudad de origen, sumando los pasajeros.
--AL igual que la creacion de vista en el documento 04 uso el TRUNC para agrupar por fecha sin hora.
WITH pasajeros_por_ciudad AS (
  SELECT
    TRUNC(v."fecha_salida") AS fecha_dia,
    c."nombre_ciudad" AS nombre_ciudad, 
    SUM(v."pasajeros") AS total_pasajeros
  FROM "Viajes" v
  JOIN "Ciudades" c ON v."id_ciudad_origen" = c."id_ciudad"
  GROUP BY TRUNC(v."fecha_salida"), c."nombre_ciudad"
)
--Fin del cte
--Ahora realizo la consulta final que selecciona los datos de la cte y les asigna un ranking por dia
--EN este caso uso la windowsa function RANK para asignar un ranking a cada ciudad por dia
SELECT
  fecha_dia,
  nombre_ciudad, 
  total_pasajeros,
  RANK() OVER (PARTITION BY fecha_dia ORDER BY total_pasajeros DESC) AS ranking_diario
FROM pasajeros_por_ciudad;
---------------------------------------------------------------------------------------------------------------------------

--CONSULTA 2: 
--QUIERO SABER SI DIA A DIA LOS VIAJES DURAN MAS O MENOS QUE EL DIA ANTERIOR POR TERMINAL

--Mi cte calcula la duracion promedio de los viajes por dia y terminal, usando TRUNC 
WITH duracion_diaria_terminal AS (
  SELECT
    TRUNC(v."fecha_salida") AS fecha_dia,
    t."nombre_terminal" AS nombre_terminal,
    ROUND(
      AVG(
        EXTRACT(DAY FROM (v."fecha_llegada" - v."fecha_salida")) * 24 * 60 +
        EXTRACT(HOUR FROM (v."fecha_llegada" - v."fecha_salida")) * 60 +
        EXTRACT(MINUTE FROM (v."fecha_llegada" - v."fecha_salida"))
      ), 2
    ) AS duracion_promedio_min
  FROM "Viajes" v
  JOIN "Terminales" t ON v."id_terminal" = t."id_terminal"
  GROUP BY TRUNC(v."fecha_salida"), t."nombre_terminal"
)

--Mi consulta final selecciona los datos de la cte y calcula la duracion promedio del dia anterior
--En este caso uso la windows function LAG para obtener el valor de la duracion promedio del dia anterior, en el caso de que exista
--luego calculo la variacion restando la duracion promedio del dia actual menos la del dia anterior
--Nota: si no hay un dia anterior, la duracion_anterior sera NULL y la variacion sera NULL
SELECT
  fecha_dia,
  nombre_terminal,
  duracion_promedio_min,
  LAG(duracion_promedio_min) OVER (PARTITION BY nombre_terminal ORDER BY fecha_dia) AS duracion_anterior,
  duracion_promedio_min - LAG(duracion_promedio_min) OVER (PARTITION BY nombre_terminal ORDER BY fecha_dia) AS variacion
FROM duracion_diaria_terminal;
---------------------------------------------------------------------------------------------------------------------------