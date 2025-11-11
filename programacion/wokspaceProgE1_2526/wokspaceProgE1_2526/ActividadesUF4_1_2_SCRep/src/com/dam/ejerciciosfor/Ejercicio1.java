package com.dam.ejerciciosfor;

import java.util.Scanner;

/*
 * Crea una aplicación que pida un número y calcule su factorial (El factorial de
un número es el producto de todos los enteros entre 1 y el propio número y se
representa por el número seguido de un signo de exclamación. Por ejemplo 5! =
1x2x3x4x5=120)
 */
public class Ejercicio1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un entero positivo");
		int numero = Integer.parseInt(sc.nextLine());
		
		sc.close();

		// suponiendo que numero = 5
		// 1 * 2 * 3 * 4 * 5 
		long factorial = 1;
		for (int i = 1; i <= numero; i++) {
			factorial = factorial * i;
		}
		
		System.out.println(numero + "! = " + factorial);
	}

}
