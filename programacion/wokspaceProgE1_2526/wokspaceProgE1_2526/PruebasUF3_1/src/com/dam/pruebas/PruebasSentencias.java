package com.dam.pruebas;

public class PruebasSentencias {

	// Declarar variable global, declarada dentro del bloque de la clase
	static int suma;

	public static void main(String[] args) {
		// Definición de sentencias

		// Declarar e inicializar una variable local de tipo entero
		// es local porque está declarada dentro de un método
		int entero = 1;

		// Declarar una variable de tipo cadena de caracteres
		String nombre;

		// Inicialización de la variable nombre
		nombre = "Jaime";

		System.out.println("Hola " + nombre 
				+ ", ¿qué tal? te quería dar la bienvenida a fundamentos de Java");

		/*
		 * Inicializar una variable de tipo entero, asignándole como valor un operación
		 * la suma de la variable entero + 5
		 */
		suma = entero + 5;

		System.out.println("Valor de suma: " + suma);

	}

}
