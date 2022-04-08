--  Crear base de datos llamada películas.
CREATE DATABASE peliculas_db;

\ c peliculas_db;

--iniciar tabla pelicula con id, peliculas, anio_estreno, director
CREATE TABLE peliculas(
    id SERIAL NOT NULL PRIMARY KEY,
    titulo VARCHAR (255) NOT NULL,
    anio_estreno INTEGER NOT NULL,
    director VARCHAR (255) NOT NULL
);

CREATE TABLE reparto(
    id_pelicula bigint NOT NULL,
    actor VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

-- Cargar ambos archivos a su tabla correspondiente.
\ copy peliculas
FROM
    'C:\Users\Alumno\Desktop\peliculas.csv' csv header;

\ copy reparto
FROM
    'C:\Users\Alumno\Desktop\reparto.csv' csv header;

--  Obtener el ID de la película “Titanic”.
SELECT
    id
FROM
    peliculas
WHERE
    titulo = 'Titanic';

-- Listar a todos los actores que aparecen en la película "Titanic".
SELECT
    actor
FROM
    reparto
WHERE
    id_pelicula = '2';

-- Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT
    COUNT (actor)
FROM
    reparto
WHERE
    actor = 'Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT
    *
FROM
    peliculas
WHERE
    anio_estreno BETWEEN '1990'
    AND '1999'
ORDER BY
    titulo ASC;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT
    titulo,
    LENGTH (titulo) AS longitud_titulo
FROM
    peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(titulo)) AS longitud_max_pelicula FROM peliculas; 