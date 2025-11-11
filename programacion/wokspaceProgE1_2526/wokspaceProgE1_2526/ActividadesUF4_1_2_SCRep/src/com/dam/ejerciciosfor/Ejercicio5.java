package com.dam.ejerciciosfor;

import java.util.Scanner;

/*
 * Escribe un programa que, dados dos números, uno real (base) y un
entero positivo (exponente), saque por pantalla el resultado de la potencia. No se
puede utilizar la función Math.pow.
 */
public class Ejercicio5 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un número como base de una potencia");
		double base = Double.parseDouble(sc.nextLine());
		
		System.out.println("Introduce un entero positivo como exponente de la potencia");
		int exponente = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		double potencia = 1;
		for (int i = 0; i < exponente; i++) {
			potencia *= base;
		}
		
		System.out.println("El resultado de la pontencia " + base + " elevado a " + exponente + " es " + potencia);

	}

}
