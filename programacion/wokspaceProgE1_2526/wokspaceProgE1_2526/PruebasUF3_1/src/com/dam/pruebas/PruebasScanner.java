package com.dam.pruebas;

import java.util.Scanner;

// Clase para aprender a comunicarnos con el usuario
public class PruebasScanner {

	public static void main(String[] args) {
		/* creamos una variable de referencia (porque su tipo no es primitivo) de tipo Scanner,
		 * clase del paquete java.util de la librería estándar de Java, que me permite comunicarme 
		 * con el usuario a través de la entrada estándar (System.in)
		 */
		
		Scanner teclado = new Scanner(System.in);
		
		System.out.println("Introduce tu nombre");
		String nombre = teclado.nextLine();
		
		System.out.println("Hola " + nombre);
		
		System.out.println("Por favor, introduce un número entero");
		int numero = teclado.nextInt();
		teclado.nextLine();
		
		System.out.println("El triple del número introducido es " + (numero * 3));
		
		System.out.println("Si al número le sumamos 10 es " + (numero + 10));
		
		System.out.println("Introduce dos números decimales");
		double decimal1 = teclado.nextDouble();
		double decimal2 = teclado.nextDouble();
		teclado.nextLine();
		
		System.out.println("Has introducido " + decimal1 + " y " + decimal2);
		
		teclado.close();

	}

}
