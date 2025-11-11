package com.dam.ejercicio2;

import java.util.Scanner;

public class Ejercicio2 {
	
	static final int DIVISOR = 7;
	static final int MULTIPLO = 150;

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Indica la cantidad de números que se van a introducir");
		int n = Integer.parseInt(sc.nextLine());
		
		int num;
		int contMultiplos = 0;
		int contDivisores = 0;
		for (int i = 1; i <= n; i++) {
			System.out.println("Introduce el " + i + "º número entero positivo"); 
			num = Integer.parseInt(sc.nextLine());
			
			if (num % DIVISOR == 0) {
				contMultiplos++;
			}
			
			if (MULTIPLO % num == 0) {
				contDivisores++;
			}
			
		}
		
		sc.close();

		System.out.println("De los " + n + " números introducidos " + contMultiplos + " son múltiplos de " + DIVISOR 
				+ " y " + contDivisores + " son divisores de " + MULTIPLO);
	}

}
