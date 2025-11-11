package com.dam.senteciascontrol;

import java.util.Scanner;

/*
 * Desarrollar un programa que muestre los múltiplos de 3 que se encuentren 
 * entre dos enteros positivos introducidos por teclado. Hay que tener en cuenta 
 * cuál de los dos es mayor.
 */
public class Ejercicio1 {

	static final int DIVISOR = 3;
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un entero positivo");
		int min = Integer.parseInt(sc.nextLine());
		
		System.out.println("Introduce otro entero positivo distinto");
		int max = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		if (min > max) { // suponiendo que min = 9 y max = 4
			int aux = min; // aux = 9
			min = max; // min = 4
			max = aux; // max = 9
		}

		int i = min + 1;
		
		System.out.println("Múltiplos de " + DIVISOR + " entre " + min + " y " + max +": ");
		while (i < max) {
			if (i % DIVISOR == 0) {
				System.out.print(i + " ");
				// en cuanto encontramos el primer par, aumentamos de 2 en 2
				i += DIVISOR;
			}
		}
	}

}
