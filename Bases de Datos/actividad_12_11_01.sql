SELECT * FROM clinica.pacientes;
select nombreCompletoP,telefono from pacientes;
select nombreCompletoP from pacientes order by nombreCompletoP asc;
/*Seleccionar de la tabla paciente el nombre y la fecha de nacimiento y organizarlo de forma ascendente*/
select nombreCompletoP, fechaNacimiento from pacientes order by fechaNacimiento asc;

/*Mostrar todo los medicos registrados que sean Dra*/
select * from medico where nombreCompletoM like 'Dra%';

/*Mostrar todos los medicos que su nombre termine es ez*/
select * from medico where nombreCompletoM like '%ez';

/**/