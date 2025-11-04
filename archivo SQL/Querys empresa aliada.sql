/*****************************   PRACTICA  M  42   *************************

Se han importado los datos a traves de Clic derecho sobre la base de datos > tareas > importar archivo plano

Observaciones:
1. No se muestra como disponible la opcion Importar datos... razon desconocida
2. importar archivo plano solo admite archivos tipo csv
3. Ha sido necesario abrir los archivos en Python con pandar para exportarlos al tipo csv.     
*/

-- 1. Realizar consultas básicas para verificar que los datos se han cargado correctamente.

SELECT TOP 10 * FROM Categoria

SELECT TOP 10 * FROM Producto;

SELECT TOP 10 * FROM Segmento;

SELECT TOP 10 * FROM Ventas;

SELECT TOP 10 * FROM Calendario;


----------------  Analisis de tabla Producto -------------------


SELECT COUNT(ITEM) 
AS PRODUCTOS_TOTALES 
FROM PRODUCTO
-- Hay 503 productos

SELECT * 
FROM Producto
WHERE CATEGORY > 1;
-- Ningun producto es de otra categoria que no sea la 1

SELECT BRAND, ATTR1,ATTR2,ATTR3
FROM Producto
GROUP BY BRAND, ATTR1,ATTR2,ATTR3
ORDER BY BRAND;

SELECT ITEM, ATTR1, ATTR2
FROM Producto
WHERE ATTR1 NOT IN (ATTR2)
GROUP BY ITEM, ATTR1, ATTR2;
--Hay 245 productos en los que el atributo 1 y el atributo 2 no se repiten.

----------------  Analisis de tabla Segmento -------------------

SELECT TOP 10 * FROM Segmento;
-- vemos que comparte columnas con Producto como lo son ATTR1, ATTR2, ATTR3 Y FORMAT

SELECT COUNT(*) FROM Segmento
-- solo hay registrados 53 registros

SELECT DISTINCT SEGMENT FROM Segmento
-- De los 53 registros hay 7 segmentos diferentes

SELECT DISTINCT FORMAT FROM Segmento
-- de los 7 segmentos hay 5 formatos diferentes

----------------  Analisis de tabla Ventas -------------------

SELECT * FROM Ventas;
-- Esta tabla no comparte nada con la tabla Segmento, pero comparte el ITEM con Producto
-- Esta tabla despliega las unidades vendidas, el valor total, y el promedio de ventas para cada producto, 
-- dividido en semanas y regiones

SELECT COUNT(*) FROM Ventas;
-- 1222002 Registros en esta tabla

SELECT DISTINCT REGION 
FROM Ventas 
ORDER BY REGION;
-- Tenemos 7 diferentes regiones de donde se han obtenido los datos.

SELECT REGION, WEEK, MAX(TOTAL_VALUE_SALES) 
AS MAX_VALUE
FROM Ventas
GROUP BY REGION, WEEK
ORDER BY REGION, WEEK;
-- Esta tabla muestra el mayor ingreso obtenido, por region y por semana. parece haber 2 años distintos

SELECT COUNT( DISTINCT WEEK) 
FROM Ventas;
-- Tiene registro de 80 semanas, efectivamente más de 52, por lo tanto esta registrando casi dos años

SELECT REGION, WEEK, MAX(TOTAL_UNIT_SALES) 
AS MAX_UNIT_SALES
FROM Ventas
GROUP BY REGION, WEEK
ORDER BY MAX(TOTAL_UNIT_SALES) desc;
-- Podemos Ver que el maximo de unidades vendidas en una semana, se lleba a cabo en la region Scanning Mexico
-- Coincide enla semana 22 tanto del año 2022 como del 2023.

SELECT REGION, 
		SUM(TOTAL_UNIT_SALES) 
        AS MAX_UNIT_SALES,
		RANK() OVER(ORDER BY SUM(TOTAL_UNIT_SALES)DESC ) 
		AS RANKING_UNITS_SALES,
		SUM(TOTAL_VALUE_SALES) 
        AS MAX_VALUE_SALES,
		RANK() OVER(ORDER BY SUM(TOTAL_VALUE_SALES) DESC) 
		AS RANKING_VALUE_SALES
FROM Ventas
GROUP BY REGION;
-- Se han integrado y rankeado, las unidades de venta con los valores de venta maximos
-- como era de esperarse, el ranking coincide en el area, podria añadirse la semana para ver si coinciden.


----------------  Analisis de tabla Calendario -------------------

SELECT * FROM Calendario;
-- Comparte Week, con la tabla Ventas

SELECT DISTINCT YEAR,COUNT(YEAR) FROM Calendario
GROUP BY YEAR;
-- La tabla registra las ventas dE 3 años diferentes 2021,2022,2023 COMPLETOS.


select count(week) from Calendario

-- 2. Ejecutar uniones entre las tablas para combinar la información y,
-- Obtener insights clave sobre las ventas por categoría, región y periodo de tiempo.

SELECT 
    C.YEAR,
    V.REGION,
    SUM(V.TOTAL_UNIT_SALES) AS MAX_UNIT_SALES,
    RANK() OVER (PARTITION BY C.YEAR ORDER BY SUM(V.TOTAL_UNIT_SALES) DESC) AS RANKING_UNITS_SALES,
    SUM(V.TOTAL_VALUE_SALES) AS MAX_VALUE_SALES,
    RANK() OVER (PARTITION BY C.YEAR ORDER BY SUM(V.TOTAL_VALUE_SALES) DESC) AS RANKING_VALUE_SALES
FROM VENTAS V
JOIN CALENDARIO C ON V.WEEK = C.WEEK  -- o mejor: ON V.FECHA = C.FECHA si tienes fechas
GROUP BY 
    C.YEAR,
    V.REGION
ORDER BY C.YEAR, V.REGION
/* Esta tabla nos ha desplegado un par de rankings que relacionean:
las unidades de venta con el valor maximo de ventas, por año y area. 
Ahora se respetara solo el top 3 de esta consulta y unicamente por valor de ventas.*/

WITH RankingVentas AS (
    SELECT 
        RANK() OVER (PARTITION BY C.YEAR ORDER BY SUM(V.TOTAL_UNIT_SALES) DESC) 
        AS RANKING_UNITS_SALES,
        C.YEAR,
        V.REGION,
        SUM(V.TOTAL_UNIT_SALES) 
        AS MAX_UNIT_SALES
    FROM VENTAS V
    JOIN CALENDARIO C ON V.WEEK = C.WEEK
    GROUP BY C.YEAR, V.REGION
)
SELECT *
FROM RankingVentas
WHERE RANKING_UNITS_SALES < 4 
ORDER BY YEAR,RANKING_UNITS_SALES;

-- En ambos años y en ambos rankings, fueron las mismas aeras las que obtuvieron mayores valores de venta.


-------------------------------------------------------------------------------------
-------------------------------- FIN DE LA PRACTICA ---------------------------------
-------------------------------------------------------------------------------------





