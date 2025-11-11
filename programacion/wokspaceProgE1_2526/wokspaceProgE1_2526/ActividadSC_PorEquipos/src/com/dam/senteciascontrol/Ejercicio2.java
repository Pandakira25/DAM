package com.dam.senteciascontrol;

import java.util.Random;
import java.util.Scanner;

/*
 * Realiza un programa para obtener un número aleatorio múltiplo de 7 
 * menor que el que se indique por teclado.
 */
public class Ejercicio2 {

	static final int DIVISOR = 7;
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un entero positivo");
		int limite = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		Random rd = new Random();
		
		int aleatorio;
		
		do {
			aleatorio = rd.nextInt(1,limite);
			System.out.println("## " + aleatorio);
			
		} while (aleatorio % DIVISOR != 0);
		
		System.out.println("Número aleatorio múltiplo de " + DIVISOR + " menor que " + limite + " es " + aleatorio);

	}

}
