package com.dam.senteciascontrol;

import java.util.Scanner;

/*
 * Desarrollar un programa que indique los divisores de un número dado.
 */
public class Ejercicio3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un entero positivo");
		int limite = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		System.out.println();
		
		for (int i = 1; i < limite; i++) {
			if (limite % i == 0) {
				System.out.println(i + " es divisor de " + limite);
			}
		}
	}

}
