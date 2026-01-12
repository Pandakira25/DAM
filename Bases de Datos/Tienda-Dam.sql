/* =========================================================
   BD para practicar JOINs 
   ========================================================= */

DROP DATABASE IF EXISTS VentasDAM;
CREATE DATABASE VentasDAM;
USE VentasDAM;

-- =========================
-- TABLAS
-- =========================

DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS vendedor;

CREATE TABLE vendedor (
  id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre      VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre     VARCHAR(80) NOT NULL,
  email      VARCHAR(120) NOT NULL UNIQUE,
  ciudad     VARCHAR(60)  NOT NULL,
  fecha_alta DATE         NOT NULL
);

CREATE TABLE pedido (
  id_pedido     INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente    INT NOT NULL,
  id_vendedor   INT NOT NULL,
  fecha_pedido  DATE NOT NULL,
  total         DECIMAL(10,2) NOT NULL,
  estado        ENUM('PENDIENTE','PAGADO','ENVIADO','CANCELADO') NOT NULL,

  CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES cliente(id_cliente),

  CONSTRAINT fk_pedido_vendedor
    FOREIGN KEY (id_vendedor)
    REFERENCES vendedor(id_vendedor)
);

CREATE INDEX idx_pedido_cliente  ON pedido(id_cliente);
CREATE INDEX idx_pedido_vendedor ON pedido(id_vendedor);
CREATE INDEX idx_pedido_fecha    ON pedido(fecha_pedido);

-- =========================
-- DATOS: VENDEDORES (15)
-- =========================
INSERT INTO vendedor (nombre) VALUES
('Luis'),
('Zoe'),
('Inma'),
('David'),
('Miguel'),
('Hugo'),
('Juan'),
('Daniel'),
('Gabriel'),
('Fío'),
('Yeray'),
('Brandon'),
('Jaime'),
('Ana'),
('Sr Martinez');

-- =========================
-- DATOS: CLIENTES (30)
-- =========================
INSERT INTO cliente (nombre, email, ciudad, fecha_alta) VALUES
('Ana Pérez',        'ana.perez@example.com',        'Madrid',     '2025-01-15'),
('Carlos Gómez',     'carlos.gomez@example.com',     'Madrid',     '2025-02-02'),
('Lucía Martín',     'lucia.martin@example.com',     'Valencia',   '2025-02-20'),
('Javier Ruiz',      'javier.ruiz@example.com',      'Sevilla',    '2025-03-01'),
('María López',      'maria.lopez@example.com',      'Barcelona',  '2025-03-18'),
('Sergio Torres',    'sergio.torres@example.com',    'Bilbao',     '2025-04-05'),
('Paula Sánchez',    'paula.sanchez@example.com',    'Zaragoza',   '2025-04-21'),
('Diego Navarro',    'diego.navarro@example.com',    'Málaga',     '2025-05-09'),
('Elena Romero',     'elena.romero@example.com',     'Murcia',     '2025-05-26'),
('Adrián Vidal',     'adrian.vidal@example.com',     'Alicante',   '2025-06-11'),
('Carmen Ortiz',     'carmen.ortiz@example.com',     'Granada',    '2025-06-23'),
('Iván Molina',      'ivan.molina@example.com',      'Córdoba',    '2025-07-02'),
('Sofía Iglesias',   'sofia.iglesias@example.com',   'Valladolid', '2025-07-15'),
('Pablo Castro',     'pablo.castro@example.com',     'Madrid',     '2025-07-29'),
('Laura Vega',       'laura.vega@example.com',       'Barcelona',  '2025-08-06'),
('Raúl Herrera',     'raul.herrera@example.com',     'Valencia',   '2025-08-19'),
('Nuria León',       'nuria.leon@example.com',       'Sevilla',    '2025-08-27'),
('Héctor Santos',    'hector.santos@example.com',    'Bilbao',     '2025-09-03'),
('Isabel Flores',    'isabel.flores@example.com',    'Zaragoza',   '2025-09-10'),
('Álvaro Campos',    'alvaro.campos@example.com',    'Málaga',     '2025-09-18'),
('Marta Rojas',      'marta.rojas@example.com',      'Murcia',     '2025-09-25'),
('Juanita Gil',      'juanita.gil@example.com',      'Alicante',   '2025-10-02'),
('Gonzalo Prieto',   'gonzalo.prieto@example.com',   'Granada',    '2025-10-09'),
('Patricia Muñoz',   'patricia.munoz@example.com',   'Córdoba',    '2025-10-16'),
('Óscar Delgado',    'oscar.delgado@example.com',    'Valladolid', '2025-10-23'),
('Teresa Marín',     'teresa.marin@example.com',     'Madrid',     '2025-10-30'),
('Víctor Paredes',   'victor.paredes@example.com',   'Barcelona',  '2025-11-05'),
('Clara Núñez',      'clara.nunez@example.com',      'Valencia',   '2025-11-12'),
('Manuel Cano',      'manuel.cano@example.com',      'Sevilla',    '2025-11-19'),
('Beatriz Ferrer',   'beatriz.ferrer@example.com',   'Bilbao',     '2025-11-26');

-- =========================
-- DATOS: PEDIDOS (50)
-- =========================
INSERT INTO pedido (id_pedido, id_cliente, id_vendedor, fecha_pedido, total, estado) VALUES
( 1,  1,  1, '2025-10-01',  89.90, 'PAGADO'),
( 2,  2,  2, '2025-10-02', 149.50, 'ENVIADO'),
( 3,  3,  3, '2025-10-03',  29.99, 'PAGADO'),
( 4,  4,  4, '2025-10-04', 210.00, 'PENDIENTE'),
( 5,  5,  5, '2025-10-05',  57.40, 'PAGADO'),
( 6,  6,  6, '2025-10-06',  99.95, 'ENVIADO'),
( 7,  7,  7, '2025-10-07',  12.50, 'CANCELADO'),
( 8,  8,  8, '2025-10-08', 340.10, 'PAGADO'),
( 9,  9,  9, '2025-10-09',  75.00, 'PAGADO'),
(10, 10, 10, '2025-10-10', 180.80, 'ENVIADO'),

(11, 11,  1, '2025-10-12',  44.60, 'PAGADO'),
(12, 12,  2, '2025-10-14',  65.20, 'PENDIENTE'),
(13, 13,  3, '2025-10-15', 130.00, 'ENVIADO'),
(14, 14,  4, '2025-10-18',  19.90, 'PAGADO'),
(15, 15,  5, '2025-10-20',  88.80, 'PAGADO'),
(16, 16,  6, '2025-10-22', 250.00, 'ENVIADO'),
(17, 17,  7, '2025-10-24',  33.33, 'CANCELADO'),
(18, 18,  8, '2025-10-26',  59.90, 'PAGADO'),
(19, 19,  9, '2025-10-28', 175.75, 'PAGADO'),
(20, 20, 10, '2025-10-31',  22.10, 'PENDIENTE'),

(21, 21,  1, '2025-11-02',  49.99, 'PAGADO'),
(22, 22,  2, '2025-11-03',  79.00, 'ENVIADO'),
(23, 23,  3, '2025-11-05',  15.00, 'PAGADO'),
(24, 24,  4, '2025-11-07', 320.40, 'ENVIADO'),
(25, 25,  5, '2025-11-08',  98.70, 'PENDIENTE'),
(26, 26,  6, '2025-11-10',  60.00, 'PAGADO'),
(27, 27,  7, '2025-11-12', 199.90, 'ENVIADO'),
(28, 28,  8, '2025-11-14',  25.25, 'PAGADO'),
(29, 29,  9, '2025-11-16', 110.00, 'PAGADO'),
(30, 30, 10, '2025-11-18',  45.45, 'CANCELADO'),

(31,  1,  2, '2025-11-20',  70.00, 'PAGADO'),
(32,  2,  3, '2025-11-22',  90.90, 'ENVIADO'),
(33,  3,  4, '2025-11-24', 150.00, 'PENDIENTE'),
(34,  4,  5, '2025-11-26',  35.00, 'PAGADO'),
(35,  5,  6, '2025-11-28',  99.00, 'ENVIADO'),

(36,  6,  7, '2025-12-01',  10.00, 'PAGADO'),
(37,  7,  8, '2025-12-03',  55.55, 'PENDIENTE'),
(38,  8,  9, '2025-12-05', 220.00, 'ENVIADO'),
(39,  9, 10, '2025-12-06',  17.99, 'PAGADO'),
(40, 10,  1, '2025-12-08',  75.75, 'PAGADO'),

(41, 11,  2, '2025-12-10',  85.00, 'ENVIADO'),
(42, 12,  3, '2025-12-12',  48.90, 'PAGADO'),
(43, 13,  4, '2025-12-14', 300.00, 'PENDIENTE'),
(44, 14,  5, '2025-12-15',  26.60, 'PAGADO'),
(45, 15,  6, '2025-12-17', 120.00, 'ENVIADO'),

(46, 16,  7, '2025-12-19',  64.64, 'PAGADO'),
(47, 17,  8, '2025-12-20',  39.90, 'CANCELADO'),
(48, 18,  9, '2025-12-22', 180.00, 'PAGADO'),
(49, 19, 10, '2025-12-27',  95.00, 'ENVIADO'),
(50, 20,  1, '2025-12-31',  12.00, 'PAGADO');

-- =========================

-- Ver el nombre del cliente y su número de pedido  y el estado de este

select nombre, id_pedido, estado from cliente c, pedido p where c.id_cliente = p.id_cliente;

select nombre, id_pedido, estado from cliente c join pedido p on c.id_cliente = p.id_cliente;
