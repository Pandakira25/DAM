package com.dam.ejercicioswhile;

import java.util.Scanner;

public class Ejercicio3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Indica la cantidad de números");
		int n = Integer.parseInt(sc.nextLine());
		
		int repeticion = 1;
		int num;
		int contPos = 0;
		int contNeg = 0;
		int contCeros = 0;
		while (repeticion <= n) {
			System.out.println("Introduce el número " + repeticion + ": ");
			num = Integer.parseInt(sc.nextLine());
			
			if (num > 0) {
				contPos++;
			} else if (num < 0) {
				contNeg++;
			} else {
				contCeros++; // contCeros = contCeros + 1 => contCeros += 1
			}
			
			repeticion++;
		}
		
		System.out.println("De " + n + " números introducidos: ");
		System.out.println(contPos + " son positivos");
		System.out.println(contNeg + " son negativos");
		System.out.println(contCeros + " son ceros");
				
		sc.close();

	}

}
