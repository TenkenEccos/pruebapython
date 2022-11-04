CREATE DATABASE Colegio;
USE colegio;

DROP TABLE cursos;
DROP TABLE alumnos;


CREATE TABLE cursos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    color TEXT,
    dificultad ENUM('FACIL','MEDIO','DIFICIL')
);

CREATE TABLE alumnos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ape_paterno VARCHAR(50) NOT NULL,
    ape_materno VARCHAR(50) NOT NULL,
    correo VARCHAR(250) UNIQUE NOT NULL,
    num_emergencia VARCHAR(10),
    -- Creo una columna referenciando segun el nombre de la tabla_nombre columna
    curso_id INT,
    -- Ahora relacionamos esa columna con la tabla alumnos
    FOREIGN KEY(curso_id) REFERENCES cursos(id)
);

INSERT INTO cursos VALUES   (DEFAULT, 'MATEMATICA', 'AMARILLO', 'MEDIO'),
                            (DEFAULT, 'CTS', 'NARANJA', 'DIFICIL'),
                            (DEFAULT, 'ARTE', 'MORADO', 'FACIL'),
                            (DEFAULT, 'EDUCACION FISICA', 'VERDE', 'MEDIO'),
                            (DEFAULT, 'INGLES', 'CELESTE', 'FACIL'),
                            (DEFAULT, 'COMUNICACION', 'ROJO', 'DIFICIL');
                            
INSERT INTO alumnos VALUES  (DEFAULT, 'Eduardo', 'de Rivero', 'Manrique', 'ederiveroman@gmail.com','974207075',1),
                            (DEFAULT, 'Carla', 'Monterrosa', 'Macedo', 'cmonterrosa@gmail.com','974207074',3),
                            (DEFAULT, 'Juan', 'Perez', 'Rodriguez', 'jperez@gmail.com','974207076',5),
                            (DEFAULT, 'Rodrigo', 'Buenaventura', 'Rodrigues', 'rbuenaventura@gmail.com','974159075',2),
                            (DEFAULT, 'Sofia', 'Baldarrago', 'Vera', 'sbaldarrago@gmail.com','972503648',6);

SELECT * FROM alumnos;
SELECT * FROM cursos;

-- seleccionar todos los cursos que sean faciles o dificil
SELECT * FROM cursos WHERE dificultad = 'FACIL' OR dificultad = 'DIFICIL';
-- seleccionar todos los cursos que sean color amarillo o celestre y que sena dificulta medio
SELECT * FROM cursos WHERE dificultad = 'MEDIO' AND color IN ('amarillo' , 'celeste');

SELECT *
FROM alumnos
INNER JOIN cursos ON alumnos.curso_id = cursos.id
WHERE correo LIKE '%gmail%';

INSERT INTO alumnos VALUES (DEFAULT,'Jhonatan','Maicelo','Roman','jgavilan@gmail.com','925361048',NULL);

-- LEFT JOIN
SELECT *
FROM alumnos
LEFT JOIN cursos ON alumnos.curso_id = cursos.id;

-- RIGHT JOIN
SELECT *
FROM alumnos
RIGHT JOIN cursos ON alumnos.curso_id = cursos.id;
