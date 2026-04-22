use Jardineria;

delimiter //
drop procedure if exists ListarClientes//
create procedure ListarClientes()
begin
	declare v_nombre varchar(50);
    declare fin_tabla int default 0;
    declare CONTADOR int default 0;
    
    declare mi_cursor cursor for
		select nombre_cliente from cliente;
        
	declare continue handler for not found set fin_tabla = 1;
	
    open mi_cursor;
    
    bucle_clientes: loop
		fetch mi_cursor into v_nombre;
        set CONTADOR = CONTADOR + 1;
        
        
        
        select concat('Procesando: ', v_nombre) as Nombre, CONTADOR as contador;
	end loop;
    close mi_cursor;
end //
delimiter ;
call ListarClientes();

-- ---------------------------------------------------------------------------------------------------------
delimiter //
drop procedure if exists sp_revisar_stock//
create procedure sp_revisar_stock()
begin
	declare stock int;
    declare nombreP varchar(100);
    declare fin_tabla int default 0;
    declare cont int default 0;
    
    declare mi_cursor cursor for
		select cantidad_en_stock, nombre from producto;
        
	declare continue handler for not found set fin_tabla = 1;
	
    open mi_cursor;
    
    bucle_clientes: loop
		fetch mi_cursor into stock, nombreP;
        
        if fin_tabla = 1 then
			leave bucle_clientes;
		end if;
        
        if stock < 20 then
			select nombreP, stock, "¡ALERTA! STOCK BAJO";
            set cont = cont + 1;
		end if;
	end loop;
    select cont as 'Cantidad de productos que necesitan reposición';
    close mi_cursor;
end //
delimiter ;
call sp_revisar_stock();

-- ---------------------------------------------------------------------------------------------------------------------------------------------

delimiter //
drop procedure if exists sp_aumentar_precio_gama//
create procedure sp_aumentar_precio_gama(in gPod varchar(100), in pIncremento decimal)
begin
	declare idP varchar(100);
    declare precioV NUMERIC(15,2);
    declare precioIncrementado decimal(10,2);
    declare nomP varchar(100);
	declare cont int default 0;
    
    declare fin_tabla int default 0;
    
    declare mi_cursor cursor for
		select codigo_producto, precio_venta, nombre from producto where gama = gPod;
        
	declare continue handler for not found set fin_tabla = 1;
	
    open mi_cursor;
    
    bucle_clientes: loop
		fetch mi_cursor into idP, precioV, nomP;
        
        if fin_tabla = 1 then
			leave bucle_clientes;
		end if;
		set precioIncrementado = precioV * (1 + pIncremento/100);
        update producto set precio_venta = precioIncrementado where codigo_producto = idP;
        select nombre, precio_venta from producto where codigo_producto = idP;
        set cont = cont + 1;
	end loop;
    select cont as 'Cantidad de productos actualizados';
    close mi_cursor;
end //
delimiter ;
call sp_aumentar_precio_gama('Herramientas', 100);

