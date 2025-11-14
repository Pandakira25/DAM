drop database if exists ligaBaloncesto;
create database ligaBaloncesto;
use ligaBaloncesto;

create table if not exists equipo (
idEquipo int primary key,
nombre_equipo varchar(50) not null,
ciudad varchar(50),
web_oficial varchar(200),
puntos int
);

create table if not exists jugador (
idJugador int primary key,
nombre varchar(50) not null,
apellido varchar(50) not null,
posicion varchar(50),
fecha_alta date,
salario_bruto double,
altura float,
nom_equipo int,
foreign key (nom_equipo) references equipo(idEquipo),
idCapitan int,
foreign key (idCapitan) references jugador(idJugador)
);

create table if not exists partido (
resultado varchar(50),
arbitro int,
eLocal int,
eVisitante int,
fecha date,
primary key (eLocal,eVisitante, fecha),
foreign key (eLocal) references equipo(idEquipo),
foreign key (eVisitante) references equipo(idEquipo)
);

INSERT INTO equipo (idEquipo, nombre_equipo, ciudad, web_oficial, puntos) VALUES
(101, 'FC Barcelona Básquet', 'Barcelona', 'https://www.fcbarcelona.com', 10),
(102, 'Real Madrid', 'Madrid', 'https://www.realmadrid.com', 9),
(103, 'Valencia Basket Club', 'Valencia', 'https://www.valenciabasket.com', 11),
(104, 'Casademont Zaragoza', 'Zaragoza', 'https://www.casademontzgz.es', 24),
(105, 'Club Baloncesto Gran Canaria', 'Las Palmas', 'https://cbgrancanaria.net', 14),
(106, 'Saski Baskonia', 'Vitoria', 'https://www.baskonia.com', 22);

INSERT INTO jugador (idJugador, nombre, apellido, posicion, fecha_alta, salario_bruto, altura, nom_equipo, idCapitan) VALUES
(1, 'Alejandro', 'ARAGON ESPINOZA', 'Alero', '2025-10-12', 1800, 1.90, 105, 1),
(5, 'Hugo', 'GARCÍA SALAZAR', 'Alero', '2023-09-10', 1800, 1.72, 105, 1),
(11, 'Luis Daniel', 'LOPEZ MILICIA', 'Base', '2024-04-07', 1700, 1.73, 105, 1),
(18, 'Maria Pilar', 'Martin Gomez', 'Pivot', '2025-03-11', 2300, 1.60, 105, 1),
(13, 'David', 'MORENO SORIANO', 'Pivot', '2025-03-30', 2300, 1.70, 105, 1),

(4, 'Gabriel', 'FERNÁNDEZ CAÑADAS', 'Escolta', '2023-04-01', 2200, 1.82, 104, 4),
(7, 'Inmaculada', 'GIL ESCRIBANO', 'Base', '2024-01-28', 1700, 1.65, 104, 4),
(10, 'Jaime', 'LIZARZA ARNANZ', 'Pivot', '2024-11-21', 2300, 1.89, 104, 4),

(8, 'Miguel Nicolás', 'GÓMEZ PEARSON', 'Escolta', '2024-02-27', 2200, 1.79, 103, 8),
(2, 'Yeray', 'ARIAS BETHENCOURT', 'Pivot', '2024-09-02', 2300, 1.80, 103, 8),
(14, 'Daniel', 'PARRA SEGOVIA', 'Pivot', '2025-01-10', 2300, 1.74, 103, 8),

(16, 'Ana Belén', 'RUEDA REINA', 'Escolta', '2023-11-02', 2200, 1.65, 102, 16),
(3, 'Adonis David', 'CARPIO ROMERO', 'Base', '2024-03-01', 1700, 1.90, 102, 16),
(9, 'Zoe Mariel', 'JASTREB', 'Alero', '2023-10-30', 1800, 1.61, 102, 16),

(17, 'Fiorella Ruth', 'ALBÚJAR ALBINO', 'Alero', '2025-03-30', 2200, 1.60, 101, 17),
(6, 'Stiv Brandon GAVIRIA RAMOS', 'GARCÍA SALAZAR', 'Pivot', '2023-11-29', 2300, 1.87, 101, 17),
(12, 'David', 'MARTÍNEZ GALLEGO', 'Escolta', '2025-03-31', 1900, 1.60, 101, 17),

(19, 'Luz Adriana', 'Perdomo', 'Alero', '2025-05-19', 2200, 1.60, 104, 19),
(15, 'Juan Antonio', 'ROS FERNÁNDEZ', 'Base', '2025-01-19', 1700, 1.75, 104, 19),
(20, 'Carlos', 'Elvira', 'Escolta', '2024-01-31', 1900, 1.70, 104, 19);
    
INSERT INTO partido (elocal, evisitante, resultado, fecha, arbitro) VALUES
(101, 102, '100-100', '2025-10-04', 4),
(102, 103, '90-91', '2025-10-04', 5),
(103, 104, '88-77', '2025-10-11', 6),
(101, 105, '66-78', '2025-10-18', 6),
(102, 104, '90-90', '2025-10-25', 7),
(103, 105, '79-93', '2025-11-01', 3),
(104, 105, '91-99', '2025-11-08', 2),
(105, 102, '90-66', '2025-11-08', 1),
(101, 104, '110-70', '2025-11-15', 2);



















