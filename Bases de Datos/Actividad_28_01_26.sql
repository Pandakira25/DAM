use mysql_hr;

/*Explicación: Estoy tomando los datos del nombre, apellido, id del trabajo, id del departamento de la tabla de empleado; luego con join de la tabla de job tomo el nombre del trabajo
y con otro join de la tabla de departamentos tomo el nombre del departamento*/
drop view if exists vw_ficha_laboral_empleado;
create view vw_ficha_laboral_empleado as 
select e.first_name, e.last_name, e.job_id, j.job_title, e.department_id, d.department_name 
from employees e 
join jobs j on j.job_id = e.job_id
join departments d on e.department_id = d.department_id;


/*Explicación: tomo el nombre y el id del departamento de employee; el nombre de departamento y el id de la locación de la tabla departments;
la dirección, ciudad y codigo postal de locations; 
uno todas las tablas por los datos correspondientes y le agrego una clausula where para que cumpla con las 
condiciones del enunciado*/
drop view if exists vw_envios_depto20_o_ventas;
create view vw_envios_depto20_o_ventas as
select e.first_name, e.last_name, e.department_id, d.department_name, d.location_id, l.street_address, l.city, l.postal_code
from employees e 
join departments d on d.department_id = e.department_id
join locations l on l.location_id = d.location_id
join jobs j on j.job_id = e.job_id
where d.department_id = 20
or j.job_id like 'SA%';

/*Explicación: tomo el apellido y salario de la tabla employee; nombre del país de countries; nombre de la región de la tabla regions
uno las tablas haciendo el camino entero desde employees hasta regions uniendolas mediante los datos pertinentes
y le agrego una clausula where para que cumplan con las condiciones del enunciado*/
drop view if exists vw_salarios_pais_region_dept20_30;
create view vw_salarios_pais_region_dept20_30 as
select e.last_name, e.salary, c.country_name, r.region_name
from employees e 
join departments d on e.department_id = d.department_id 
join locations l on d.location_id = l.location_id
join countries c on l.country_id = c.country_id
join regions r on c.region_id = r.region_id
where d.department_id = 20
or d.department_id = 30;

/*Explicación: tomo el apellido, salario y fecha de contratación de la tabla employee; el nombre de la región de regions y el nombre de la ciudad de locations
uno las tablas haciendo todo el camino desde employee hasta regions mediante los datos pertinentes*/
drop view if exists vw_informe_global_personal;
create view vw_informe_global_personal as
select e.last_name, e.salary, e.hire_date, r.region_name, l.city
from employees e 
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
join countries c on l.country_id = c.country_id
join regions r on c.region_id = r.region_id;

/*Explicación:creo dos alias distintos para la tabla employees m y e; de m tomo el id del manager, su nombre y apellido; de departamento tomo el id y su nombre
para unirlas empiezo por departments luego la uno con e y por ultimo uno e con m*/
drop view if exists vw_managers_con_equipo;
create view vw_managers_con_equipo as
select distinct m.employee_id, m.first_name, m.last_name, d.department_id, d.department_name
from departments d 
join employees e on d.manager_id = e.manager_id
join employees m on e.manager_id = m.employee_id;
