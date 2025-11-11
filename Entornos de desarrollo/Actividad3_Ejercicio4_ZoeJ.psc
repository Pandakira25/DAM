Proceso Actividad3_Ejercicio4_ZoeJ
	//@Autor: Zoe Jastreb
	//@Revisor: Dabiel Parra
	//
	//Escribe un programa que diga si un número introducido por teclado es o no primo.
	//Un número primo es aquel que sólo es divisible entre él mismo y la unidad.
	//Nota: Es suficiente probar hasta la raíz cuadrada del número para ver si es
	//divisible por algún otro número.
	//
	//Análisis: Primero debería pedir el número a analizar y tmabien necesitaría un indicador booleano y setearlo en true para que indique si es primo o no.
	//Por otro lado con un for deberia ir probando números los cuales podrían ser divisores del numero ingresado hasta llegar a la raiz cuadrada de este
	//adentro del for usaria un if para que si encuentra un divisor de n cambie el estado del indicador a false.
	//Por ultimo en un si fuera del for, si el resultado final del indicador se mantiene escribo que es primo de lo contrario que no lo es.
	//
	//Desarrollo: Defino la concicion del for (i) y el número (n) como enteros y el indicador booleano (esPrimo) como Lógico
	// pido n y leo n
	//inicializo esPrimo en true
	//inicio el for en i = 2 hasta la raiz(n) 
	//dentro del for un if de condición n%i == 0 
	//dentro del if esPrimo pasa a ser false
	//fuera del for otro if cuya condicion es esPrimo
	//si es verdadero escribir "El nímero es primo"
	//si es falso "El número no es primo"
	//
	
	Definir n, i Como Entero;
	Definir esPrimo Como Logico;
	
	Escribir "ingrese el numero";
	leer n;
	
	esPrimo <- Verdadero;
	
	Para i <- 2  Hasta raiz(n) Con Paso 1 Hacer
		Si n % i == 0 Entonces
			esPrimo <- Falso;
		FinSi
	FinPara
	
	Si esPrimo Entonces
		Escribir "El número es primo";
	SiNo
		Escribir "El número no es primo";
	FinSi
	
FinProceso

//Corrección: Muy bien UwU
