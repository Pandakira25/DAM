package com.dam.pruebas.repeticion;

import java.util.Scanner;

public class PruebasFor {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Indica el número de veces que quieres que te diga Hola");
		int veces = sc.nextInt();
		sc.nextLine();
		
		sc.close();
		
		int cont = 0;
		while (cont < veces) {
			System.out.println("Hola");
			cont++;
		}
		
		System.out.println();
		
		for (int i = 0; i < veces; i++) {
			System.out.println("Hola");
		}
		
		System.out.println();
		
		for (int i = 1; i <= veces; i++) {
			System.out.print("Vez " + i + ": ");
			System.out.println("Hola");
		}
		
		

	}

}
