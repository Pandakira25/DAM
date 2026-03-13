/*Zoe Jastreb
13/03/2026
Tema: UF-6.4 Bucles y control de flujo*/

use Jardineria;

/*Ejercicio 0
Enunciado: */
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

/*Ejercicio 1
Enunciado: Crea un procedimiento almacenado llamado
SP_CONTADOR que utilice una estructura de control
iterativa (WHILE) para imprimir en pantalla una
secuencia numérica ascendente del 1 al 5,
incrementando el valor de una variable local en cada
iteración.*/
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

/*Ejercicio 2
Enunciado: Desarrollar un procedimiento almacenado llamado
SP_SUMAR_NUMEROS que reciba como parámetro de
entrada un número entero positivo. El procedimiento debe
calcular la suma de todos los números enteros desde el 1
hasta el número recibido, utilizando un ciclo WHILE para
acumular el total y devolver el resultado final mediante una
sentencia SELECT.*/
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

/*Ejercicio 3
Enunciado: Diseñar un procedimiento almacenado llamado
SP_SUMA_LIMITADA que reciba un número de iteraciones
máximo. El procedimiento debe sumar los números de uno
en uno (1, 2, 3...), pero utilizando la instrucción LEAVE para
salir del bucle prematuramente si el total acumulado
supera el valor de 100, mostrando finalmente el resultado
obtenido hasta ese punto
*/
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

/*Ejercicio 4
Enunciado: Desarrollar un procedimiento almacenado llamado
SP_SUMAR_IMPARES que reciba un límite máximo como
parámetro. El procedimiento debe recorrer los números
desde el 1 hasta dicho límite, utilizando la instrucción
ITERATE para omitir los números pares (identificados
mediante el operador residuo %). El resultado final debe
mostrar la suma acumulada únicamente de los valores
impares dentro del rango establecido.*/
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

/*Ejercicio 5
Enunciado: Desarrolla un procedimiento almacenado llamado
SP_SUMAR_NUMEROS_REPEAT que reciba como
parámetro de entrada un número entero positivo.
El procedimiento deberá:
1.Calcular la suma de todos los números
enteros desde 1 hasta el número recibido
como parámetro.
2.Utilizar una estructura de control iterativa
REPEAT…UNTIL para recorrer los valores dentro
del rango indicado.
3.Emplear una variable acumuladora para ir
sumando los valores en cada iteración.
4.Incrementar el contador en cada ciclo hasta
alcanzar el límite establecido.
5.Mostrar el resultado final de la suma
mediante una sentencia SELECT al finalizar el
bucle.
*/
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

/*Ejercicio 6
Enunciado: Desarrolla un procedimiento almacenado llamado
SP_SUMAR_NUMEROS_LOOP que reciba como
parámetro de entrada un número entero positivo.
El procedimiento deberá:
1.Calcular la suma de todos los números enteros
desde 1 hasta el número recibido como
parámetro.
2.Utilizar una estructura de control iterativa LOOP
para realizar el recorrido de los valores.
3.Declarar una variable contadora que permita
iterar desde 1 hasta el límite recibido.
4.Emplear una variable acumuladora para
almacenar progresivamente la suma de los
números.
5.Incluir una condición dentro del bucle que permita
finalizar la ejecución utilizando la instrucción
LEAVE cuando el contador supere el valor límite.
6.Mostrar el resultado final de la suma mediante
una sentencia SELECT al finalizar el procedimiento.
*/
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

/*Ejercicio 7
Enunciado: Desarrolle un procedimiento almacenado llamado
SP_TOTAL_PEDIDO que reciba como parámetro el
código de un pedido.
El procedimiento deberá:
1.Recorrer las líneas correspondientes a ese
pedido en la tabla detalle_pedido.
2.Calcular el importe total del pedido,
multiplicando la cantidad por el precio de cada
producto.
3.Acumular el resultado utilizando una variable.
4.Mostrar el total final mediante una sentencia
SELECT.
SELECCIONE qué tipo de bucle utilizar para
recorrer los registros.*/
delimiter //
drop procedure if exists sp_tPedido//
create procedure sp_tPedido(in cp int)
begin
	declare l int;
    declare i int default 0;
    declare tP decimal(10.2);
    select count(codigo_pedido) into l from detalle_pedido where codigo_pedido = cp;
    while i < l do
		select sum(cantidad * precio_unidad) into tP from detalle_pedido where codigo_pedido = cp;
        set i = i + 1;
    end while;
    select tP as 'total pedido';
end//
delimiter ;
call sp_tPedido(1);

/*Respuestas:
1) La cantidad de lineas
2) Cuando termine de recorrer todas las líneas
3) En una variable aparte que se le asigna el valor de la suma de la cantidad x el precio*/

/*Ejercicio 8
Enunciado: Desarrolle un procedimiento almacenado llamado
SP_CONTAR_PEDIDOS_GRANDES.
El procedimiento deberá:
1.Recorrer los registros de la tabla pedido.
2.Calcular el total de cada pedido utilizando los
datos de la tabla detalle_pedido.
3.Identificar aquellos pedidos cuyo total sea mayor
a 500.
4.Contar cuántos pedidos cumplen esta condición.
5.Mostrar el número total de pedidos grandes
mediante una sentencia SELECT.
Deberá decidir qué tipo de bucle implementar para
resolver el problema.*/
delimiter //
drop procedure if exists sp_contPGrandes//
create procedure sp_contPGrandes()
begin
	declare l int;
    declare i int default 0;
    declare tP int;
    declare tPG int default 0;
    select count(codigo_pedido) into l from detalle_pedido;
    while i < l do
		select sum(cantidad * precio_unidad) into tP from detalle_pedido where codigo_pedido = i;
        if tp > 500 then
			set tPG = tPG + 1;
        end if;
        set i = i +1;
    end while;
    select tPG as 'tot pedidos grandes';
end//
delimiter ;
call sp_contPGrandes();

/*Respuestas:
1) El que si el total del pedido es mayor a 500
2) tPG
3) while*/