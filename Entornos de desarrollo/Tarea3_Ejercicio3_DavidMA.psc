Proceso Tarea3_Ejercicio3_DavidMA
	//@Autor: David Martinez
	//@Revisor: Daniel Parra
	//
	//Análisis:Primero defino las variables a utilizar las cuales necesitaria una para contador del for(i) luego voy a necesitar otra para almacenar el número 
	//que se ingresa(n) y una última para almacenar el valor de las operaciones de la tabla de multiplicar(t); luego pido el numero al cual hacerle la tabla, inicializo
	//t para que no me salte que no inicialicé la variable, creo el for para que inicie en 1 y que llegue hasta 10 para que la tabla de multiplicar sea del 1 al 10;
	//dentro del for le asigno el valor de n * i a t y por último escribo el resultado con el formato adecuado.
	//
	//Desarrollo:
	//Definir n,t,i como reales;
	//leer n;
	//t = 0;
	//para i = 1 hasta 10 con paso 1 Hacer
	//t = n*i;
	//Escribir n x i = t;
	//
	Definir n, t, i Como Real;
	
	Escribir "escriba un número";
	Leer n;
	
	t:=0;
	
	Para i <- 1 Hasta 10 Con Paso 1 Hacer
		t := n * i;
		Escribir n , "x", i , "= ", t;
	FinPara
FinProceso
//Corrección: Increible, muy bien :3