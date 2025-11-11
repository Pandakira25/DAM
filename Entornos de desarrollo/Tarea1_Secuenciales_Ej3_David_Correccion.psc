// @Autor DAMAGA
Proceso Nombres
	Definir nombre Como Cadena;
	Definir apellido1 Como Cadena;
	Definir apellido2 Como Cadena;
	Definir iniciales Como Cadena;
	
	Escribir "Ingrese el nombre:";
	Leer nombre;
	Escribir "Ingrese el primer apellido:";
	Leer apellido1;
	Escribir "Ingrese el segundo apellido:";
	Leer apellido2;
	
	iniciales <- Concatenar(Mayusculas(Subcadena(nombre, 0, 0)), Mayusculas(Subcadena(apellido1, 0, 0)));
	iniciales <- Concatenar(iniciales, Mayusculas(Subcadena(apellido2, 0, 0)));
	
	Escribir "Las iniciales son: ", iniciales;
FinProceso
