use Jardineria;

/*Ejercicio 1*/
delimiter //
drop procedure if exists divN//
create procedure divN(in n1 decimal, in n2 decimal)
begin
	declare res decimal(10,2);
    declare er boolean default false;
    
    declare continue handler for sqlexception
    begin
		set er = true;
    end;
    
    set res = n1 / n2;
    
    if er = true then
		select "error";
	else
		select res;
    end if;
    
end//
delimiter ;
call divN(0,0);

/*Ejercicio 2*/
delimiter //
drop procedure if exists divNW//
create procedure divNW(in n1 decimal, in n2 decimal)
begin
	declare res decimal(10,2);
    declare er boolean default false;
    
    declare continue handler for sqlwarning
    begin
		set er = true;
    end;
    
    set res = n1 / n2;
    
    if er = true then
		select "error";
	else
		select res;
    end if;
    
end//
delimiter ;
call divNW(0,0);
/*Respuesta: No capta el error, Y el proceso sigue fallando solo que el handler se activa*/

/*Ejercicio 3*/
delimiter //
drop procedure if exists wTL//
create procedure wTL(in t varchar(10))
begin
	declare er boolean default false;
    declare tP varchar(5);
    
    declare continue handler for sqlwarning
    begin
		set er = true;
    end;
    
    set tP = t;
    
    if er = true then
		select "ERROR";
    else 
		select tp;
    end if;
    
end//
delimiter ;
call wTL("dvarf");

/*Ejercicio 4*/
delimiter //
drop procedure if exists inOP//
create procedure inOP()
begin
	declare er boolean default false;
    declare continue handler for sqlexception
    begin
		set er = true;
    end;
    insert into oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono,linea_direccion1)values('OF1','Madrid','España','Madrid','28001','911111111','Calle Mayor1');
    if er = true then
		select 'Error';
    else
		select 'ok';
    end if;
end//
delimiter ;
call inOP();

/*Ejercicio 5*/
delimiter //
drop procedure if exists //
create procedure ()
begin
end//
delimiter ;
call ();