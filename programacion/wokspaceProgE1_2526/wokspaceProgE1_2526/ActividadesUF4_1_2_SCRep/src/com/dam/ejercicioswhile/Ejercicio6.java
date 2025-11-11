package com.dam.ejercicioswhile;

import java.util.Scanner;

/*
 * Desarrollar un programa que muestre los primos menores que un
número introducido por teclado.
 */
public class Ejercicio6 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un entero positivo");
		int limite = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		int cantDivisores;
		System.out.println("\nPrimos menores que " + limite + ": ");
		for (int i = 2; i < limite; i++) {
			cantDivisores = analizarPrimo(i);
			
			if (cantDivisores == 0) {
				//System.out.println("El número " + i + " es primo");
				System.out.print(i + " ");
			}
			
		}

	}

	private static int analizarPrimo(int i) {
		int cantDivisores = 0;
		
		for (int j = 2; (j <= Math.sqrt(i) && cantDivisores == 0); j++) {
			if (i % j == 0) {
				cantDivisores++;
			}
		}
		
		return cantDivisores;
	}

}
