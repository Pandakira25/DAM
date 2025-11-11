package com.dam.pruebas.repeticion;

import java.util.Random;
import java.util.Scanner;

public class PruebasDoWhile {

	public static void main(String[] args) {
		Random rd = new Random();
		int numSecreto = rd.nextInt(1, 11);
		
		// System.out.println("### número secreto " + numSecreto);
		
		Scanner sc = new Scanner(System.in);
		System.out.println("** Intenta adivinar el número secreto **");
		
		int num;
		do {
			System.out.println("Introduce un número del 1 al 10");
			// no debo declarar variables dentro de un bucle porque ensucia la memoria
			num = Integer.parseInt(sc.nextLine());
					
			if (num != numSecreto) {
				System.out.println("No has acertado");
			} else {
				System.out.println("Enhorabuena, has acertado!");
			}
		
		} while (num != numSecreto);
		
		sc.close();

	}

}
