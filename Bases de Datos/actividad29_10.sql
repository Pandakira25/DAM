drop database if exists supermercado;
create database supermercado;
use supermercado;

create table if not exists producto(
productoID int not null primary key,
precio double,
nombre varchar(30),
descripcion varchar(100),
stock int,
codigo_barras varchar(100) unique
);

create table if not exists cliente(
clienteID int primary key not null,
nombre varchar(50),
apellidos varchar(60)
);

create table if not exists pedido(
pedidoID int primary key not null, 
precioTotal double not null,
fecha date not null,
clienteID int,
foreign key (clienteID) references cliente(clienteID)
);

create table if not exists pedidoProducto (
unidades int not null,
pedidoId int,
foreign key (pedidoID) references pedido(pedidoID),
productoId int,
foreign key (productoID) references producto(productoID)
);

create table if not exists direccion(
direccionID int not null primary key,
nombre_calle varchar(80) not null,
numero int not null,
piso int,
puerta varchar(20),
codigo_postal varchar(20) not null,
ciudad varchar(50) not null,
clienteID int,
foreign key (clienteID) references cliente(clienteID)
);

/*Forma de insertar valores a las tablas*/
insert into producto values(105,15,"Mouse USB","Mouse De Cable USB",100,"7071234559");
insert into producto values(106,30,"Shampoo","Shampoo para pelo",100,"7071234558");

insert into cliente values(501,"zoe","Jastreb");

insert into pedido values (100,15,"2025-10-31",501);

insert into pedidoProducto values(1,100,105);
insert into pedidoProducto values(2,100,106);

insert into direccion values(001,"aguero",3329,3,"4",106,"paris",501);

/*el orden de los factores altera el producto*/

select * from cliente;
select * from producto;
select * from pedido;
select * from pedidoProducto;
select * from direccion;