Proceso Tarea2_Ej4
	
	//@Autor: Zoe Jastreb
	//Revisor: David Martínez
	
	//Escribe un programa que pida un número entero entre uno y doce e imprima el
	//número de días que tiene el mes correspondiente.
	// Si introducimos otro número nos da un error.
	
	//Análisis:
	//Leer el número
	//si es mayor que cero y igual o menor que doce
	//hacer un segun número
	//caso 1,3,5,7,8,10,12
	//mostrar: El mes tiene 31 dias
	//Caso 2
	//mostrar: el mes tiene 28 dias si es un año normal y 29 si es bisiesto
	//caso 4,6,9,11
	//mostrar: El mes tiene 30 dias
	//variables: n
	
	//Diseño:
	//leer n
	//si 0<n<=12
	//segun n Hacer
	//1,3,5,7,8,10,12
	//mostrar "el mes tiene 31 dias"
	//4,6,9,11
	//Mostrar "el mes tiene 30 dias
	//2
	//mostrar el mes tiene 28 0 29 dias
	//SiNo
	//mostrar "mes inválido"
	
	Definir n Como Entero;
	
	Escribir "ingrese el número de mes";
	leer n;
	
	si (0<n) Y (n<=12) Entonces
		segun n Hacer
			1,3,5,7,8,10,12:
				Escribir "El mes tiene 31 dias";
			2:
				Escribir "El mes tiene 28 o 29 dias, dependiento de si el año es bisiesto o no";
			4,6,9,11:
				Escribir "El mes tiene 30 dias";
		FinSegun
		
	SiNo
		Escribir "Mes inválido";
	FinSi
	
	
	
FinProceso
