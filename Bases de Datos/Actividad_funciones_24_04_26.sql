/*Zoe Jastreb*/
USE Chinook;

-- ============================================================
-- EJERCICIO 1: formato_moneda
-- Recibe un valor decimal y devuelve una cadena con el símbolo
-- de dólar pegado. Ejemplo: 15.99 -> "$15.99"
-- ============================================================
DELIMITER //
drop function if exists formato_moneda//
CREATE FUNCTION formato_moneda(precio DECIMAL(10,2))
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    RETURN CONCAT('$', precio);
END //
DELIMITER ;

-- Llamada al ejercicio 1
SELECT formato_moneda(15.99);


-- ============================================================
-- EJERCICIO 2: calcular_iva_track
-- Recibe el precio de una canción (UnitPrice) y devuelve
-- el valor del impuesto (21%).
-- ============================================================
DELIMITER //
drop function if exists calcular_iva_track//
CREATE FUNCTION calcular_iva_track(precio DECIMAL(10,2))
RETURNS DECIMAL(10,4) DETERMINISTIC
BEGIN
    RETURN precio * 0.21;
END //
DELIMITER ;

-- Llamada al ejercicio 2
SELECT calcular_iva_track(0.99);


-- ============================================================
-- EJERCICIO 3: milisegundos_a_segundos
-- Recibe la duración en milisegundos y la convierte a segundos.
-- ============================================================
DELIMITER //
drop function if exists milisegundos_a_segundos//
CREATE FUNCTION milisegundos_a_segundos(ms INT)
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    RETURN ms / 1000.0;
END //
DELIMITER ;

-- Llamada al ejercicio 3
SELECT milisegundos_a_segundos(200000);


-- ============================================================
-- EJERCICIO 4: categoria_duracion
-- Recibe la duración en milisegundos y devuelve:
--   'Corta'  si dura menos de 3 minutos
--   'Normal' si dura entre 3 y 5 minutos
--   'Larga'  si dura más de 5 minutos
-- ============================================================
DELIMITER //
drop function if exists categoria_duracion//
CREATE FUNCTION categoria_duracion(ms INT)
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    DECLARE minutos DECIMAL(10,4);
    SET minutos = ms / 60000.0;

    IF minutos < 3 THEN
        RETURN 'Corta';
    ELSEIF minutos <= 5 THEN
        RETURN 'Normal';
    ELSE
        RETURN 'Larga';
    END IF;
END //
DELIMITER ;

-- Llamada al ejercicio 4
SELECT Name, Milliseconds, categoria_duracion(Milliseconds) AS Categoria
FROM Track
LIMIT 10;


-- ============================================================
-- EJERCICIO 5: tipo_cliente
-- Recibe el país de un cliente. Si el país es 'USA', 'Canada'
-- o 'Mexico', devuelve 'Norteamérica'; de lo contrario
-- devuelve 'Resto del mundo'.
-- ============================================================
DELIMITER //
drop function if exists tipo_cliente//
CREATE FUNCTION tipo_cliente(pais VARCHAR(40))
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    IF pais IN ('USA', 'Canada', 'Mexico') THEN
        RETURN 'Norteamérica';
    ELSE
        RETURN 'Resto del mundo';
    END IF;
END //
DELIMITER ;

-- Llamada al ejercicio 5
SELECT FirstName, LastName, Country, tipo_cliente(Country) AS Region
FROM Customer
LIMIT 10;


-- ============================================================
-- EJERCICIO 6: evaluar_stock
-- Recibe un precio. Si es mayor a $1.00 devuelve 'Premium',
-- si es menor o igual devuelve 'Estándar'.
-- ============================================================
DELIMITER //
drop function if exists evaluar_stock//
CREATE FUNCTION evaluar_stock(precio DECIMAL(10,2))
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    IF precio > 1.00 THEN
        RETURN 'Premium';
    ELSE
        RETURN 'Estándar';
    END IF;
END //
DELIMITER ;

-- Llamada al ejercicio 6
SELECT Name, UnitPrice, evaluar_stock(UnitPrice) AS Tipo
FROM Track
LIMIT 10;


-- ============================================================
-- EJERCICIO 7: total_invertido_cliente
-- Recibe el CustomerId y devuelve la suma total de todas
-- sus compras (campo Total de la tabla Invoice).
-- ============================================================
DELIMITER //
drop function if exists total_invertido_cliente//
CREATE FUNCTION total_invertido_cliente(id_cliente INT)
RETURNS DECIMAL(10,2) READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Total) INTO total
    FROM Invoice
    WHERE CustomerId = id_cliente;
    RETURN IFNULL(total, 0);
END //
DELIMITER ;

-- Llamada al ejercicio 7
SELECT CustomerId, FirstName, LastName,
       total_invertido_cliente(CustomerId) AS TotalCompras
FROM Customer
LIMIT 10;


-- ============================================================
-- EJERCICIO 8: nombre_artista_por_track
-- Recibe el TrackId y devuelve el nombre del artista
-- (Name de la tabla Artist).
-- ============================================================
DELIMITER //
drop function if exists nombre_artista_por_track//
CREATE FUNCTION nombre_artista_por_track(id_track INT)
RETURNS VARCHAR(120) READS SQL DATA
BEGIN
    DECLARE nombre VARCHAR(120);
    SELECT ar.Name INTO nombre
    FROM Track t
    JOIN Album al ON t.AlbumId = al.AlbumId
    JOIN Artist ar ON al.ArtistId = ar.ArtistId
    WHERE t.TrackId = id_track;
    RETURN IFNULL(nombre, 'Desconocido');
END //
DELIMITER ;

-- Llamada al ejercicio 8
SELECT TrackId, Name AS Cancion,
       nombre_artista_por_track(TrackId) AS Artista
FROM Track
LIMIT 10;


-- ============================================================
-- EJERCICIO 9: conteo_tracks_album
-- Recibe el AlbumId y devuelve el número total de canciones
-- que pertenecen a ese álbum.
-- ============================================================
DELIMITER //
drop function if exists conteo_tracks_album//
CREATE FUNCTION conteo_tracks_album(id_album INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM Track
    WHERE AlbumId = id_album;
    RETURN total;
END //
DELIMITER ;

-- Llamada al ejercicio 9
SELECT AlbumId, Title,
       conteo_tracks_album(AlbumId) AS NumeroCanciones
FROM Album
LIMIT 10;


-- ============================================================
-- EJERCICIO 10: comprobar_soporte
-- Recibe el CustomerId y devuelve el nombre completo del
-- empleado que le brinda soporte (SupportRepId).
-- ============================================================
DELIMITER //
drop function if exists comprobar_soporte//
CREATE FUNCTION comprobar_soporte(id_cliente INT)
RETURNS VARCHAR(50) READS SQL DATA
BEGIN
    DECLARE nombre_completo VARCHAR(50);
    SELECT CONCAT(e.FirstName, ' ', e.LastName) INTO nombre_completo
    FROM Customer c
    JOIN Employee e ON c.SupportRepId = e.EmployeeId
    WHERE c.CustomerId = id_cliente;
    RETURN IFNULL(nombre_completo, 'Sin soporte asignado');
END //
DELIMITER ;

-- Llamada al ejercicio 10
SELECT CustomerId, FirstName, LastName,
       comprobar_soporte(CustomerId) AS EmpleadoSoporte
FROM Customer
LIMIT 10;