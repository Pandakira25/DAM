select * from ligabaloncesto.jugador;

-- Agregamos la columna edad.
-- alter table jugador add column edad int;
-- llamando los datos de la tabla jugador
select * from jugador;
-- seleccionar nombre y edad del jugador
select nombre,edad from jugador;
-- muestrame los equipos de madrid
select * from equipo where ciudad = 'Madrid';


-- mostrar los 5 jugadores (nombre y apellido) mas jóvenes
select nombre, apellido, edad from jugador order by edad asc limit 5;





