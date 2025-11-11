package com.dam.ejerciciosdowhile;

import java.util.Scanner;

/*
 * Crea un programa que pida números hasta que se introduzca un cero.
Debe imprimir la suma y la media de todos los números introducidos
 */
public class Ejercicio2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int numero;
		int suma = 0;
		int cantNumeros = 0;
		do {
			System.out.println("Introduce un entero ");
			numero = Integer.parseInt(sc.nextLine());
			
			if (numero != 0) {
				suma = suma + numero;
				cantNumeros++;
			}
			
		} while (numero != 0);
		
		sc.close();
		
		if (cantNumeros > 0) {
			System.out.println("La suma de todos los número introducidos es " + suma);
			System.out.println("Y la media de los " + cantNumeros + " número introducidos es " + ((double) suma / cantNumeros));
		} else {
			System.out.println("No se ha introducido ningún número para el cálculo");
		}	

	}

}
