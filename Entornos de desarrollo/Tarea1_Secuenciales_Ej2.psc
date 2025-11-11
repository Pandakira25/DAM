Proceso Tarea1_Secuenciales_Ej2
	
	//@Alumno:zoe
	//@Revisor:David El Grande 
	
	//Dadas dos variables numéricas A y B, que el usuario debe teclear, se pide realizar un algoritmo que intercambie los valores de ambas variables y muestre cuanto valen al final las dos variables.
	
	//Análisis:
	// Tengo que leer A y B y luego mediante una variable de cambio, c, intercambiar sus valores primero asignando a c el valor de A o B luego le asgino a la que haya elegido el valor de la contraria, y por último le asigno a a la contraria el 
	//valro de la variable de cambio.
	//Datos de entrada: A y B
	//Variables A , B , c
	
	//Diseño
	//1. Leer A y B
	//2. Asignar c = a
	//3. Asignar  A = B
	//4. Asignar B = C
	//2. Mostrar ahora A vale "B" y ahora B vale "A" 
	
	Definir A , B , C Como Real;
	
	Escribir "Ingrese el valor de A";
	Leer A;
	Escribir "Ingrese el valor de B";
	Leer B;
	
	C := A;
	A := B;
	B := C;
	
	Escribir "El nuevo valor de A es: ", A , ". El nuevo valor de B es: " , B;
	
FinProceso
