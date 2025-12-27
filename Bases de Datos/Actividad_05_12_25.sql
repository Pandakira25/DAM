drop database if exists gestionTienda;
create database gestionTienda;
use gestionTienda;

create table if not exists fabricante(
cod_fabricante int primary key,
nombre varchar(15) check(nombre = upper(nombre)),
pais varchar(15),
check(nombre = upper(nombre)),
check(pais = upper(pais))
);

create table if not exists articulos(
articulo varchar(20),
cod_fabricante int,
foreign key (cod_fabricante) references fabricante(cod_fabricante),
peso double,
categoria enum('primera','segunda','tercera'),
primary key(articulo,cod_fabricante,peso,categoria),
precio_venta double,
precio_costo double,
existencias int,
check(precio_venta > 0 and precio_costo > 0 and peso > 0)
);

create table if not exists tiendas(
nif varchar(10) primary key,
nombre varchar(20),
direccion varchar(20),
poblacion varchar(20),
provincia varchar(20),
cod_postal varchar(5),
check(provincia = upper(provincia))
);

create table if not exists pedidos(
nif varchar(10),
foreign key(nif) references tiendas(nif),
articulo varchar(20),
cod_fabricante int,
foreign key(cod_fabricante) references fabricante(cod_fabricante),
peso double,
categoria enum('primera','segunda','tercera'),
fecha_pedido date,
unidades_pedidas int, -- admiten valores grandes
foreign key(articulo,cod_fabricante,peso,categoria)references articulos(articulo,cod_fabricante,peso,categoria),
check(unidades_pedidas > 0),
primary key(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido)
);

create table if not exists ventas(
nif varchar(10),
foreign key(nif) references tiendas(nif),
articulo varchar(20),
cod_fabricante int,
foreign key(cod_fabricante) references fabricante(cod_fabricante),
peso double,
categoria enum('primera','segunda','tercera'),
fecha_venta date,
unidades_vendidas int, -- admiten valores grandes
check(unidades_vendidas > 0),
foreign key(articulo,cod_fabricante,peso,categoria) references articulos(articulo,cod_fabricante,peso,categoria),
primary key(nif,articulo,cod_fabricante,peso,categoria,fecha_venta)
);

-- renombro la tabla fabricante a fabricantes
rename table fabricante to fabricantes;

-- creo que mysql actualiza automaticamente las referencias
select * from ventas;

alter table pedidos add column pvp double;
alter table ventas add column pvp double;

select * from pedidos;
select * from ventas;

-- restriccion para que no se puedan agregar mas tiendas en toledo
alter table tiendas add constraint chk_tiendas_provincia_toledo check(provincia <> 'TOLEDO');

alter table pedidos add constraint chk_pedidos_pvp_no_negativo check(pvp >=0);
alter table ventas add constraint chk_ventas_pvp_no_negativo check(pvp >=0);

-- eliminar la columna pvp de la tabla pedidos por posible error de diseño
alter table pedidos drop column pvp;

select * from pedidos;

-- Combina tipo de restricción y columnas involucradas en una sola vista
SELECT 
    tc.TABLE_NAME,       -- Tabla
    tc.CONSTRAINT_NAME,  -- Nombre de la restricción
    tc.CONSTRAINT_TYPE,  -- Tipo de restricción
    kcu.COLUMN_NAME,     -- Columna implicada
    kcu.ORDINAL_POSITION -- Posición de la columna en la restricción
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS kcu
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
    AND tc.TABLE_NAME = kcu.TABLE_NAME
    AND tc.TABLE_SCHEMA = kcu.TABLE_SCHEMA
WHERE tc.TABLE_SCHEMA = 'gestionTienda'
ORDER BY tc.TABLE_NAME, tc.CONSTRAINT_NAME, kcu.ORDINAL_POSITION;

-- Elimina la restriccion de que pvp sea mayor a cero en la tabla ventas
-- tal vez se necesita eliminar por motivos contables como devoluciones
-- Hay que tener cuidado por que una vez eliminado mysql ya no va a impedir valores "incorrectos"
alter table ventas drop constraint chk_ventas_pvp_no_negativo;

