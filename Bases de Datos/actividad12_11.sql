/* 1. Muéstrame el nombre y vía de administración de los medicamentos que son de via oral*/
select nombreComercial,viaAdministracion from medicamentos;
/* 2. Muéstrame el principio activo de los medicamentos que su presentación sean en mg*/
select principiActivo from medicamentos where presentacion like '%mg%';
/* 3. Muéstrame el Id de los medicamentos que se deben tomar cada 8 Horas*/
select idMedicamento from recetaDetalle where frecuencia like '%cada 8hs%';
/* 4. Realiza una lista de medicamentos organizados de forma alfabética por nombre y presentación.*/
select nombreComercial, presentacion from medicamentos order by nombreComercial asc;
/* 5. Muéstrame las observaciones del día 11 de noviembre.*/
select observacionesR from receta where fechaR like '%-11-11'