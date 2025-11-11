package com.dam.ejercicioswhile;

import java.util.Scanner;

public class Ejercicio2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Indica la cantidad de números");
		int n = Integer.parseInt(sc.nextLine());
		
		int repeticion = 1;
		int num;
		while (repeticion <= n) {
			System.out.println("Introduce el número " + repeticion + ": ");
			num = Integer.parseInt(sc.nextLine());
			
			if (num % 2 == 0) {
				System.out.println(num + " es par");
			} else {
				System.out.println(num + " es impar");
			}
			
			repeticion++;
		}
				
		sc.close();

	}

}
