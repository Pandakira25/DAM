use jardineria;

create or replace view p1 as select ciudad, codigo_postal from oficina;

create or replace view p2 as select nombre, apellido1 from empleado where puesto = 'Director General';

create or replace view p3 as select nombre, puesto from empleado where lower(puesto) <> 'director oficina';

create or replace view p4 as select count(*) as "numero de empleados" from empleado;

create or replace view p5 as select count(*) as "número de clientes" from cliente where lower(pais) = "usa";

create or replace view p6 as select pais, count(*) as 'cantidad_clientes' from cliente group by pais order by cantidad_clientes asc;

create or replace view p7 as select cliente.nombre_cliente, empleado.nombre from cliente, empleado where cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

create or replace view p8 as select nombre_cliente from cliente where codigo_cliente in(select codigo_cliente from pago where fecha_pago like "2017%");

create or replace view p9 as select distinct estado from pedido;

create or replace view p10 as select pedido.codigo_cliente, pedido.fecha_entrega, pedido.fecha_esperada, cliente.nombre_cliente from pedido, cliente where cliente.codigo_cliente = pedido.codigo_cliente and pedido.fecha_entrega > fecha_esperada;

-- tarea averiguar como se hace
create or replace view p11 as select p.codigo_producto, p.nombre, p.gama from producto p, detalle_pedido where p.codigo_producto = detalle_pedido.codigo_producto;

create or replace view p12 as select nombre, apellido1, apellido2 from empleado where codigo_oficina in(select codigo_oficina from oficina where ciudad like 'Barcelona');

create or replace view p13 as select p.codigo_producto,sum(d.cantidad) as 'Cantidad de ventas' from producto p, detalle_pedido d where p.codigo_producto = d.codigo_producto group by p.codigo_producto;

create or replace view p14 as select distinct c.nombre_cliente from cliente c, pedido p where c.codigo_cliente = p.codigo_cliente and c.ciudad like 'Miami'; 

create or replace view p15 as select pa.total , pe.codigo_pedido from pago pa, pedido pe where pe.codigo_cliente = pa.codigo_cliente order by pa.total asc;

create or replace view p16 as select nombre_cliente, sum(p.total) as 'total pagado' from cliente c, pago p where c.codigo_cliente = p.codigo_cliente group by c.nombre_cliente;

create or replace view p17 as select p.gama, count(*) as 'número productos' from producto p, gama_producto gp where p.gama = gp.gama group by p.gama;

create or replace view p18 as select distinct pe.codigo_pedido from pedido pe, detalle_pedido dp where pe.codigo_pedido = dp.codigo_pedido and dp.codigo_producto in (select codigo_producto from producto where precio_venta = (select max(precio_venta) from producto p, gama_producto g where p.gama = g.gama and lower(g.gama) = 'aromáticas'));

create or replace view p19 as select pe.codigo_pedido from pedido pe, detalle_pedido dp where pe.codigo_pedido = dp.codigo_pedido group by pe.codigo_pedido having count(*)>=6;

create or replace view p20 as select pe.codigo_pedido from pedido pe where (select sum(dp.cantidad * dp.precio_unidad) from pedido p, detalle_pedido dp where p.codigo_pedido = dp.codigo_pedido and pe.codigo_pedido = p.codigo_pedido group by p.codigo_pedido) > (select avg(t.total) from (select p.codigo_pedido, sum(dp.cantidad * dp.precio_unidad) as total from pedido p, detalle_pedido dp where p.codigo_pedido = dp.codigo_pedido group by p.codigo_pedido) t);

-- para concatenar los apellidos mejor usar concat()
create or replace view p21 as select  e_subor.nombre as nombre_subor, 
									  e_subor.apellido1 || ' ' || e_subor.apellido2 as apellidos_subor,
									  o_subor.ciudad as ciudad_subor,
									  e_jefe.nombre as nombre_jefe,
									  e_jefe.apellido1 || ' ' || e_jefe.apellido2 as apellidos_jefe,
									  o_jefe.ciudad as ciudad_jefe
									 from empleado e_subor, empleado e_jefe, oficina o_subor, oficina o_jefe
                                     where e_subor.codigo_jefe = e_jefe.codigo_empleado 
                                     and o_subor.codigo_oficina = e_subor.codigo_oficina 
                                     and e_jefe.codigo_oficina = o_jefe.codigo_oficina;

create or replace view p22 as select p.codigo_pedido, sum(dp.cantidad * dp.precio_unidad) as total
									 from pedido p, detalle_pedido dp
                                     where p.codigo_pedido = dp.codigo_pedido
                                     group by p.codigo_pedido;

create or replace view p23 as select p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, c.nombre_cliente, pg.total
							  from pedido p, cliente c, pago pg
                              where p.codigo_cliente = c.codigo_cliente 
                              and pg.codigo_cliente = c.codigo_cliente
                              order by pg.total desc;

create or replace view p24 as select t.gama, t.cantidad from(select p.gama, sum(dp.cantidad) as cantidad from detalle_pedido dp, producto p where p.codigo_producto = dp.codigo_producto group by p.gama order by cantidad desc) t  limit 1;