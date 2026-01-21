use Jardineria;

-- ej2
-- nombre y país de todos los clientes y su código de pedido deben aparecer incluso los que no han comprado(cliente-pedido)
/*Voy a utilizar left join para darle prioridad a la tabla cliente para que se muestren todos los clientes independientemente de si encuentra una coincidencia en la tabla de pedido o no*/
select c.nombre_cliente, c.pais as paisCliente, p.codigo_pedido from cliente c left join pedido p on p.codigo_cliente = c.codigo_cliente;

-- ej5
-- código de pedido, fecha de pedido, nombre del producto, cantidad y precio por unidad (pedido-detalle pedido-producto)
/*Voy a usar un inner join ya que en este caso no se le debe dar prioridad a nada*/
select pe.codigo_pedido, pe.fecha_pedido, pr.nombre as nomberProducto, dp.cantidad, dp.precio_unidad from pedido pe join detalle_pedido dp on pe.codigo_pedido = dp.codigo_pedido join producto pr on dp.codigo_producto = pr.codigo_producto;

-- ej9
-- nombre empleado, puesto y la ciudad de la oficina en la que trabajan (empleado-oficina)
/*Voy a usar un inner join ya que en este caso no se debe dar prioridad a nada*/
select e.nombre as nombreEmpleado, e.puesto as puestoEmpleado, o.ciudad as ciudadOficina from empleado e join oficina o
 on o.codigo_oficina = e.codigo_oficina order by e.nombre asc;

-- ej16
-- codigo del pedido, nombre producto, subtotal(precioUnidad * cantidad) (detalle pedido-producto)
/*Voy a usar un inner join ya que en este caso no se debe dar prioridad a nada*/
select dp.codigo_pedido, p.nombre as nombreProducto, (dp.precio_unidad * dp.cantidad) as subtotal from detalle_pedido dp join producto p on dp.codigo_producto = p.codigo_producto;

-- ej19
-- codigo y ciudad de la oficina y cuántos empleados trabajan en ella incluyendo las oficinas que tengan cero empleados(oficina-empleado)
/*Voy a usar left join para darle prioridad a la tabla de oficinas y que se muestren las que incluso no tienen empleados*/
select o.codigo_oficina, o.ciudad, count(e.codigo_empleado) as cantidad_empleados from oficina o left join empleado e on o.codigo_oficina = e.codigo_oficina group by o.codigo_oficina;