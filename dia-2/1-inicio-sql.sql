-- Esto es un comentario

-- SQL (structured Query Language)
-- En SQL siempre va el ; al final de cada linea
-- Sub lenguajes de maneji de informacion
-- DDL (Data definition language)

-- CREATE
CREATE DaTaBaSe pruebas;

-- lista las bases de datos en el servidor
SHOW DATABASES;
-- Seleccionar la base de datos a trabajar
USE pruebas;
-- es buena practiva usar las palabras reservadas en MAYUSCULAS
-- las tablas siemore deben de tener nombre pluralizados
CREATE TABLE alumnos(
	-- definimos las columnas
    -- nombre_col_tipo_dato [parametros opcionale]
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    -- ENUM PERMITE GUARDAR SOLO ALGUNOS VALORES
    sexo ENUM('femenino','masculino','binarix','otro','apache helicopter'),
    documento ENUM('DNI','CE','PASAPORTE') DEFAULT 'DNI',
    nro_documento  VARCHAR(10) NOT NULL ,
    fec_nacimiento DATETIME
    
);

-- para ver las tablas en terminal
SHOW TABLES;

-- DML data manipulation language
-- SELECT [columnas] FROM tabla;
 SELECT nombre, sexo FROM alumnos;
 SELECT * FROM alumnos;
 
 -- INSERT 
 INSERT INTO alumnos (nombre,sexo,nro_documento,fec_nacimiento) VALUES
					 ('Eduardo','masculino','73500746','1992-08-01');

INSERT INTO alumnos (nombre,sexo,nro_documento,fec_nacimiento) VALUES
					('Ronald','binarix','75268256','1995-02-26'),
                    ('Karim','femenino','89892325','1970-01-01'),
                    ('Alexa','apache helicopter','12345678','1995-06-08');

SELECT * FROM alumnos; 
-- DEFAULT valor por defecto, solo usar si no se ha predeterminado uno
INSERT INTO alumnos VALUES
					(DEFAULT, 'Romina','femenino','CE','001232879','1987-05-04'),
                    (DEFAULT, 'Roberto', 'BINARIX', 'PASAPORTE', '15946789', '1985-01-01'),
                    (DEFAULT, 'Jair', 'MASCULINO', DEFAULT, '34598746', '1995-04-09');
                    
-- UPDATE Y DELETE siempre se usan con condicional, si no se afectan todos los registros de la tabla                    
-- DELETE FROM tabla WHERE condicional
DELETE FROM alumnos WHERE id=10;
DELETE FROM alumnos WHERE id>=10 AND id<=12;

SELECT * FROM alumnos;

-- UPDATE tabla SET columna ='nuevo valor' WHERE condicional
UPDATE alumnos SET  nombre='Marimar' WHERE id =8 ;
UPDATE alumnos SET nro_documento = '99564879' , nombre = 'Rodrigo' WHERE id = 9; 

SELECT * FROM alumnos;

INSERT INTO alumnos (nombre, sexo, nro_documento, fec_nacimiento) VALUES
                    ('Maria Alejandra', 'BINARIX', '49596785', '1995-06-19');

-- 1 mostrar todos los alumnos que tengan C.E.

SELECT * FROM alumnos WHERE documento  ='CE';

-- 2 mostrar todos los alumnos que tengan SEXO MASCULINO o FEMENINO
SELECT * FROM alumnos WHERE sexo = 'masculino' OR sexo='femenino'; 
SELECT * FROM alumnos WHERE sexo IN ('masculino','femenino');

-- 3 mostrar a todos los alumnos que nacieron antes de 1990-01-01

SELECT * FROM alumnos WHERE fec_nacimiento < '1990-01.01';
-- %->muestra todos los alumnos con la letra a
SELECT nombre FROM alumnos WHERE nombre like '%a%';
-- muestra todos los alumnos cuya ultima letra sea la a
SELECT nombre FROM alumnos WHERE nombre like '%a';
-- con la propiedad BINARY diferencia a nivel binario (case sensitive - ascii)
SELECT nombre FROM alumnos WHERE nombre  like BINARY '%A';
-- muestra donde haya una d y u 
SELECT nombre FROM alumnos WHERE nombre LIKE '%d%u%';
-- devuelve donde la segunda letra es la 'o' , el _ es una posicion en la cadena 
SELECT nombre FROM alumnos WHERE nombre LIKE '_o%';


                    
