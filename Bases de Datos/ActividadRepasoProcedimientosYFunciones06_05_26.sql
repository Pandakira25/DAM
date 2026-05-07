USE Jardineria;
-- ============================================================
--  PARTE 2 - SP_BUSCAR_CLIENTE
-- ============================================================
--
--  ARGUMENTACIÓN:
--  · Parámetro usado  : IN  → recibimos el código del cliente desde fuera.
--  · Qué recibe       : p_codigo_cliente INT, el identificador del cliente.
--  · Qué devuelve     : Un SELECT con nombre, ciudad y país del cliente,
--                       o un SELECT con el mensaje 'Cliente no encontrado'
--                       si no existe ningún registro con ese código.
--  · Cómo se llama    : CALL SP_BUSCAR_CLIENTE(5);
-- ============================================================

DELIMITER //

CREATE PROCEDURE SP_BUSCAR_CLIENTE(
    IN p_codigo_cliente INT
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO   v_existe
    FROM   cliente
    WHERE  codigo_cliente = p_codigo_cliente;

    IF v_existe > 0 THEN
        SELECT nombre_cliente AS Nombre, ciudad AS Ciudad,pais AS Pais FROM  cliente WHERE codigo_cliente = p_codigo_cliente;
    ELSE
        SELECT 'Cliente no encontrado' AS Mensaje;
    END IF;
END //

DELIMITER ;

-- ============================================================
--  PARTE 3 - FN_PRECIO_FINAL_STOCK
-- ============================================================
--
--  ARGUMENTACIÓN:
--  · Parámetro usado  : IN → código del producto (VARCHAR(15) como en la tabla).
--  · Qué recibe       : p_codigo_producto VARCHAR(15).
--  · Qué devuelve     : DECIMAL(15,2) → precio_venta con el descuento aplicado.
--  · Reglas de negocio:
--      - cantidad_en_stock >= 50       → 20% de descuento  (precio * 0.80)
--      - cantidad_en_stock entre 20-49 → 10% de descuento  (precio * 0.90)
--      - cantidad_en_stock entre  1-19 →  5% de descuento  (precio * 0.95)
--      - cantidad_en_stock = 0         →  0% de descuento  (precio * 1.00)
--  · Cómo se usa      : SELECT FN_PRECIO_FINAL_STOCK('FR-67');
-- ============================================================

DELIMITER //

CREATE FUNCTION FN_PRECIO_FINAL_STOCK(
    p_codigo_producto VARCHAR(15)
)
RETURNS DECIMAL(15, 2)
DETERMINISTIC
BEGIN
    DECLARE v_precio       DECIMAL(15, 2) DEFAULT 0.00;
    DECLARE v_stock        INT            DEFAULT 0;
    DECLARE v_precio_final DECIMAL(15, 2) DEFAULT 0.00;
    
    SELECT precio_venta, cantidad_en_stock INTO v_precio, v_stock FROM producto WHERE codigo_producto = p_codigo_producto LIMIT 1;
    
    IF v_stock >= 50 THEN
        -- Descuento del 20%
        SET v_precio_final = v_precio * 0.80;
    ELSEIF v_stock >= 20 THEN
        -- Descuento del 10%  (rango 20-49)
        SET v_precio_final = v_precio * 0.90;
    ELSEIF v_stock >= 1 THEN
        -- Descuento del 5%   (rango 1-19)
        SET v_precio_final = v_precio * 0.95;
    ELSE
        -- Stock = 0, sin descuento
        SET v_precio_final = v_precio * 1.00;
    END IF;

    RETURN v_precio_final;
END //

DELIMITER ;
