package com.dam.pruebas.repeticion;

public class PruebasWhile {

	public static void main(String[] args) {
		int x = 0;
		
		while (x < 10) {
			System.out.print(x + "-");
			x++;
		}
		System.out.println();
		
		// condición que nunca se cumple
		// no se ejecuta porque x = 10
		while (x < 10) {
			System.out.println("No se ejecuta esta línea");
		}
		
		// bucle infinito porque la condición se cumple siempre
		while (true) {
			System.out.println("Bucle infinito");
		}

	}

}
