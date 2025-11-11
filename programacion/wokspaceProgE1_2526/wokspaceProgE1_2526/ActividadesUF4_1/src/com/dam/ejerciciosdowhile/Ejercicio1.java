package com.dam.ejerciciosdowhile;

import java.util.Random;
import java.util.Scanner;

public class Ejercicio1 {

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
			
		} while (aleatorio % 2 != 0);
		
		System.out.println("Número aleatorio par menor que " + limite + " es " + aleatorio);

	}

}
