package com.dam.ejerciciosif;

import java.util.Scanner;

public class Ejercicio7 {

	public static void main(String[] args) {
		// Math.pow(base, exponente)
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce la base de la potencia");
		int base = sc.nextInt();
		sc.nextLine();
		
		System.out.println("Introduce el exponente de la potencia");
		int exp = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		if (exp > 0) {
			System.out.println("El resultado de la potencia es " + Math.pow(base, exp));
			
		} else if (exp == 0) {
			System.out.println("El resultado de la potencia es 1");
			
		} else {
			System.out.println("El resultado de la potencia es " + 1/Math.pow(base, Math.abs(exp)));
		}

	}

}
