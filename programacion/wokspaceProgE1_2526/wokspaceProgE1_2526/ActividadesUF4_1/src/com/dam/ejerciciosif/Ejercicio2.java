package com.dam.ejerciciosif;

import java.util.Scanner;

/*
 * Dados 5 números, detectar cuál de los 5 es mayor y escribirlo por pantalla
 */
public class Ejercicio2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce 5 números enteros separados por un espacio");
		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		int num3 = sc.nextInt();
		int num4 = sc.nextInt();
		int num5 = sc.nextInt();
		sc.nextLine();
		
		sc.close();
		
		if (num1 > num2 && num1 > num3 && num1 > num4 && num1 > num5) {
			System.out.println("El mayor es " + num1);
		} else if (num2 > num3 && num2 > num4 && num2 > num5) {
			System.out.println("El mayor es " + num2);
		} else if (num3 > num4 && num3 > num5) {
			System.out.println("El mayor es " + num3);
		} else if (num4 > num5) {
			System.out.println("El mayor es " + num4);
		} else {
			System.out.println("El mayor es " + num5);
		}

	}

}
