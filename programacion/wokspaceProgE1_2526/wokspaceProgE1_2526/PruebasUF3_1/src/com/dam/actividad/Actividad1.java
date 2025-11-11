package com.dam.actividad;

import java.util.Scanner;

// solicitar la base y la altura de un triángulo y calcular y muestre su área
public class Actividad1 {

	static final int VALOR_DIVISION = 2;
	// variables globales o campos o atributos
	private static double base;
	private static double altura;

	public static void main(String[] args) {
		// variable local
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce la base del triángulo");
		base = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Introduce la altura del triángulo");
		altura = sc.nextDouble();
		sc.nextLine();
		
		sc.close();
		
		// double area = base * altura / 2;
		double area = calcularArea();
		
		System.out.println("El área del triángulo es " + area);

	}
	
	public static double calcularArea() {
		return base * altura / VALOR_DIVISION;
	}

}
