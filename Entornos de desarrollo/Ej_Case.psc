Proceso Ej_Case
	
	Definir valor Como Entero;
	
	valor:= 2;
	
	Esperar Tecla;
	
	Borrar Pantalla;
	
	si valor <> 2 Entonces // < > juntando ambos puedo hacer el distinto de
		Escribir "valor de la variable es: ", valor;
	FinSi
	
	si valor = 2 entonces
		Escribir "Valor de la variable es: ", valor;
	SiNo
		Escribir "Valor de la variable distinto de 2";
	FinSi
	
	Segun valor hacer
		2:
			Escribir "Valor 2";
		3,4:
			Escribir "Valor 3 o 4";
		De Otro Modo:
			Escribir "Valor distinto de 2,3 y 4";
	FinSegun
	
	
FinProceso
