use Jardineria;

/*Ejercicio 0*/
delimiter //
drop procedure if exists sp_proc1//
create procedure sp_proc1()
begin
	declare x1 char(5) default "fuera";
	begin
		declare x1 char(6) default "dentro";
        select x1;
	end;
	select x1;
end//
delimiter ;
call jardineria.sp_proc1();

/*Ejercicio 1*/
delimiter //
drop procedure if exists sp_contador//
create procedure sp_contador()
begin
	declare i int default 1;
    while i <= 5 do
		select i;
        set i = i+1;
	end while;
end//
delimiter ;

call sp_contador()

/*Ejercicio 2*/
delimiter //
drop procedure if exists sp_sumar_numeros//
create procedure sp_sumar_numeros(in n int)
begin
	declare i int default 1;
    declare t int default 0;
	while i <= n do
        set t = t + i;
        set i = i + 1;
    end while;
    select t;
end//
delimiter ; 

call sp_sumar_numeros(9);

/*Ejercicio 3*/
delimiter //
drop procedure if exists sp_suma_limitada//
create procedure sp_suma_limitada(in n int)
begin
	declare t int default 0;
    declare i int default 0;
    mi_ciclo:while i <= n do
		set t = t + i;
        if t > 100 then
			select 'limite superado';
            leave mi_ciclo;
        end if;
        
        set i = i + 1;
    end while mi_ciclo;
    select t as 'r final', i as 'ultima iteración';
end//
delimiter ;
call sp_suma_limitada(15);

/*Ejercicio 4*/
delimiter //
drop procedure if exists sp_sumar_impares//
create procedure sp_sumar_impares(in n int)
begin
	declare i int default 1;
    declare t int default 0;
	smI:while i <= n do
		if i%2 != 0 then 
			set i = i + 1;
            iterate smI;
        end if;
        set t = t + i;
        set i = i + 1;
    end while smI;
    select t as 'total impares';
end//
delimiter ;
call sp_sumar_impares(15);

/*Ejercicio 5*/
delimiter //
drop procedure if exists sp_sumar_num_repeat//
create procedure sp_sumar_num_repeat(in n int)
begin
	declare i int default 1;
    declare t int default 0;
    repeat 
		set t = t + i;
        set i = i + 1;
	until i > n
    end repeat;
    select t as 'res';
end//
delimiter ;
call sp_sumar_num_repeat(5);

/*Ejercicio 6*/
delimiter //
drop procedure if exists sp_sumN_loop//
create procedure sp_sumN_loop()
begin
	declare t int default 0;
    declare i int default 1;
    
    bucle:loop
		set t = t + i;
        set i = i + 1;
        
        if i > n then
			leave bucle;
		end if;
	end loop bucle;
    select t as 'res';
end//
delimiter ;
call sp_sumN_loop();

/*Ejercicio 7*/
delimiter //
drop procedure if exists sp_//
create procedure sp_()
begin
end//
delimiter ;
call sp_();

/*Ejercicio 8*/
delimiter //
drop procedure if exists sp_//
create procedure sp_()
begin
end//
delimiter ;
call sp_();