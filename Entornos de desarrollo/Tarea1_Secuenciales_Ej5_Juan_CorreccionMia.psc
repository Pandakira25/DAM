//@Autor: Juan Antonio Ros
//Revisor: Zoe Jastreb
//Analisis
//Primero hay que leer las monedas que tiene el usuario y calcular cuanto dinero tenemos,
// sumando los diferentes tipos de monedas_10cents//Almacenamos las monedas en sus variables respectivas
//entrada:  monedas_2euros, monedas_1euro, monedas_50cents, monedas_20cents, monedas_10cents 
//Diseño
//1)leer monedas
//2)calcular euros
//3) mostrar resultado
Algoritmo Ejercicio5
	
	Definir monedas_2euros, monedas_1euro, monedas_50cents, monedas_20cents, monedas_10cents como Entero; //Bien
	Definir total_euros, total_centimos, total como Real;//Bien
	
	Escribir "Introduce el número de monedas de 2 euros:";//Bien
	Leer monedas_2euros;
	
	Escribir "Introduce el número de monedas de 1 euro:";//Bien
	Leer monedas_1euro;
	
	Escribir "Introduce el número de monedas de 50 céntimos:";//Bien
	Leer monedas_50cents;
	
	Escribir "Introduce el número de monedas de 20 céntimos:";//Bien
	Leer monedas_20cents;
	
	Escribir "Introduce el número de monedas de 10 céntimos:";//Bien
	Leer monedas_10cents;
	
	total_euros <- (monedas_2euros * 2) + (monedas_1euro * 1);//Bien
	total_centimos <- (monedas_50cents * 0.50) + (monedas_20cents * 0.20) + (monedas_10cents * 0.10);//Bien
	total <- total_euros + total_centimos;//Bien
	
	Escribir "Tienes un total de: ", total, " euros.";//Bien
	
FinAlgoritmo

//Corrección:
//Muy importates los punto y coma que si no no corre el programa.
//No es que este mal pero para que despues se te facilite leer el código te recomendaría espaciar las líneas de código cuando cambias a una acción distinta.
//Conclusión: Bien el codigo y el razonamiento, solo no te olvides de los punto y coma que son muy importantes.

