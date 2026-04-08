-- ============================================================
-- Grupo: Zoe, Dani y luis
-- Fecha: 08/04/2026
-- Proyecto: Gestión de la base de datos LIGA
-- ============================================================
--
-- FASE 1: ANALISIS DE LA BASE DE DATOS
-- ============================================================
--
-- TABLAS:
--   equipo   -> Equipos de la liga. Cada equipo tiene id, nombre,
--               ciudad, web y puntos acumulados en la temporada.
--
--   jugador  -> Jugadores registrados. Cada jugador pertenece a un
--               equipo (nom_equipo -> equipo.idEquipo) y tiene un
--               capitan asignado (idCapitan -> jugador.idJugador,
--               autoreferencia). Incluye posicion, salario y altura.
--
--   partido  -> Partidos jugados entre equipos. La PK es compuesta
--               (eLocal, eVisitante, fecha). El resultado se almacena
--               como texto (ej: '90-88'). Incluye arbitro (int).
--
-- RELACIONES:
--   jugador.nom_equipo  -> equipo.idEquipo   (N:1)
--   jugador.idCapitan   -> jugador.idJugador (N:1 autoreferencia)
--   partido.eLocal      -> equipo.idEquipo   (N:1)
--   partido.eVisitante  -> equipo.idEquipo   (N:1)
--
-- INFORMACION CONSULTABLE:
--   - Jugadores de un equipo, con o sin filtros por posicion/salario
--   - Partidos de un equipo (local o visitante)
--   - Total y promedio de salarios por equipo
--   - Clasificacion de equipos por puntos
--   - Capitan de un equipo
--   - Estadisticas de jugadores (altura media, salario total)
--
-- OPERACIONES AUTOMATIZABLES:
--   - Registrar nuevo jugador validando equipo existente
--   - Actualizar puntos de equipo tras partido
--   - Verificar si un jugador puede ser capitan
--   - Listar equipos segun nivel (alto/medio/bajo) por puntos
-- ============================================================
--
-- FASE 2: DISENO DE PROCEDIMIENTOS
--
--  1. sp_jugadores_por_equipo(IN idEq)
--        SELECT jugadores de un equipo dado su id.
--
--  2. sp_partidos_equipo(IN idEq)
--        SELECT todos los partidos donde el equipo es local o visitante.
--
--  3. sp_total_salarios(IN idEq, OUT total)
--        OUT total salario bruto de todos los jugadores del equipo.
--
--  4. sp_promedio_altura(IN idEq, OUT promedio)
--        OUT altura media de los jugadores del equipo.
--
--  5. sp_clasificar_equipo(IN idEq)
--        IF/CASE: clasifica equipo como Alto/Medio/Bajo segun puntos.
--
--  6. sp_puede_ser_capitan(IN idJug)
--        IF: verifica si el jugador lleva mas de 1 año en el equipo.
--
--  7. sp_acumular_salarios_equipo(IN idEq)
--        LOOP: recorre jugadores del equipo acumulando salario total.
--
--  8. sp_registrar_jugador(IN datos...) con HANDLER
--        Inserta jugador con manejo de error si equipo no existe.
--
--  9. sp_actualizar_puntos(IN idEq, IN incremento) con HANDLER
--        Actualiza puntos con manejo de error si equipo no existe.
--
-- 10. sp_informe_equipo(IN idEq)
--        INTEGRADOR: muestra nombre, jugadores, salario total,
--        altura media y clasificacion del equipo.

-- ============================================================
-- FASE 3: IMPLEMENTACION DE PROCEDIMIENTOS
-- ============================================================

DELIMITER //

-- ============================================================
-- PROCEDIMIENTO 1: SELECT - Jugadores de un equipo
-- Parametros: IN idEq INT
-- Resultado:  Tabla con jugadores del equipo ordenados por apellido
-- ============================================================
DROP PROCEDURE IF EXISTS sp_jugadores_por_equipo //
CREATE PROCEDURE sp_jugadores_por_equipo(IN idEq INT)
BEGIN
    SELECT j.idJugador,
           CONCAT(j.nombre, ' ', j.apellido) AS nombre_completo,
           j.posicion,
           j.fecha_alta,
           j.salario_bruto,
           j.altura
    FROM jugador j
    WHERE j.nom_equipo = idEq
    ORDER BY j.apellido;
END //

-- ============================================================
-- PROCEDIMIENTO 2: SELECT - Partidos de un equipo
-- Parametros: IN idEq INT
-- Resultado:  Tabla con todos los partidos del equipo
-- ============================================================
DROP PROCEDURE IF EXISTS sp_partidos_equipo //
CREATE PROCEDURE sp_partidos_equipo(IN idEq INT)
BEGIN
    SELECT p.fecha,
           el.nombre_equipo AS local,
           ev.nombre_equipo AS visitante,
           p.resultado
    FROM partido p
    INNER JOIN equipo el ON el.idEquipo = p.eLocal
    INNER JOIN equipo ev ON ev.idEquipo = p.eVisitante
    WHERE p.eLocal = idEq OR p.eVisitante = idEq
    ORDER BY p.fecha;
END //

-- ============================================================
-- PROCEDIMIENTO 3: OUT - Total salarios de un equipo
-- Parametros: IN idEq INT, OUT total DOUBLE
-- Resultado:  total = suma de salarios brutos del equipo
-- ============================================================
DROP PROCEDURE IF EXISTS sp_total_salarios //
CREATE PROCEDURE sp_total_salarios(IN idEq INT, OUT total DOUBLE)
BEGIN
    SELECT COALESCE(SUM(salario_bruto), 0)
    INTO total
    FROM jugador
    WHERE nom_equipo = idEq;
END //

-- ============================================================
-- PROCEDIMIENTO 4: OUT - Altura media de jugadores de un equipo
-- Parametros: IN idEq INT, OUT promedio FLOAT
-- Resultado:  promedio = media de altura de los jugadores
-- ============================================================
DROP PROCEDURE IF EXISTS sp_promedio_altura //
CREATE PROCEDURE sp_promedio_altura(IN idEq INT, OUT promedio FLOAT)
BEGIN
    SELECT COALESCE(AVG(altura), 0)
    INTO promedio
    FROM jugador
    WHERE nom_equipo = idEq;
END //

-- ============================================================
-- PROCEDIMIENTO 5: IF/CASE - Clasificar equipo por puntos
-- Parametros: IN idEq INT
-- Resultado:  Nombre del equipo y su nivel (Alto/Medio/Bajo)
-- Logica:     > 20 pts = Alto, 10-20 = Medio, < 10 = Bajo
-- ============================================================
DROP PROCEDURE IF EXISTS sp_clasificar_equipo //
CREATE PROCEDURE sp_clasificar_equipo(IN idEq INT)
BEGIN
    DECLARE v_nombre VARCHAR(50);
    DECLARE v_puntos INT;
    DECLARE v_nivel  VARCHAR(10);

    SELECT nombre_equipo, puntos
    INTO v_nombre, v_puntos
    FROM equipo
    WHERE idEquipo = idEq;

    IF v_nombre IS NULL THEN
        SELECT 'Equipo no encontrado' AS mensaje;
    ELSE
        SET v_nivel = CASE
            WHEN v_puntos > 20  THEN 'Alto'
            WHEN v_puntos >= 10 THEN 'Medio'
            ELSE 'Bajo'
        END;

        SELECT v_nombre   AS equipo,
               v_puntos   AS puntos,
               v_nivel    AS nivel;
    END IF;
END //

-- ============================================================
-- PROCEDIMIENTO 6: IF - Verificar si jugador puede ser capitan
-- Parametros: IN idJug INT
-- Resultado:  Mensaje indicando si cumple el requisito (>= 1 anio)
-- ============================================================
DROP PROCEDURE IF EXISTS sp_puede_ser_capitan //
CREATE PROCEDURE sp_puede_ser_capitan(IN idJug INT)
BEGIN
    DECLARE v_nombre     VARCHAR(100);
    DECLARE v_fecha_alta DATE;
    DECLARE v_anios      INT;

    SELECT CONCAT(nombre, ' ', apellido), fecha_alta
    INTO v_nombre, v_fecha_alta
    FROM jugador
    WHERE idJugador = idJug;

    IF v_nombre IS NULL THEN
        SELECT 'Jugador no encontrado' AS mensaje;
    ELSE
        SET v_anios = TIMESTAMPDIFF(YEAR, v_fecha_alta, CURDATE());

        IF v_anios >= 1 THEN
            SELECT v_nombre  AS jugador,
                   v_anios   AS anios_en_club,
                   'SI puede ser capitan' AS resultado;
        ELSE
            SELECT v_nombre  AS jugador,
                   v_anios   AS anios_en_club,
                   'NO puede ser capitan (menos de 1 anio)' AS resultado;
        END IF;
    END IF;
END //

-- ============================================================
-- PROCEDIMIENTO 7: LOOP - Acumular salarios con cursor
-- Parametros: IN idEq INT
-- Resultado:  Detalle de cada jugador y total acumulado al final
-- ============================================================
DROP PROCEDURE IF EXISTS sp_acumular_salarios_equipo //
CREATE PROCEDURE sp_acumular_salarios_equipo(IN idEq INT)
BEGIN
    DECLARE v_id      INT;
    DECLARE v_nombre  VARCHAR(100);
    DECLARE v_salario DOUBLE;
    DECLARE v_total   DOUBLE DEFAULT 0;
    DECLARE v_fin     INT DEFAULT 0;

    DECLARE cur CURSOR FOR
        SELECT idJugador, CONCAT(nombre, ' ', apellido), salario_bruto
        FROM jugador
        WHERE nom_equipo = idEq;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_fin = 1;

    DROP TEMPORARY TABLE IF EXISTS tmp_salarios;
    CREATE TEMPORARY TABLE tmp_salarios (
        idJugador     INT,
        nombre        VARCHAR(100),
        salario_bruto DOUBLE,
        acumulado     DOUBLE
    );

    OPEN cur;
    loop_salarios: LOOP
        FETCH cur INTO v_id, v_nombre, v_salario;
        IF v_fin = 1 THEN
            LEAVE loop_salarios;
        END IF;
        SET v_total = v_total + v_salario;
        INSERT INTO tmp_salarios VALUES (v_id, v_nombre, v_salario, v_total);
    END LOOP;
    CLOSE cur;

    SELECT * FROM tmp_salarios;
    DROP TEMPORARY TABLE tmp_salarios;
END //

-- ============================================================
-- PROCEDIMIENTO 8: HANDLER - Registrar nuevo jugador
-- Parametros: todos los campos del jugador
-- Resultado:  Inserta o muestra error si el equipo no existe
-- ============================================================
DROP PROCEDURE IF EXISTS sp_registrar_jugador //
CREATE PROCEDURE sp_registrar_jugador(
    IN p_id       INT,
    IN p_nombre   VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_posicion VARCHAR(50),
    IN p_fecha    DATE,
    IN p_salario  DOUBLE,
    IN p_altura   FLOAT,
    IN p_equipo   INT,
    IN p_capitan  INT
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: no se pudo registrar el jugador. Verifique los datos.' AS mensaje;
    END;

    SELECT COUNT(*) INTO v_existe FROM equipo WHERE idEquipo = p_equipo;
    IF v_existe = 0 THEN
        SELECT CONCAT('Error: el equipo con id ', p_equipo, ' no existe.') AS mensaje;
    ELSE
        START TRANSACTION;
        INSERT INTO jugador
            (idJugador, nombre, apellido, posicion, fecha_alta, salario_bruto, altura, nom_equipo, idCapitan)
        VALUES
            (p_id, p_nombre, p_apellido, p_posicion, p_fecha, p_salario, p_altura, p_equipo, p_capitan);
        COMMIT;
        SELECT CONCAT('Jugador ', p_nombre, ' ', p_apellido, ' registrado correctamente.') AS mensaje;
    END IF;
END //

-- ============================================================
-- PROCEDIMIENTO 9: HANDLER - Actualizar puntos de un equipo
-- Parametros: IN idEq INT, IN incremento INT
-- Resultado:  Suma incremento a los puntos o muestra error
-- ============================================================
DROP PROCEDURE IF EXISTS sp_actualizar_puntos //
CREATE PROCEDURE sp_actualizar_puntos(IN idEq INT, IN incremento INT)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error inesperado al actualizar puntos.' AS mensaje;
    END;

    SELECT COUNT(*) INTO v_existe FROM equipo WHERE idEquipo = idEq;

    IF v_existe = 0 THEN
        SELECT CONCAT('Error: equipo con id ', idEq, ' no encontrado.') AS mensaje;
    ELSE
        START TRANSACTION;
        UPDATE equipo SET puntos = puntos + incremento WHERE idEquipo = idEq;
        COMMIT;
        SELECT CONCAT('Puntos actualizados correctamente para equipo ', idEq) AS mensaje;
    END IF;
END //

-- ============================================================
-- PROCEDIMIENTO 10: INTEGRADOR - Informe completo de un equipo
-- Parametros: IN idEq INT
-- Resultado:  Datos del equipo, jugadores, salario total,
--             altura media y nivel de clasificacion
-- ============================================================
DROP PROCEDURE IF EXISTS sp_informe_equipo //
CREATE PROCEDURE sp_informe_equipo(IN idEq INT)
BEGIN
    DECLARE v_nombre    VARCHAR(50);
    DECLARE v_ciudad    VARCHAR(50);
    DECLARE v_puntos    INT;
    DECLARE v_total_sal DOUBLE;
    DECLARE v_avg_alt   FLOAT;
    DECLARE v_njug      INT;
    DECLARE v_nivel     VARCHAR(10);
    DECLARE v_capitan   VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT 'Error inesperado al generar el informe.' AS mensaje;

    SELECT nombre_equipo, ciudad, puntos
    INTO v_nombre, v_ciudad, v_puntos
    FROM equipo
    WHERE idEquipo = idEq;

    IF v_nombre IS NULL THEN
        SELECT CONCAT('Equipo con id ', idEq, ' no encontrado.') AS mensaje;
    ELSE
        -- Estadisticas de jugadores
        SELECT COUNT(*), COALESCE(SUM(salario_bruto), 0), COALESCE(AVG(altura), 0)
        INTO v_njug, v_total_sal, v_avg_alt
        FROM jugador
        WHERE nom_equipo = idEq;

        -- Nombre del capitan (busca el que es su propio capitan = capitan del equipo)
        SELECT CONCAT(nombre, ' ', apellido)
        INTO v_capitan
        FROM jugador
        WHERE nom_equipo = idEq AND idJugador = idCapitan
        LIMIT 1;

        -- Clasificacion por puntos
        SET v_nivel = CASE
            WHEN v_puntos > 20  THEN 'Alto'
            WHEN v_puntos >= 10 THEN 'Medio'
            ELSE 'Bajo'
        END;

        -- Resumen del equipo
        SELECT v_nombre        AS equipo,
               v_ciudad        AS ciudad,
               v_puntos        AS puntos,
               v_nivel         AS nivel,
               v_njug          AS num_jugadores,
               v_total_sal     AS masa_salarial,
               ROUND(v_avg_alt, 2) AS altura_media,
               COALESCE(v_capitan, 'Sin capitan asignado') AS capitan;

        -- Listado de jugadores
        SELECT CONCAT(nombre, ' ', apellido) AS jugador,
               posicion,
               salario_bruto,
               ROUND(altura, 2) AS altura
        FROM jugador
        WHERE nom_equipo = idEq
        ORDER BY apellido;
    END IF;
END //

DELIMITER ;

-- ============================================================
-- FASE 4: PRUEBAS
-- ============================================================

-- ------------------------------------------------------------
-- TEST 1a: sp_jugadores_por_equipo - caso correcto (equipo 104)
-- ------------------------------------------------------------
CALL sp_jugadores_por_equipo(104);

-- ------------------------------------------------------------
-- TEST 1b: sp_jugadores_por_equipo - equipo sin jugadores
-- ------------------------------------------------------------
CALL sp_jugadores_por_equipo(106);

-- ------------------------------------------------------------
-- TEST 2a: sp_partidos_equipo - caso correcto (equipo 101)
-- ------------------------------------------------------------
CALL sp_partidos_equipo(101);

-- ------------------------------------------------------------
-- TEST 2b: sp_partidos_equipo - equipo sin partidos
-- ------------------------------------------------------------
CALL sp_partidos_equipo(106);

-- ------------------------------------------------------------
-- TEST 3a: sp_total_salarios - caso correcto
-- ------------------------------------------------------------
CALL sp_total_salarios(105, @total);
SELECT @total AS total_salarios_105;

-- ------------------------------------------------------------
-- TEST 3b: sp_total_salarios - equipo inexistente (retorna 0)
-- ------------------------------------------------------------
CALL sp_total_salarios(999, @total);
SELECT @total AS total_salarios_999;

-- ------------------------------------------------------------
-- TEST 4a: sp_promedio_altura - caso correcto
-- ------------------------------------------------------------
CALL sp_promedio_altura(103, @avg);
SELECT ROUND(@avg, 2) AS altura_media_103;

-- ------------------------------------------------------------
-- TEST 4b: sp_promedio_altura - equipo sin jugadores
-- ------------------------------------------------------------
CALL sp_promedio_altura(106, @avg);
SELECT @avg AS altura_media_106;

-- ------------------------------------------------------------
-- TEST 5a: sp_clasificar_equipo - equipo con nivel Alto (104=24pts)
-- ------------------------------------------------------------
CALL sp_clasificar_equipo(104);

-- ------------------------------------------------------------
-- TEST 5b: sp_clasificar_equipo - equipo inexistente
-- ------------------------------------------------------------
CALL sp_clasificar_equipo(999);

-- ------------------------------------------------------------
-- TEST 6a: sp_puede_ser_capitan - jugador antiguo (id 5, alta 2023)
-- ------------------------------------------------------------
CALL sp_puede_ser_capitan(5);

-- ------------------------------------------------------------
-- TEST 6b: sp_puede_ser_capitan - jugador nuevo (id 1, alta 2025)
-- ------------------------------------------------------------
CALL sp_puede_ser_capitan(1);

-- ------------------------------------------------------------
-- TEST 7a: sp_acumular_salarios_equipo - caso correcto (equipo 102)
-- ------------------------------------------------------------
CALL sp_acumular_salarios_equipo(102);

-- ------------------------------------------------------------
-- TEST 7b: sp_acumular_salarios_equipo - equipo sin jugadores
-- ------------------------------------------------------------
CALL sp_acumular_salarios_equipo(106);

-- ------------------------------------------------------------
-- TEST 8a: sp_registrar_jugador - caso correcto
-- ------------------------------------------------------------
CALL sp_registrar_jugador(21, 'Carlos', 'Nuevo', 'Base', '2025-01-01', 1800, 1.85, 106, 21);
SELECT * FROM jugador WHERE idJugador = 21;

-- ------------------------------------------------------------
-- TEST 8b: sp_registrar_jugador - equipo inexistente
-- ------------------------------------------------------------
CALL sp_registrar_jugador(22, 'Test', 'Error', 'Alero', '2025-01-01', 1500, 1.75, 999, 22);

-- ------------------------------------------------------------
-- TEST 8c: sp_registrar_jugador - id duplicado (error FK/PK)
-- ------------------------------------------------------------
CALL sp_registrar_jugador(21, 'Duplicado', 'Error', 'Pivot', '2025-01-01', 2000, 1.80, 106, 21);

-- ------------------------------------------------------------
-- TEST 9a: sp_actualizar_puntos - caso correcto (+2 al equipo 106)
-- ------------------------------------------------------------
SELECT puntos FROM equipo WHERE idEquipo = 106;
CALL sp_actualizar_puntos(106, 2);
SELECT puntos FROM equipo WHERE idEquipo = 106;

-- ------------------------------------------------------------
-- TEST 9b: sp_actualizar_puntos - equipo inexistente
-- ------------------------------------------------------------
CALL sp_actualizar_puntos(999, 5);

-- ------------------------------------------------------------
-- TEST 10a: sp_informe_equipo - caso correcto (equipo 104)
-- ------------------------------------------------------------
CALL sp_informe_equipo(104);

-- ------------------------------------------------------------
-- TEST 10b: sp_informe_equipo - equipo inexistente
-- ------------------------------------------------------------
CALL sp_informe_equipo(999);