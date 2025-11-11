package com.dam.pruebas;

public class PruebasOperadoresRel {

	public static void main(String[] args) {
		// declarar e inicializar dos variables locales primitivas de tipo int, de nombre a y b
		int a = 5;
		int b = 8;
		
		// declarar una variables local primitiva de tipo boolean, de nombre resultado, 
		// para almacenar el resultado de comparaciones
		boolean resultado;
		
		resultado = a < b; // tomará el valor true
		System.out.println("a < b? " + resultado);
		
		resultado = a >= b; // false
		System.out.println("a >= b? " + resultado);
		
		resultado = a != b; // true
		System.out.println("a != b? " + resultado);
		
		resultado = a == b; // false
		System.out.println("a == b? " + resultado);

	}

}
