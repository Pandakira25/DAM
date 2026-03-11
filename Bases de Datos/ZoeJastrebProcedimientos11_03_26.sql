/*Zoe Jastreb 11/3/26 Tema UF6.3 Variables y estructuras de control*/

use Jardineria;

/*Ejercicio 1
Enunciado: Calcular el total de un pedido utilizando una variable*/
delimiter //
drop procedure if exists sp_total_pedido//
create procedure sp_total_pedido(in p_codigo int)
begin 
	declare v_total decimal (10,2);
    select sum(cantidad * precio_unidad) into v_total from detalle_pedido where codigo_pedido = p_codigo;
    select v_total;
end//
delimiter ;
-- Respuesta
call sp_total_pedido(1);

/*Ejercicio 2
Enunciado: Procedimiento que calcula el IVA de un precio capturado al
ejecutarlo.*/
delimiter //
drop procedure if exists sp_calcular_iva//
create procedure sp_calcular_iva(in p_precio decimal(10,2))
begin 
	declare iva decimal(10,2);
    set iva = p_precio * 0.21;
    select iva;
end//
delimiter ;

call sp_calcular_iva(90);

-- Respuesta: Por que así podemos manejar datos dentro del procedimiento;

/*Ejercicio 3
Enunciado: procedimiento que verifique si la edad
capturada es mayoría de edad con IF*/
delimiter //
drop procedure if exists sp_verificar_edad//
create procedure sp_verificar_edad(in edad int)
begin 
	if edad >= 18 then 
    select 'Es mayor de edad'; 
    else select 'Es menor de edad'; 
    end if;
end//
delimiter ;

call sp_verificar_edad(520);

/*Ejercicio 4
Enunciado: Cree un procedimiento almacenado que:
1. Reciba como parámetro de entrada (IN) el código
de un cliente.
2. Consulte en la tabla pago cuál es la forma de pago
utilizada por ese cliente.
3. Utilice una estructura condicional IF para evaluar el
resultado.
4. Si el cliente paga con PayPal, el procedimiento
deberá mostrar el mensaje: Cliente utiliza PayPal
5. Si utiliza otro método de pago, el procedimiento
deberá mostrar: El cliente utiliza otro método de pago*/
delimiter //
drop procedure if exists consultarMetPago//
create procedure consultarMetPago(in id int)
begin 
	declare metP varchar(50);
    select forma_pago into metP from pago where codigo_cliente = id limit 1;
    if metP = 'PayPal' then select 'Cliente utiliza PayPal';
    else select 'El cliente utiliza otro método de pago';
    end if;
end//
delimiter ;

call consultarMetPago(1);

/* Respuesta: Creo el procedimiento con un int de entrada como id, dentro declaro otra variable para almacenar el 
método de pago. Le asigno el valor con un into desde el select. 
Creo un if para valorar si usa o no paypal, si lo usa muestra el mensaje correspondiente y si no otro mensaje indicandolo.
Por último hago la llamada del procedimiento*/

/*Ejercicio 5
Enunciado: Cree un procedimiento que clasifique la
persona por la edad:*/
delimiter //
drop procedure if exists sp_clasificar_edad//
create procedure sp_clasificar_edad(in edad int)
begin 
	case 
		when edad < 12 then 
			select 'niño';
		when edad between 12 and 17 then
			select 'adolescente';
		when edad between 18 and 59 then
			select 'adulto';
		else
			select 'adulto mayor';
	end case;
end//
delimiter ;

call sp_clasificar_edad(50);

/*Respuesta: 1) Este procedimiento evalúa rangos de edad, la cual se ingresa como parámetro, y dependiendo del rango muestra el mensaje correspondiente.*/

/*Ejercicio 6
Enunciado: Cree un procedimiento almacenado que:
1. Reciba como parámetro de entrada (IN) el código
de un cliente.
2. Consulte en la tabla pago la forma de pago
utilizada por ese cliente.
3. Utilice una estructura condicional CASE para
clasificar el tipo de pago.
4. El procedimiento deberá mostrar uno de los
siguientes mensajes según el método de pago
encontrado:
Forma de pago Mensaje
PayPal Pago electrónico
Transferencia Pago bancario
Cheque Pago tradicional
Otro Método de pago no
identificado*/
delimiter //
drop procedure if exists clasificar_pagos//
create procedure clasificar_pagos(in id int)
begin 
	declare metP varchar(50);
	select forma_pago into metP from pago where codigo_cliente = id limit 1;
    case
		when metP = 'PayPal' then select 'Pago electrónico';
        when metP = 'Transferencia' then select 'Pago bancario';
        when metP = 'Cheque' then select 'Pago tradicional';
        else select 'Método de pago no identificado';
    end case;
end//
delimiter ;

call clasificar_pagos(9);