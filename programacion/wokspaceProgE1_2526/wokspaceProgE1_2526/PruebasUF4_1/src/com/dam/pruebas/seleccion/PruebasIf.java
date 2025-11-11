package com.dam.pruebas.seleccion;

import java.util.Scanner;

public class PruebasIf {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un número entero");
		int numero = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		int resto = numero % 2;
		
		if (resto == 0) {
			System.out.println("El número es par");
		} else { // resto != 0
			System.out.println("El número es impar");
		}
		
		if (numero > 0) {
			System.out.println("El número es positivo");
		} else if (numero < 0) {
			System.out.println("El número es negativo");
		} else {
			System.out.println("El número es cero");
		}
		
	}

}
