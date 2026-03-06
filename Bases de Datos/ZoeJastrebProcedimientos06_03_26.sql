use Jardineria;

-- Ejercicio 1
delimiter //
drop procedure if exists cantFav//
create procedure cantFav(in n_cant_fav varchar(50))
begin 
	select concat('hola ', n_cant_fav);
end //
delimiter ;
call cantFav(25);-- Si pongo un int en el parámetro lo auto castea;

-- Ejercicio 2
delimiter //
drop procedure if exists ed //
create procedure ed(in anio int)
begin
	select year(curdate()) - anio as edad;
end //
delimiter ;
call ed(2005);

-- Ejercicio 3
delimiter //
drop procedure if exists favSong//
create procedure favSong(in sN varchar(50), in aN varchar(50), in min double, in anio int, in fecha date, in fSiNo boolean)
begin
	select concat('La canción ', sN, ' del artista ', aN, ' tiene una duración de ', min, ' minutos'
    '.Fué lanzada hace ', year(curdate())-anio, ' años.') as info;
end//
delimiter ;
call favSong('Cactus','Gustavo Cerati', 3.54, 2009, '2009-1-1', 1);

-- Ejercicio 4
delimiter //
drop procedure if exists calDoble//
create procedure calDoble(in pNum int, out pRes int)
begin 
	set pRes = pNum * 2;
end//
delimiter ;

-- Ejercicio 5
set @res = 0; -- Creamos variable externa
call calDoble(8,@res);
select @res;
-- si no le introduzco una variable externa en el parametro out te da error como pseudovariable

-- Ejercicio 6 y 7
/*
Área de un rectángulo.
*/
delimiter //
drop procedure if exists arRect//
create procedure arRect(in ancho double, in alto double, out res double)
begin 
	set res = ancho * alto;
end//
delimiter ;
set @a = 0;
call arRect(5,8,@a);
select @a;
-- Argumento
-- 1)no va a ejecutar correctamente por que va a tomar el parámetro de entrada como una pseudovariable
-- 2)por lo mismo que lo anterior
-- 3)va a dar error por que no están en el orden que espera obtener el procedimiento

-- Ejercicio 8
/*
Total de pedido con la tabla detalle_pedido
*/
delimiter //
drop procedure if exists totImpor//
create procedure totImpor(in codP int,out totI int)
begin 
	select sum(cantidad * precio_unidad) into totI from detalle_pedido where codigo_pedido = codP;
end//
delimiter ;
set @totI = 0;
call totImpor(1,@totI);
select @totI;
-- si no existe el pedido te va a dar null


-- Ejercicio 9
/*Parámetro INOUT.
*/
delimiter //
drop procedure if exists inmen//
create procedure inmen(inout a int)
begin 
	set a = a + 1;
end//
delimiter ;
set @a = 10;
call inmen(@a);
select @a;
-- 1)Modifica el valor original de la variable
-- 2)Lo necesita por que sigue siendo un out
-- 3)Lo va a tomar como pseudovairable

