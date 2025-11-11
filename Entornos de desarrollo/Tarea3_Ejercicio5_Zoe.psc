Proceso Tarea3_Ejercicio5_Zoe
	//@Autor: Zoe Jastreb
	//@Revisor: Daniel Parra
	//
	//na persona se encuentra en el kilómetro 70 de una carretera, otra se encuentra
	//en el km 150, los coches tienen sentido opuesto y tienen la misma velocidad.
	//Realizar un programa para determinar en qué kilómetro de esa carretera se
	//encontrarán.
	//Análisis: Primero defino las posiciones iniciales de ambas personas, luego como ambas van a la misma velocidad y sentido opuesto sumo o resto en los respectivos 
	//casos de forma uniforme mientras ambas variables sean distintas.
	//
	//Diseño:
	//declaro x01 y x02 como enteros 
	//inicializo sus respectivos valores x01 = 70, x02 = 150
	//mientras x01 <> x02 hago
	//x01 += 10
	//x02 -= 10
	//escribir "Se encuentran en el kilómetro" + x01
	//
	Definir x01, x02 Como Entero;
	
	x01 <- 70;
	x02 <- 150;
	
	Mientras x01 <> x02 Hacer
		x01 := x01 + 10;
		x02 := x02 - 10;
	FinMientras
	
	Escribir "Se encontraran en el kilometro " , x01;
	
FinProceso

//corrección: está muy bien aunque yo lo haría con velocidad 1 en vez de 10
