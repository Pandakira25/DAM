package com.dam.pruebas;

import java.util.Scanner;
/*
 * El operador ternario es un operador de asignación de valor a una variable.
 * A la variable se le asigna el valor que se encuentra antes de los : si la condición es true
 * y se le asigna el valor que se encuentra después de los : si la condición es false
 * El resultado de la condición SIEMPRE tiene que ser booleano, true o false
 * Las expresiones a los dos lados de los : tienen que tener un valor del mismo tipo que la variable a la que se asigna
 */
public class PruebasOperadorTernario {

	public static void main(String[] args) {
		int a = 7;
		int b = 15;
		
		int mayor = (a > b)? a : b;
		
		// es lo mismo que:
		/*
		if (a > b) {
			mayor = a;
		} else {
			mayor = b;
		}
		*/
		
		System.out.println("mayor valor: " + mayor);
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un número");
		int x = sc.nextInt();
		sc.nextLine();
		
		System.out.println("Introduce otro número");
		int y = sc.nextInt();
		sc.nextLine();
		
		sc.close();
		
		int menor = (x > y)? y : x; // Si x > y es true --> el menor es y : si x > y es false --> el menor es x
		
		System.out.println("menor valor: " + menor);
		
	}

}
