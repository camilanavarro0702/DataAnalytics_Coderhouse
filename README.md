📊 RetailPro - Data Analytics Project

Bienvenido al repositorio de análisis de datos para RetailPro, una empresa distribuidora de tecnología. Este proyecto forma parte del curso de Data Analytics de Coderhouse, desarrollado por Camilา Navarro.

🚀 Sobre el Proyecto

RetailPro almacena grandes volúmenes de información transaccional (ventas, clientes, productos y categorías), pero carecía de un análisis sistemático para la toma de decisiones. Este repositorio contiene las consultas y scripts en SQL diseñados para transformar datos crudos en conocimiento de negocio estratégico, permitiendo identificar tendencias de ventas, productos estrella y comportamiento del cliente.

🛠️ Herramientas y Tecnologías

Base de Datos: SQL Server

Lenguaje: T-SQL (Transact-SQL)

Control de Versiones: Git y GitHub

Entorno de Desarrollo: SQL Server Management Studio (SSMS)

📂 Estructura de la Base de Datos (ventas_tech_db)

El modelo relacional principal incluye las siguientes tablas:

ventas: Registro de transacciones (contiene fecha, cantidad, ID de cliente, ID de producto).

clientes: Información de los compradores (nombre, email, ciudad, fecha de registro).

productos: Catálogo de artículos tecnológicos (nombre, precio, stock, categoría).

categorias: Clasificación de los productos tecnológicos.

⚙️ Cómo Ejecutar los Scripts SQL

Sigue estos pasos para reproducir o probar las consultas en tu entorno local:

Clonar el repositorio:

git clone https://github.com/camilانavarro0702/DataAnalytics_Coderhouse.git


Abrir tu gestor de base de datos:
Inicia SQL Server Management Studio (SSMS) y conéctate a tu instancia local de SQL Server.

Crear o seleccionar la base de datos:
Asegúrate de ejecutar el contexto de la base de datos antes de correr los reportes:

USE ventas_tech_db;
GO


Ejecutar las consultas de análisis:

Abre los archivos .sql correspondientes en el explorador de SSMS.

Selecciona el bloque de código que deseas evaluar y presiona F5 o haz clic en Execute.

📈 Hallazgos Clave del Negocio

Productos Estrella: Identificación del Top 5 de artículos con mayor facturación y volumen de venta.

Estacionalidad: Análisis del comportamiento de compra mensual para anticipar picos de demanda y planificar estrategias comerciales.

Ticket Promedio: Seguimiento del valor de compra por transacción para medir la salud comercial.
