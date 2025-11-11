Proceso sin_titulo
	Escribir "escriba el dia, mes y año";
	Leer d;
	Leer m;
	Leer a;
	Si (a%4==0 & a%100 <> 0) | a % 400 ==0 Entonces
		Si 0<m & m<=12 Entonces
			Segun d Hacer
				1,3,5,7,8,10,12:
					Si 0<d & d<=31 Entonces
						Escribir "b ok";
					SiNo
						Escribir mal;
					FinSi
				4,6,9,11:
					Si 0<d & d<=31 Entonces
						Escribir "b ok";
					SiNo
						Escribir mal;
					FinSi
				De Otro Modo:
					Si 0<d & d<=29 Entonces
						Escribir "b ok";
					SiNo
						Escribir mal;
					FinSi
			FinSegun
		SiNo
			Escribir mal;
		FinSi
	SiNo
		Si 0<m & m<=12 Entonces
			Segun d Hacer
				1,3,5,7,8,10,12:
					Si 0<d & d<=31 Entonces
						Escribir "n bien";
					SiNo
						Escribir mal;
					FinSi
				4,6,9,11:
					Si 0<d & d<=30 Entonces
						Escribir "n bien";
					SiNo
						Escribir mal;
					FinSi
				De Otro Modo:
					Si 0<d & d<=28 Entonces
						Escribir "n bien";
					SiNo
						Escribir mal;
					FinSi
			FinSegun
		SiNo
			Escribir mal;
		FinSi
	FinSi
FinProceso
