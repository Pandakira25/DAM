package com.dam.ejerciciosdowhile;

import java.util.Scanner;

/*
 * Crea un programa que pida números hasta que se introduzca un cero.
Debe imprimir la suma y la media de todos los números introducidos
 */
public class Ejercicio4 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int limInf;
		int limSup;
		
		do {
			System.out.println("Introduce el límite inferior ");
			limInf = Integer.parseInt(sc.nextLine());
			
			System.out.println("Introduce el límite superior ");
			limSup = Integer.parseInt(sc.nextLine());
			
			if (limInf > limSup) {
				System.out.println("El límite superior debe ser mayor que el límite inferior \n");
			}
			
		} while (limInf > limSup);
			
		int numero;
		int sumaDentro = 0;
		int cantNumerosFuera = 0;
		boolean numLimite = false;
		int contNumLimite = 0;
		
		do { // suponemos limInf = 2 y limSup = 7
			System.out.println("Introduce un número ");
			numero = Integer.parseInt(sc.nextLine()); // numero = 7
			
			if (numero != 0) {
				// si el número está dentro del intervalo
				if (numero > limInf && numero < limSup) {
					sumaDentro += numero; // sumaDentro = sumaDentro + numero
				} else if (numero < limInf || numero > limSup) {
					cantNumerosFuera++;
				} else {
					numLimite = true;
					contNumLimite++;
				}
				
			}
			
		} while (numero != 0);
		
		sc.close();
		
		System.out.println("\nLa suma de los números introducidos que se encuentran dentro del intervalo (" + limInf + ", " + limSup + ") es " + sumaDentro);
		
		if (cantNumerosFuera > 0) {
			System.out.println("Se han introducido " + cantNumerosFuera + " números fuera del intervalo [" + limInf + ", " + limSup + "]");
		} 
		
		if (numLimite) {
			System.out.println("Se han introducido " + contNumLimite + " números que coinciden con los límites");
		}

	}

}
