Proceso Tarea1_Secuenciales_Ej1
	
	//@alumno:zoe
	//@Revisor:Juan Ros Fernández
	//Un alumno desea saber cual será su calificación final en UD.
	//la calificación se compone de los siguientes  porcentajes:20% Primer Test, 20% Segundo Test, 60% Práctica
    
	//Análisis:
	//Tengo que leer las tres calificaciones y calcular la suma total de estas 
	//Calcular cuanto valdría la calificación máxima
	//Datos de entrada: Primer_Test, Segundo_Test, Práctica
	//Informacion de salida= Calificacion_Final.
	//Variables: Pt, St, Pr, C_f(Calificación final), C_M(Calificación Máxima), S_c(Suma calificaciones)
	//
	//Diseño
	//Leer Pt , St y Pr
	//Calcular S_c(P_T + S_T, + Pr)
	//Definir C_M (si el 100% esta compuesto por tres notas, si se sacara un 10 en todas el 10 valdría 30)
	//Calcular C_f = (S_c * 10) / C_M 
	//Mostrar C_f
	
	Definir Pt , St , Pr , CM , Sc , Cf Como Real;
	
	CM := 30;
	
	Escribir "Ingrese su calificación del Primer Test";
	Leer Pt;
	Escribir "Ingrese su calificación del Segundo Test";
	Leer St;
	Escribir "Ingrese su calificación de las Prácticas";
	Leer Pr;
	
	Sc := Pt + St + Pr;
	
	Cf := (Sc * 10) / CM;
	
	Escribir "Su calificación final es: " , Cf;
	
	
FinProceso
