package com.dam.ejercicioswhile;

import java.util.Scanner;

/*
 * Escribir un programa que imprima todos los números pares entre dos
números que se le pidan al usuario.
 */
public class Ejercicio3_2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un entero ");
		int min = Integer.parseInt(sc.nextLine());
		
		System.out.println("Introduce otro entero distinto");
		int max = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		if (min > max) { // suponiendo que min = 9 y max = 4
			int aux = min; // aux = 9
			min = max; // min = 4
			max = aux; // max = 9
		}
		
		// seleccionar el primer par después de min
		int inicio = min + 1; // inicio = 5
		if (inicio % 2 != 0) {
			inicio++; // inicio = 6
		}
		
		
		System.out.print("Pares entre " + min + " y " + max +": ");
		for (int j = inicio; j < max; j+=2) {
			System.out.print(j + " ");
		}
				

	}

}
