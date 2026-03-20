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
drop procedure if exists srchClientCod//
create procedure srchClientCod(in codC int)
begin
	declare nC varchar(100);
    declare notFound boolean default false;
    declare continue handler for not found
    begin
		set notfound = true;
    end;
    select nombre_cliente into nC from cliente where codigo_cliente = codC;
    if notFound = true then 
		select 'Client not found';
	else
		select nC;
	end if;
end//
delimiter ;
call srchClientCod(1000);

/*Ejercicio 6
Cree un procedimiento almacenado llamado
SP_ACTUALIZAR_LIMITE_CREDITO que
reciba como parámetros el código de un cliente
y un nuevo límite de crédito. El procedimiento
debe intentar actualizar dicho valor. Si ocurre
un error durante la actualización, debe mostrar
un mensaje indicando que no fue posible
actualizar el límite de crédito. Si la operación se
realiza correctamente, debe mostrar un
mensaje de confirmación.*/
delimiter //
drop procedure if exists upldLiCr//
create procedure upldLiCr(in cC int, in lC decimal(10,2))
begin
	declare er boolean default false;
    declare continue handler for sqlexception
    begin
		set er = true;
    end;
    update cliente set limite_credito = lC where codigo_cliente = cC;
    if er = true then 
		select 'Error';
    else 
		select 'Upload correctly';
    end if;
end//
delimiter ;
-- Without error
call upldLiCr(1,10.5);
-- With error
-- No da error ya que para poder captar esto deberíamos ver si se modificó una fila o no 
-- y eso no lo vimos por que con el update si le pones un cliente que no existe no da error.
call upldLiCr(1020,10.5);

/*Ejercicio 7Cree un procedimiento almacenado llamado
SP_INSERTAR_PEDIDO_SIMPLE que intente
insertar un nuevo pedido en la tabla pedido. Si
ocurre un error en la inserción, debe mostrar el
mensaje “Error al registrar el pedido”. Si la
operación es correcta, debe mostrar “Pedido
registrado correctamente*/
delimiter //
DROP PROCEDURE IF EXISTS SP_INSERTAR_PEDIDO_SIMPLE;
CREATE PROCEDURE SP_INSERTAR_PEDIDO_SIMPLE()
BEGIN
     DECLARE v_error BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
		SET v_error = TRUE;
	END;
    INSERT INTO pedido (
		codigo_pedido,
        fecha_pedido,
        fecha_esperada,
        fecha_entrega,
        estado,
        comentarios,
        codigo_cliente
    )
    VALUES (
		200,
        '2025-01-01',
        '2025-02-12',
        '2025-03-10',
        'entregado',
        'good',
        1
    );
    IF v_error THEN
        SELECT 'Error al registrar el pedido' AS mensaje;
    ELSE
        SELECT 'Pedido registrado correctamente' AS mensaje;
    END IF;
END //
DELIMITER ;
-- LLAMADA
CALL SP_INSERTAR_PEDIDO_SIMPLE();

/*Ejercicio 8
Cree un procedimiento almacenado llamado
SP_INSERTAR_CLIENTE_BASICO que reciba los
datos básicos de un cliente y trate de
insertarlos en la tabla cliente. Si ocurre un error
durante la inserción, el procedimiento debe
mostrar el mensaje “No se pudo registrar el
cliente”. Si la operación se realiza
correctamente, debe mostrar “Cliente
registrado correctamente*/
DELIMITER ++
DROP PROCEDURE IF EXISTS SP_INSERTAR_CLIENTE_BASICO ++
CREATE PROCEDURE SP_INSERTAR_CLIENTE_BASICO(
	IN p_codigo_cliente int,
    IN p_nombre_cliente    VARCHAR(100),
    IN p_nombre_contacto  VARCHAR(100),
    IN p_apellido_contacto VARCHAR(100),
    IN p_telefono  int,
    IN p_fax int,
    IN p_linea_direccion1 VARCHAR(100),
    IN p_ciudad VARCHAR(20),
    IN p_region VARCHAR(30),
    IN p_pais VARCHAR(20),
    IN p_codigo_postal int,
    IN p_codigo_empleado_rep_ventas int,
    IN p_limite_credito double
)
BEGIN
    DECLARE v_error int default 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET v_error = 1;
    END;
    INSERT INTO cliente(codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono,
    fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito)
    VALUES (p_codigo_cliente, p_nombre_cliente, p_nombre_contacto, p_apellido_contacto,
    p_telefono, p_fax, p_linea_direccion1, NULL, p_ciudad, p_region, p_pais, p_codigo_postal, p_codigo_empleado_rep_ventas, p_limite_credito);
 
    IF v_error = 1 THEN
        SELECT 'El cliente no se pudo registrar.' AS mensaje;
    ELSE
        SELECT 'Cliente registrado con éxito.' AS mensaje;
    END IF;
END++
DELIMITER ;
 
CALL SP_INSERTAR_CLIENTE_BASICO(1, 'Gimnasio de pilates', 'Yeray', 'Arias', 600123456, 1212324, 'Madrid', 'Madrid', 'Madrid', 'España', 23124, 10, 10000.00);

/*Ejercicio 9
Cree un procedimiento almacenado llamado
SP_GUARDAR_TEXTO_CORTO que reciba un texto
como parámetro de entrada y lo asigne a una
variable de tipo VARCHAR(5). Si durante la
asignación se genera una advertencia, el
procedimiento debe mostrar el mensaje “Se generó
una advertencia por truncamiento de texto”. En
caso contrario, debe mostrar el texto almacenado.*/
delimiter //
drop procedure if exists saveShortTxt//
create procedure saveShortTxt(in txt varchar(100))
begin
	declare txtP varchar(5);
    declare er boolean default false;
    declare continue handler for sqlexception
    begin
		set er = true;
    end;
    set txtP = txt;
    if er = true then
		select 'Text too long';
    else
		select txtP;
    end if;
end//
delimiter ;
-- Without error
call saveShortTxt('vdhv');
-- With error
call saveShortTxt('rgevrbedtnb');

/*Ejercicio 10
Cree un procedimiento almacenado llamado
SP_ASIGNAR_NUMERO que reciba un valor de tipo
texto y lo asigne a una variable entera. Si durante la
conversión se genera una advertencia, el
procedimiento debe mostrar un mensaje
indicándolo. En caso contrario, debe mostrar el
valor almacenado.*/
DELIMITER //
DROP PROCEDURE IF exists SP_ASIGNAR_NUMERO//
CREATE PROCEDURE SP_ASIGNAR_NUMERO(IN p_valor VARCHAR(20))
BEGIN
    DECLARE v_numero INT;
    DECLARE v_warning BOOLEAN DEFAULT FALSE;
 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        SET v_warning = TRUE;
	end;
    SET v_numero = p_valor;
    IF v_warning = TRUE THEN
        SELECT 'Se genero una excepción durante la conversion.' AS mensaje;
    ELSE
        SELECT v_numero AS valor_almacenado;
    END IF;
END //
DELIMITER ;
-- Ejemplo 10: valor convertible y valor no numerico
CALL SP_ASIGNAR_NUMERO('42');
CALL SP_ASIGNAR_NUMERO('abc');

/*Ejercicio 11
Cree un procedimiento almacenado llamado
SP_ACTUALIZAR_NOMBRE_CLIENTE_CORTO que
reciba el código de un cliente y un nuevo nombre. El
procedimiento debe intentar guardar dicho nombre
en una variable local de longitud reducida antes de
usarlo. Si se genera una advertencia por
truncamiento, debe informarlo mediante un
mensaje.
*/
DELIMITER //
CREATE PROCEDURE SP_ACTUALIZAR_NOMBRE_CLIENTE_CORTO(
    IN p_codigo_cliente INT, 
	IN p_nuevo_nombre VARCHAR(100) -- para que MySQL acepte el texto que le paso por parámetro. Si pongo varchar (5), el texto largo se truncaria antes de entrar al procedimiento 
)
BEGIN									-- v es variable local
    DECLARE v_nombre_corto VARCHAR(10); -- solo puede guardar 10 caracteres. El parametro de entrada nuevo_nombre se intentara guardar en nombre corto (10 caracteres maximo)
    DECLARE v_warning BOOLEAN DEFAULT FALSE; -- empieza en false
    DECLARE CONTINUE HANDLER FOR SQLWARNING  -- declaracion del handler: "si durante la declaracion ocurre un warning, no pares el procedimiento (CONTINUE), captura el warning y ejecuta lo que hay dentro del BEGIN END que viene a continuacion
    BEGIN	-- begin del handler. Bloque mas pequeño 									-- handler for SQLWARNING es un manejador que actua cuando ocurre un warning
        SET v_warning = TRUE; -- si ocurre un warning, pon v_warning a true y sigue ejecutando
    END;
											-- asignacion
    SET v_nombre_corto = p_nuevo_nombre; -- aqui puede ocurrir el warning. p_nuevo_nombre puede tener hasta 100 caracteres, pero v_nombre_corto solo aguanta 10. Al intentar meter algo grande en algo pequeño, lanza el warning
    IF v_warning = TRUE THEN
        SELECT 'Se produjo un warning por texto largo.' AS mensaje,
        v_nombre_corto AS valor_guardado;
    ELSE
       UPDATE cliente
       SET nombre_cliente = p_nuevo_nombre
       WHERE codigo_cliente = p_codigo_cliente;  -- no necesito select porque no buscamos nada, estamos modificando un registro existente. Usamos parametros de entrada (nombre apra actualizarlo y el codigo para localizar que cliente modificar)
		SELECT 'Registro actualizado' as mensaje, p_nuevo_nombre AS nombre_guardado;
END IF;
END //
DELIMITER ;

/*Ejercicio 12
Cree un procedimiento almacenado llamado
SP_REGISTRAR_TELEFONO_CORTO que reciba el
código de una oficina y un nuevo teléfono. El
procedimiento debe intentar guardar el valor en una
variable local de tamaño limitado. Si el dato es
recortado y se produce una advertencia, debe
indicarlo mediante un mensaje.
*/
DELIMITER //
CREATE PROCEDURE SP_REGISTRAR_TELEFONO_CORTO (p_codigo_oficina VARCHAR(10),p_nuevo_telefono VARCHAR(50))
BEGIN
    DECLARE v_telefono_corto VARCHAR(10);
 
    IF CHAR_LENGTH(p_nuevo_telefono) > 10 THEN
        SET v_telefono_corto = SUBSTRING(p_nuevo_telefono, 1, 10);
        SELECT 'ADVERTENCIA: El teléfono era muy largo y fue recortado.' AS Mensaje;
    ELSE
        SET v_telefono_corto = p_nuevo_telefono;
        SELECT 'ÉXITO: Teléfono guardado correctamente.' AS Mensaje;
    END IF;
END //
DELIMITER ;

/*Ejercicio 13
Cree un procedimiento almacenado llamado
SP_GUARDAR_CIUDAD_CORTA que reciba el código
de una oficina y el nombre de una ciudad. El
procedimiento debe almacenar la ciudad en una
variable local VARCHAR(8) y posteriormente
actualizar el valor en la tabla correspondiente. Si se
genera una advertencia, debe mostrar un mensaje
indicando que el nombre fue truncado.*/
DELIMITER //
 
CREATE PROCEDURE SP_GUARDAR_CIUDAD_CORTA(IN p_codigo_oficina VARCHAR(50),IN p_ciudad VARCHAR(50))
BEGIN
    DECLARE v_ciudad VARCHAR(8);
    DECLARE v_warning BOOLEAN DEFAULT FALSE; 
    
    DECLARE CONTINUE HANDLER FOR SQLWARNING
        SET v_warning = TRUE; 
	end;
    SET v_ciudad = p_ciudad;  
    IF v_warning = TRUE THEN
        SELECT 'ADVERTENCIA: El nombre de la ciudad era muy largo y fue truncado.' AS mensaje, 
               v_ciudad AS valor_almacenado; 
    ELSE 
        SELECT 'ÉXITO: Ciudad actualizada correctamente.' AS mensaje, 
               v_ciudad AS valor_almacenado; 
    END IF; 
      UPDATE oficina
    SET ciudad = v_ciudad
    WHERE codigo_oficina = p_codigo_oficina;
END //
DELIMITER ;

/*Ejercicio 14
Cree un procedimiento almacenado llamado
SP_BUSCAR_PRODUCTO_POR_CODIGO que reciba
el código de un producto. El procedimiento debe
consultar su nombre y mostrarlo. Si el producto no
existe, debe devolver el mensaje “Producto no
encontrado”.
*/
DELIMITER //
CREATE PROCEDURE SP_BUSCAR_PRODUCTO_POR_CODIGO(IN p_codigo_producto INT)
BEGIN
	-- Variable donde guardaremos el nombre del producto -- 
	DECLARE v_nombre_producto VARCHAR(100);
    -- Variable de control para saber si no se encontró el producto --
	DECLARE v_no_encontrado BOOLEAN DEFAULT FALSE; 	
    -- Handler para cuando el SELECT no devuelve resultados --
    DECLARE CONTINUE HANDLER FOR NOT FOUND
	BEGIN 
		SET v_no_encontrado = TRUE; 
	END;
 
	-- Intentamos buscar el nombre del producto -- 
	SELECT nombre INTO v_nombre_producto FROM producto WHERE codigo_producto = p_codigo_producto;
	-- Evaluamos si se encontró o no -- 
	IF v_no_encontrado = TRUE THEN
		SELECT 'Producto no encontrado' AS mensaje; 
	ELSE 
		SELECT v_nombre_producto AS nombre; 
	END IF;
END//
DELIMITER ;
CALL SP_BUSCAR_PRODUCTO_POR_CODIGO(11679);

/*Ejercicio 15
Cree un procedimiento almacenado llamado
SP_BUSCAR_PEDIDO que reciba el código de un
pedido y consulte su estado. Si el pedido existe,
debe mostrar el estado correspondiente. Si no
existe, debe mostrar el mensaje “Pedido no
encontrado”.
*/
DELIMITER //
 
CREATE PROCEDURE sp_buscar_pedido(IN p_codigo_pedido INT)
BEGIN
    DECLARE v_estado VARCHAR(50);
    DECLARE v_no_encontrado BOOLEAN DEFAULT FALSE;
    -- Handler para capturar cuando el código de pedido no existe
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
    BEGIN
        SET v_no_encontrado = TRUE;
    END;
    
    -- Consultamos el estado del pedido y lo guardamos en la variable
    SELECT estado 
    INTO v_estado 
    FROM pedido 
    WHERE codigo_pedido = p_codigo_pedido;
 
    -- Evaluación de control
    IF v_no_encontrado = TRUE THEN
        SELECT 'Pedido no encontrado' AS mensaje;
    ELSE
        SELECT v_estado AS estado_del_pedido;
    END IF;
END //
DELIMITER ;
CALL sp_buscar_pedido(999);  -- si existe
CALL sp_buscar_pedido(101);  -- no existe