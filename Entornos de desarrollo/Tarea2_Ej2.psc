Proceso Tarea2_Ej2
	
	//@Autor: Zoe Jastreb
	//@Revisor: David Martínez
	
	//Escribe un programa que pida un nombre de usuario y una contraseña
	//y si se ha introducido "pepe" y "asdasd" se indica "Has entrado al sistema",
	//sino se da un error.
	
	//Análisis:
	//Primero pedir al usuario su usuario y contraseña luego leer ambas variables.
	//si contraseña es igual a asdasd y usuario es igual a pepe mostrar "has entrado al sistema"
	//De lo contrario mostrar usuario o contraseña incorrectos.
	//Variables: usuario, contrasenia.
	
	//Desarrollo:
	//Definir usuario y contrasenia como caracter
	//leer usuario y contrasenia
	//si (usuario="pepe") Y (contrasenia="asdasd"
	//mostrar=Has ingresado al sistema"
	//SiNo 
	//Mostrar "Ususario o contraseña incorrectos"
	
	Definir usuario, contrasenia Como Caracter;
	
	Escribir "ingrese el usuario";
	Leer usuario;
	
	Escribir "Ingrese la contraseña";
	Leer contrasenia;
	
	si (contrasenia = "asdasd") Y (usuario = "pepe") Entonces
		Escribir "Has entrado al sistema";
	SiNo
		Escribir "Usuario o contraña incorrectos";
	FinSi
	
	
	
FinProceso
//Gran trabajo para alguien como tu