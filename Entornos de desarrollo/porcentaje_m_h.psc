Proceso porcentaje_m_h
	Definir H , m, total Como Entero;
	Definir Ph, Pm Como Real;
	Escribir "Indique el número de mujeres";
	Leer m;
	Escribir "Indique el número de hombres";
	Leer h;
	total := m + h;
	Ph :=(m * 100) / total;
	Pm :=  100 - Ph;
	Escribir "El porcentaje de hombres es: " ,redon(Ph), "%", " -- y el porcentaje de mujeres es: ", redon(Pm), "%";
	
	
FinProceso
