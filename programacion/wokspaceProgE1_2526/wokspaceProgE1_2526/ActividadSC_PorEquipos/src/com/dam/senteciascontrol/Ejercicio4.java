package com.dam.senteciascontrol;

import java.math.MathContext;
import java.util.Scanner;

/*
 * Escribe un programa que diga si un número introducido por teclado es o no primo.
Un número primo es aquel que sólo es divisible entre él mismo y la unidad. Nota:
Es suficiente probar hasta la raíz cuadrada del número para ver si es divisible por
algún otro número.
 */
public class Ejercicio4 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un entero positivo");
		int numero = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		// cantidad de divisores a parte de el 1 y numero
		int cantDivisores = 0;
		
		// recorrer los números entre 2 y la raíz cuadrada del número para buscar divisores
		for (int i = 2; (i <= Math.sqrt(numero) && cantDivisores == 0); i++) {
			if (numero % i == 0) {
				cantDivisores++;
			}
		}
		
		// si cantDivisores es mayor que 0 es porque he encontrado al menos un divisor que no es ni 1, ni numero
		if (cantDivisores > 0) {
			System.out.println("El número " + numero + " no es primo");
		} else {
			System.out.println("El número " + numero + " es primo");
		}

	}

}
