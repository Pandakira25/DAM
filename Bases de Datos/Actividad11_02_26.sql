/*
NOMBRE DE ESTUDIANTE: 
DOCENTE: LUZ PERDOMO
TEMA: Análisis y modificación de un esquema de base de datos en SQL
MÓDULO: BBDD 

Una federación/organización deportiva está desarrollando un sistema de base de
datos para gestionar torneos profesionales de tenis (o eventos similares), con el
objetivo de controlar de forma centralizada:
• La información general de cada torneo (nombre, nivel oficial y fechas).
• Los responsables/organizadores que administran áreas del torneo (logística,
arbitraje, prensa, seguridad, etc.), con su presupuesto asignado.
• El reglamento aplicado (normas técnicas, de conducta y de juego), con fecha
de aprobación.
• Los partidos del torneo, incluyendo:
o a qué torneo pertenecen,
o quién fue el responsable asignado a su coordinación,
o qué reglamento se aplicó,
o fecha del partido y estado (pendiente / en juego / finalizado).
• Los documentos asociados a cada partido, como informes, estadísticas o
resultados oficiales.
Entrega final
La entrega consistirá en un único archivo SQL (.sql), correctamente organizado y
comentado, en el que se evidencie de forma clara:
1. La creación inicial de la base de datos y sus tablas.
2. La aplicación de cada una de las modificaciones solicitadas, en el mismo
orden planteado.
3. Comentarios que identifiquen claramente cada bloque de cambios.



 BLOQUE 1: CREACIÓN INICIAL DE LA BASE DE DATOS Y SUS TABLAS
   Se definen las tablas según el script original proporcionado.
*/
-- ============================================
-- BASE DE DATOS: TORNEOS (MySQL 8+)
-- ============================================

-- (Opcional) Crear y usar BD
CREATE DATABASE IF NOT EXISTS torneos;
USE torneos;

-- Limpieza (por orden de dependencias)
DROP TABLE IF EXISTS DOCUMENTOPARTIDO;
DROP TABLE IF EXISTS PARTIDO;
DROP TABLE IF EXISTS REGLAMENTO;
DROP TABLE IF EXISTS ORGANIZADOR;
DROP TABLE IF EXISTS TORNEO;

-- ============================================
-- Tabla: TORNEO
-- ============================================
CREATE TABLE TORNEO (
    idTorneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(500),
    fechaInicio DATE NOT NULL DEFAULT (CURRENT_DATE),
    nivel VARCHAR(10) NOT NULL,
    CONSTRAINT CH_TORNEO_NIVEL
        CHECK (nivel IN ('Grand Slam', 'ATP 500', 'WTA 500'))
) ENGINE=InnoDB;

-- ============================================
-- Tabla: ORGANIZADOR
-- ============================================
CREATE TABLE ORGANIZADOR (
    idOrganizador INT AUTO_INCREMENT PRIMARY KEY,
    nombreOrganizador VARCHAR(100) NOT NULL,
    region VARCHAR(20),
    rolResponsabilidad VARCHAR(200),
    presupuestoAsignado DECIMAL(12,2) NOT NULL
) ENGINE=InnoDB;

-- ============================================
-- Tabla: REGLAMENTO
-- ============================================
CREATE TABLE REGLAMENTO (
    idReglamento INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(300) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    fechaAprobacion DATE NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT CH_REGLAMENTO_TIPO
        CHECK (tipo IN ('Técnico', 'Conducta', 'Juego'))
) ENGINE=InnoDB;

-- ============================================
-- Tabla: PARTIDO
-- ============================================
CREATE TABLE PARTIDO (
    idPartido INT PRIMARY KEY,
    idTorneo INT NOT NULL,
    idOrganizador INT NOT NULL,
    fechaPartido DATE NOT NULL,
    estado VARCHAR(15) NOT NULL,
    idReglamento INT NOT NULL,

    CONSTRAINT CH_PARTIDO_ESTADO
        CHECK (estado IN ('En Juego', 'Finalizado', 'Pendiente')),

    CONSTRAINT FK_PARTIDO_IDTORNEO
        FOREIGN KEY (idTorneo) REFERENCES TORNEO(idTorneo),

    CONSTRAINT FK_PARTIDO_IDORGANIZADOR
        FOREIGN KEY (idOrganizador) REFERENCES ORGANIZADOR(idOrganizador),

    CONSTRAINT FK_PARTIDO_IDREGLAMENTO
        FOREIGN KEY (idReglamento) REFERENCES REGLAMENTO(idReglamento)
) ENGINE=InnoDB;

-- ============================================
-- Tabla: DOCUMENTOPARTIDO
-- ============================================
CREATE TABLE DOCUMENTOPARTIDO (
    idDocumento INT AUTO_INCREMENT PRIMARY KEY,
    idPartido INT NOT NULL,
    tipoDocumento VARCHAR(20) NOT NULL,
    fechaCreacion DATE NOT NULL DEFAULT (CURRENT_DATE),
    contenidoResumen VARCHAR(500),

    CONSTRAINT CH_DOCUMENTO_TIPODOCUMENTO
        CHECK (tipoDocumento IN ('Informe', 'Estadística', 'Resultado')),

    CONSTRAINT FK_DOCUMENTO_IDPARTIDO
        FOREIGN KEY (idPartido) REFERENCES PARTIDO(idPartido)
) ENGINE=InnoDB;

-- Índices para mejorar rendimiento en FKs
CREATE INDEX IDX_PARTIDO_TORNEO ON PARTIDO(idTorneo);
CREATE INDEX IDX_PARTIDO_ORGANIZADOR ON PARTIDO(idOrganizador);
CREATE INDEX IDX_PARTIDO_REGLAMENTO ON PARTIDO(idReglamento);
CREATE INDEX IDX_DOCUMENTO_PARTIDO ON DOCUMENTOPARTIDO(idPartido);



-- 1) Renombrar tabla ORGANIZADOR a RESPONSABLE
RENAME TABLE ORGANIZADOR TO RESPONSABLE;

-- 2) Quitar el valor por defecto de fechaInicio en TORNEO
ALTER TABLE TORNEO MODIFY fechaInicio DATE NOT NULL;

-- 3) Eliminar la columna region de RESPONSABLE
ALTER TABLE RESPONSABLE DROP COLUMN region;

-- 4) Agregar unicidad a TORNEO.nombre
ALTER TABLE TORNEO ADD CONSTRAINT UQ_TORNEO_NOMBRE UNIQUE (nombre);

-- 5) Renombrar columna descripcion a detalle en REGLAMENTO
ALTER TABLE REGLAMENTO RENAME COLUMN descripcion TO detalle;

-- 6) CHECK en presupuestoAsignado de RESPONSABLE (100000 a 1000000)
ALTER TABLE RESPONSABLE ADD CONSTRAINT CH_RESPONSABLE_PRESUPUESTO CHECK (presupuestoAsignado BETWEEN 100000 AND 1000000);

-- 7) Desactivar temporalmente las FK en PARTIDO
SET FOREIGN_KEY_CHECKS = 0;

-- 8) Restaurar las FK en PARTIDO
SET FOREIGN_KEY_CHECKS = 1;

-- 9) Añadir y consultar comentario descriptivo en la tabla REGLAMENTO

-- Añadir comentario
ALTER TABLE REGLAMENTO COMMENT = 'Tabla que almacena los reglamentos técnicos, de conducta y de juego del torneo';

-- Consultar comentario
SELECT TABLE_NAME, TABLE_COMMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE()  AND TABLE_NAME = 'REGLAMENTO';

-- 10) Añadir y consultar comentario a la columna TORNEO.nivel

-- Añadir comentario
ALTER TABLE TORNEO MODIFY nivel VARCHAR(10) NOT NULL COMMENT 'Nivel oficial del torneo (Grand Slam, ATP 500, WTA 500)';

-- Consultar comentario
SELECT COLUMN_NAME, COLUMN_COMMENT FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE()  AND TABLE_NAME = 'TORNEO'  AND COLUMN_NAME = 'nivel';

