USE ventas_tech_db;

--------------------------------------------------------------------------------
-- Consulta 1 — Vista base del proyecto (INNER JOIN)
-- Propósito: Cruzar la información de ventas, clientes, productos y categorías para alimentar la vista principal en Power BI.
--------------------------------------------------------------------------------
SELECT 
    ventas.id_venta,
    ventas.cantidad,
    ventas.fecha_venta,
    productos.id_producto,
    productos.nombre_producto,
    productos.precio AS precio_unitario,
    productos.stock,
    productos.activo,
    categorias.id_categoria,
    categorias.nombre_categoria,
    categorias.descripcion,
    clientes.id_cliente,
    clientes.nombre AS nombre_cliente,
    clientes.email,
    clientes.ciudad,
    clientes.fecha_registro AS fecha_registro_cliente
FROM ventas
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
INNER JOIN productos ON ventas.id_producto = productos.id_producto
INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria;

-- Hallazgo: Se consolidó toda la información transaccional y dimensional del negocio en una única vista integrada, lista para ser conectada como fuente principal en Power BI.


--------------------------------------------------------------------------------
-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
-- Propósito: Identificar clientes registrados que aún no han realizado ninguna compra para el área de CRM.
--------------------------------------------------------------------------------
SELECT
    clientes.nombre AS nombre_cliente,
    clientes.email,
    clientes.fecha_registro
FROM clientes 
LEFT JOIN ventas ON clientes.id_cliente = ventas.id_cliente
WHERE ventas.id_venta IS NULL;

-- Hallazgo: Se detectaron 0 clientes sin compras. Esto indica que toda la base registrada tiene conversión activa, por lo que el área de CRM no requiere campañas inmediatas de re-engagement para este segmento.


--------------------------------------------------------------------------------
-- Consulta 3 — Productos sin ventas (LEFT JOIN)
-- Propósito: Identificar artículos del catálogo que no tienen ninguna venta registrada para el área de producto.
--------------------------------------------------------------------------------
SELECT 
    productos.nombre_producto,
    productos.precio AS precio_unitario,
    categorias.nombre_categoria AS categoria
FROM productos
INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria
LEFT JOIN ventas ON productos.id_producto = ventas.id_producto
WHERE ventas.id_venta IS NULL;

-- Hallazgo: Se encontraron 0 artículos sin movimiento. Esto demuestra una rotación de inventario óptima, confirmando al área de producto que todo el catálogo actual genera ventas y no requiere discontinuarse.


--------------------------------------------------------------------------------
-- Consulta 4 — Consolidado por canal (UNION ALL)
-- Propósito: Agrupar y sumar las ventas totales diferenciando entre el canal presencial (Buenos Aires) y online (resto del país).
--------------------------------------------------------------------------------
SELECT canal, SUM(total) AS total_canal
FROM (
    -- Bloque 1: Ventas de clientes de Buenos Aires ('Presencial')
    SELECT v.fecha_venta, (v.cantidad * v.precio_unitario) AS total, 'Presencial' AS canal
    FROM ventas v
    INNER JOIN clientes c ON v.id_cliente = c.id_cliente
    WHERE c.ciudad = 'Buenos Aires'
    
    UNION ALL
    
    -- Bloque 2: Ventas de clientes de otras ciudades ('Online')
    SELECT v.fecha_venta, (v.cantidad * v.precio_unitario) AS total, 'Online' AS canal
    FROM ventas v
    INNER JOIN clientes c ON v.id_cliente = c.id_cliente
    WHERE c.ciudad <> 'Buenos Aires'
) AS consolidado
GROUP BY canal;

-- Hallazgo: El canal online representa el 59,03% de las ventas totales (3.804 sobre 6.444), evidenciando una fuerte preferencia digital frente al canal presencial.
