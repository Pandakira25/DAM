use Jardineria;

delimiter //
/*drop function if exists ej1//
create function ej1(l decimal)
returns decimal(10,2)
deterministic
begin
	return l * l;
end//

drop function if exists ej2//
create function ej2(edad int)
returns varchar(20)
deterministic
begin
	if edad >= 18 then
		return 'Puede entrar';
	else
		return 'No puede entrar';
	end if;
end//

drop function if exists ej3//
create function ej3(notaP decimal)
returns varchar(50)
deterministic
begin
	declare resultado varchar(20);
	if notaP >= 9.0 then
		set resultado = 'Exelente';
	elseif notaP >= 7.0 then
		set resultado = 'Notable';
    elseif notaP >= 5.0 then
		set resultado = 'Aprobado';
    else
		set resultado = 'Desaprobado';
	end if;
    
    return resultado;
end//

drop function if exists ej4//
create function ej4(precio decimal)
returns decimal
deterministic
begin
	return precio * 1.21;
end//

drop function if exists ej5//
create function ej5(cantidad int)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE clasificacion VARCHAR(20);
 
    IF cantidad < 10 THEN
        SET clasificacion = 'Stock crítico';
    ELSEIF cantidad BETWEEN 10 AND 30 THEN
        SET clasificacion = 'Stock medio';
    ELSE
        SET clasificacion = 'Stock suficiente';
    END IF;
 
    RETURN clasificacion;
END//
*/

delimiter ;
use ligaBaloncesto;


delimiter //
/*
drop function if exists ej6//
create function ej6(puntos int)
returns varchar(15)
deterministic
begin
	DECLARE categoria VARCHAR(15);
 
    IF puntos > 20 THEN
        SET categoria = 'Líder';
    ELSEIF puntos BETWEEN 10 AND 20 THEN
        SET categoria = 'Competitivo';
    ELSE
        SET categoria = 'En riesgo';
    END IF;
 
    RETURN categoria;
end//

*/
drop function if exists ej7//
create function ej7(puntos int)
returns varchar(25)
deterministic
begin
	DECLARE valoracion VARCHAR(25);
 
    IF puntos >= 75 THEN
        SET valoracion = 'Excelente rendimiento';
    ELSEIF puntos BETWEEN 50 AND 74 THEN
        SET valoracion = 'Buen rendimiento';
    ELSEIF puntos BETWEEN 30 AND 49 THEN
        SET valoracion = 'Rendimiento regular';
    ELSE
        SET valoracion = 'Bajo rendimiento';
    END IF;
 
    RETURN valoracion;
end//

delimiter ;

-- select ej1(5);

-- SELECT nombre, cantidad_en_stock, ej5(cantidad_en_stock) FROM producto ORDER BY cantidad_en_stock ASC;

-- SELECT nombre_equipo, puntos, ej6(puntos) FROM equipo ORDER BY puntos DESC;

SELECT nombre_equipo AS equipo, puntos, ej7(puntos) AS valoracion_rendimiento FROM equipo ORDER BY puntos DESC;