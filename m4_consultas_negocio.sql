USE ventas_tech_db
GO
-- Consulta 1. Resumen ejecutivo mensual.

SELECT 
    DATENAME(month, fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) / COUNT(id_venta) AS ticket_promedio
FROM dbo.ventas
GROUP BY DATENAME(month, fecha_venta);

-- Consulta 2. Ranking de productos. 

SELECT TOP 5 id_producto,
SUM (cantidad) AS cantidad_vendida,
SUM(cantidad * precio_unitario) AS total_facturado
FROM dbo.ventas
GROUP BY id_producto
ORDER BY total_facturado DESC

-- Consulta 3. Clientes recurrentes.

SELECT id_cliente,
COUNT (id_venta) AS cantidad_pedidos,
SUM (cantidad*precio_unitario) AS total_gastado
FROM dbo.ventas
GROUP BY id_cliente
HAVING COUNT (*)  > 1
ORDER BY cantidad_pedidos DESC;

-- Consulta 4. Meses por encima / por debajo del promedio. 
-- Nota: Mi base de datos solo contiene datos de marzo.

WITH Facturacion_Mensual AS (
    SELECT 
        MONTH(fecha_venta) AS num_mes,
        DATENAME(month, fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM 
        dbo.ventas
    GROUP BY 
        MONTH(fecha_venta),
        DATENAME(month, fecha_venta)
)
SELECT 
    mes,
    total_facturado,
    (SELECT AVG(total_facturado) FROM Facturacion_Mensual) AS promedio_general,
    CASE 
        WHEN total_facturado > (SELECT AVG(total_facturado) FROM Facturacion_Mensual) THEN 'Por encima'
        WHEN total_facturado < (SELECT AVG(total_facturado) FROM Facturacion_Mensual) THEN 'Por debajo'
        ELSE 'igual'
    END AS evaluacion_promedio
FROM 
    Facturacion_Mensual;

-- Bloque de cierre.
-- 1. Al solo contar con datos de marzo en mi base de datos, contamos con el promedio y el total de ventas inicial para comparar los meses siguientes y evaluar el crecimiento de la empresa.
-- 2. Los productos de mayor precio son los que generan una mayor rentabilidad, incluiso vendiendo pocas unidades, en comparación con los productos de menor valor. 
-- 3. El negocio ha logrado retener a los clientes cuyo ticket ha sido más elevado, logrando que volvieran a comprar. 



