package com.dam.ejercicios;

import java.util.Scanner;

/*
 * Realiza un programa que solicite el radio de un círculo y calcule su área sabiendo que necesitamos 
 * el valor PI = 3.14
 */
public class Ejercicio2 {
	static final double PI = 3.14;

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce el radio del círculo");
		/*double radio = sc.nextDouble();
		sc.nextLine();*/
		
		double radio = Double.parseDouble(sc.nextLine());
		
		sc.close();
		
		//double area = PI * radio * radio;
		double area = PI * Math.pow(radio, 2);
		
		System.out.println("El área del círculo es " + area);	

	}

}
