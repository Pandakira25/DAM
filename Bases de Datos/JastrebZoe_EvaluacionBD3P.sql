USE Chinook;

-- 1 Procedimiento
delimiter //
drop procedure if exists ej1//
create procedure SP_RESUMEN_GENERO_CHINOOK(in p_genere_id int)
begin
	declare fin_tabla int default 0;
	declare nGenere varchar(100);
    declare numCanciones int default 0;
    declare ventas int default 0;
    declare tVentas decimal default 0;
    declare cont int default 0;
    
	declare mi_cursor cursor for
		select 
        g.Name, 
        count(t.Name), /*"Nº total de canciones asociadas"*/ 
        count(i.Quantity), /*"Nº total de canciones vendidas"*/ 
        sum(i.UnitPrice * i.Quantity) /*"Importe total gastado en el género"*/ 
        from genre g  
        join track t on g.GenreId = t.GenreId 
        join invoiceline i on i.TrackId = t.TrackId
        where g.GenreId = p_genere_id
        group by g.Name;
	declare continue handler for not found set fin_tabla = 1;
    
    open mi_cursor;
    
    bucle_genere: loop
		fetch mi_cursor into nGenere, numCanciones, ventas, tVentas;
        
        if fin_tabla = 1 and cont = 0 then
			select "Género no encontrado";
			leave bucle_genere;
		elseif fin_tabla = 1 and cont > 0 then
			leave bucle_genere;
		end if;
        
        if ventas = 0 then
			select nGenere, numCanciones as "Nº total de canciones asociadas", ventas as "Nº total de canciones vendidas", tVentas as "Importe total gastado en el género", "Sin ventas" as demanda;
		elseif ventas < 20 then
			select nGenere, numCanciones as "Nº total de canciones asociadas", ventas as "Nº total de canciones vendidas", tVentas as "Importe total gastado en el género", "Baja demanda" as demanda;
        elseif ventas > 20 and  ventas < 50 then
			select nGenere, numCanciones as "Nº total de canciones asociadas", ventas as "Nº total de canciones vendidas", tVentas as "Importe total gastado en el género", "Demanda media" as demanda;
        elseif ventas > 50 then
			select nGenere, numCanciones as "Nº total de canciones asociadas", ventas as "Nº total de canciones vendidas", tVentas as "Importe total gastado en el género", "Alta demanda" as demanda;
        end if;
        set cont = cont + 1;
	end loop;
    close mi_cursor;
end//
delimiter ;

call SP_RESUMEN_GENERO_CHINOOK(1);
call SP_RESUMEN_GENERO_CHINOOK(26);

-- 2 Función
delimiter //
drop function if exists FN_CLASIFICAR_DURACION_TRACK//
create function FN_CLASIFICAR_DURACION_TRACK(trackId int)
returns varchar(100)
deterministic
begin
    declare duracion int default 0;
    declare duracionReturn varchar(100);
    
    select  t.Milliseconds into duracion from track t where t.TrackId = trackId;
	
	if duracion = 0 then
		set duracionReturn = "No existe";
	elseif duracion != 0 then
		if duracion < 180000 then
			set duracionReturn = "Corta";
		elseif duracion > 180000 and duracion < 300000 then
			set duracionReturn = "Media";
		elseif duracion > 300000 then
			set duracionReturn = "Larga";
		end if;
	end if;
    return duracionReturn;
end//
delimiter ;

SELECT FN_CLASIFICAR_DURACION_TRACK(1);
SELECT FN_CLASIFICAR_DURACION_TRACK(9999); 
select Name, FN_CLASIFICAR_DURACION_TRACK(15) as "Duración" from track t where t.TrackId = 15;
select Name, FN_CLASIFICAR_DURACION_TRACK(t.TrackId) as "Duración" from track t order by t.Name desc limit 2;

