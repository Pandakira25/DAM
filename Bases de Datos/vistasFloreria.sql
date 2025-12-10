create view p1 as select ciudad, codigo_postal from oficina;

create view p2 as select nombre, apellido1 from empleado where puesto = 'Director General';

create view p3 as select nombre, puesto from empleado where lower(puesto) <> 'director oficina';

create view p4 as select count(*) as "numero de empleados" from empleado;

create view p5 as select count(*) as "número de clientes" from cliente where lower(pais) = "usa";

create or replace view p6 as select pais, count(*) as 'cantidad_clientes' from cliente group by pais order by cantidad_clientes asc;

create or replace view p7 as select cliente.nombre_cliente, empleado.nombre from cliente, empleado where cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

create or replace view p8 as select nombre_cliente from cliente where codigo_cliente in(select codigo_cliente from pago where fecha_pago like "2017%");

create or replace view p9 as select distinct estado from pedido;

create or replace view p10 as select pedido.codigo_cliente, pedido.fecha_entrega, pedido.fecha_esperada, cliente.nombre_cliente from pedido, cliente where cliente.codigo_cliente = pedido.codigo_cliente and pedido.fecha_entrega > fecha_esperada;

-- tarea averiguar como se hace
create or replace view p11 as select p.codigo_producto, p.nombre, p.gama from producto p, detalle_pedido where p.codigo_producto = detalle_pedido.codigo_producto;

create or replace view p12 as select nombre, apellido1, apellido2 from empleado where codigo_oficina in(select codigo_oficina from oficina where ciudad like 'Barcelona');