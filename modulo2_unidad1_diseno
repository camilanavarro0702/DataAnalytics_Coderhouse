
CREATE DATABASE DataAnalytics_Coderhouse

USE DataAnalytics_Coderhouse

Create schema modulo2_unidad1_diseno

Create table modulo2_unidad1_diseno.Clientes (
-- Elegi el tipo de dato int porque el id del cliente es un numero entero sin decimales
id_cliente int,

-- Elegi varchar para la descripcion del perfil porque define el campo como caracteres no numericos, delimitandolos a 100
nombre varchar (100),

-- Elegi varchar para la descripcion del perfil porque define el campo como caracteres no numericos, delimitandolos a 120
perfil_bio varchar (120),

-- Elegi date para la fecha porque es el registro que permite ingresar una fecha sin especificaciones de tiempo
fecha_registro date
)
 
 Create table modulo2_unidad1_diseno.Productos (
 --Elegi el tipo de dato int porque el id del producto es un numero entero sin decimales
 id_producto int,

-- Elegi varchar para la descripcion del perfil porque define el campo como caracteres no numericos, delimitandolos a 255
 descripcion VARCHAR (255),

 -- Elegi decimal porque el precio puede tener dos decimales. Ademas, use 12 digitos y no 10 porque los dos decimales forman parte del total de caracteres.
 precio DECIMAL (12,2),

 -- Elegi varchar para la descripcion del perfil porque define el campo como caracteres no numericos, delimitandolos a 1. Luego agregue la funcion check que solo permite completar con Y o N, delimitando la respuesta del campo
 esta_activo VARCHAR(1) CHECK (esta_activo IN ('Y', 'N'))
 )
