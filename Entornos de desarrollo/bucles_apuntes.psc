Proceso bucles_apuntes
	Definir secreto, clave Como cadena;
	
	secreto := "contraseniania";
	Escribir Sin Saltar "Escriba la clave";
	leer clave;
	Mientras clave <> secreto hacer //while
		Escribir "clave incorrecta" ;
		Escribir Sin Saltar "Escriba la clave";
		leer clave;
	FinMientras
	
	Escribir "bienvenido al sistema";
	
	Repetir //Do While
		Escribir  Sin Saltar "Escriba la clave";
		leer clave;
		si clave <> secreto Entonces
			Escribir "Clave incorrecta";
		FinSi
	Hasta Que clave = secreto;
	
	Escribir "bienvenido al sistema";
	
	Definir var Como Entero;
	Para var <- 1 hasta 10 Hacer
		Escribir Sin Saltar var, " - ";
	FinPara
	
	Para var <- 2 hasta 10 Con Paso 2 Hacer
		Escribir Sin Saltar var, " - ";
	FinPara
	
	Para var <- 10 Hasta 1 Con Paso -1 Hacer
		Escribir Sin Saltar var, " - ";
	FinPara
	
FinProceso
