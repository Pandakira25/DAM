-- Zoe Jastreb Procedimientos sql

use Jardineria;

delimiter //
-- Procedimiento que no recibe parámetros
-- almacena en una variable el total de clientes
drop procedure if exists contar_clientes //
create procedure contar_clientes()
begin
	declare total int;
	select count(*) into total from cliente;
    select total;
end //
delimiter ;

call contar_clientes();

-- Segundo ejemplo Saludo de Bienvenida

delimiter //
drop procedure if exists sp_saludo;
-- Procedimiento para mostrar un mensaje de bienvenida
create procedure sp_saludo()
begin
	select 'Bienvenidos a programación de BD' as mensaje;
end //
delimiter ;

call sp_saludo();

-- Tercer ejemplo procedimiento que cuenta pedidos

delimiter // 
-- Procedimiento para mostrar el total de pedidos
drop procedure if exists cnt_pedidos;
create procedure cnt_pedidos()
begin
	select count(*) as cantidadPedidos from pedido;
end //
delimiter ;

call cnt_pedidos();

-- Cuarto ejemplo

delimiter //
-- Procedimiento para mostrar la cantidad de productos registrados almacenados en una variable
drop procedure if exists cnt_productos;
create procedure cnt_productos()
begin
	declare tP int;
    select count(*) into tP from producto;
    select tP;
end //
delimiter ;

call cnt_productos();

-- quinto ejemplo

delimiter //
-- Procedimiento al cual se le introduce parámetros indicando con in que es un 
-- parámetro de entrada y especificando el tipo de dato
-- Luego mostrará los datos pertinentes del cliente cuyo id coincida con el parámetro de entrada
drop procedure if exists dt_cliente;
create procedure dt_cliente(in p_cod_cl int)
begin 
	select nombre_cliente,
    nombre_contacto,
    apellido_contacto,
    telefono,
    ciudad,
    pais,
    codigo_postal
    from cliente where codigo_cliente = p_cod_cl;
end //
delimiter ;

call dt_cliente(26);