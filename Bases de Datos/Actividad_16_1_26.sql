use ligaBaloncesto;

-- ej1 Muestra nombre del jugador, nombre del equipo y puesto del jugador.
select j.nombre, e.nombre_equipo, j.posicion from jugador j join equipo e on j.nom_equipo = e.idEquipo;
-- ej2 Muestra los datos del equipo y el número de partidos que ha jugado como local. Tablas: equipo + partido
select e.*, count(p.eLocal) as partidos_locales from equipo e join partido p on e.idEquipo = p.eLocal group by eLocal;
-- ej3 Lista los datos del equipo que tenga más de 3 jugadores registrados. Tablas: equipo + jugador
select e.* from equipo e join jugador j on j.nom_equipo = e.idEquipo group by e.idEquipo having count(e.idEquipo) > 3;
-- ej4 Repite el ejercicio (c), pero en lugar de contar directamente, usa una lógica equivalente y muestra los datos del equipo (si tu alumnado ya vio EXISTS, si no, omítelo).
-- select 
-- ej5 Muestra el nombre de todos los equipos y los datos de sus partidos cuando fueron locales, aunque no tengan partidos. Tablas: equipo + partido
select nombre_equipo, p.* from equipo e left join partido p on e.idEquipo = p.eLocal;
-- ej6 Muestra los datos del equipo y el salario máximo entre sus jugadores
select e.*, max(j.salario_bruto) as salario_max from jugador j join equipo e on j.nom_equipo = e.idEquipo group by e.idEquipo, e.nombre_equipo;
-- ej7 Muestra los datos del partido con mayor puntuación total y además el nombre del equipo local y visitante
select p.*, eL.nombre_equipo as eLocal, eV.nombre_equipo, 
 (
    CAST(SUBSTRING_INDEX(p.resultado, '-', 1) as unsigned) +
    CAST(SUBSTRING_INDEX(p.resultado, '-', -1) as unsigned)
  ) AS puntuacion_total 
from partido p 
join equipo eL on eL.idEquipo = p.eLocal 
join equipo eV on eV.idEquipo = p.eVisitante 
order by puntuacion_total desc limit 1;
-- ej8 Muestra el nombre de cada equipo y su número de victorias
select distinct e.nombre_equipo, count(v.id.equipo) as victorias
from equipo e
left join (
	select local as id_equipo
    from resultados
    where ;
-- ej9 Muestra nombre del equipo y nombre del jugador capitán (uno por equipo)
select e.nombre_equipo, j.nombre as nombre_capitán from equipo e join jugador j on j.nom_equipo = e.idEquipo where j.idCapitan = j.idJugador;
-- ej10 Muestra: nombre del jugador, nombre del equipo, fecha del partido. Solo de los jugadores cuyos equipos hayan jugado partidos como locales
select j.nombre, e.nombre_equipo, p.fecha from partido p join equipo e on p.eLocal = e.idEquipo join jugador j on j.nom_equipo = e.idEquipo order by j.nombre;

select cast(substring_index(resultado, '-', 1) as unsigned) as intRL from partido;