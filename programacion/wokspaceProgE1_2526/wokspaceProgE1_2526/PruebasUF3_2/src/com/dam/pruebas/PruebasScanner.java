package com.dam.pruebas;

import java.util.Scanner;

public class PruebasScanner {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce tres números enteros separados por espacio");
		int entero1 = sc.nextInt();
		int entero2 = sc.nextInt();
		int entero3 = sc.nextInt();
		sc.nextLine();
		
		System.out.println("Introduce otro número entero"); // suponemos que el usuario ha introducido 33
		// obtener el valor en dos pasos
		String cadena = sc.nextLine(); // cadena = "33";
		int entero4 = Integer.parseInt(cadena); // entero4 = 33
		
		// obtener el valor en 1 paso
		// int entero4 = Integer.parseInt(sc.nextLine());
		
		// int suma = cadena + 10; // da error porque no puedo asignar una cadena de caracteres a un int
		int suma = entero4 + 10;
		
		System.out.println("La suma de " + entero4 + " más " + 10 + " es " + suma);
		System.out.println("La suma de entero4 más 10 es " + entero4 + 10);
		System.out.println("La suma de entero4 más 10 es " + (entero4 + 10));
		
		System.out.println("Los números enteros introducidos son: " + entero1 + ", " + entero2 + ", " 
				+ entero3 + " y " + cadena);
		System.out.println("Los números enteros introducidos son: " + entero1 + ", " + entero2 + ", " 
				+ entero3 + " y " + entero4);
		
		System.out.println("Introduce un número decimal");
		double decimal = Double.parseDouble(sc.nextLine());
		
		System.out.println("Decimal introducido: " + decimal);
		
		sc.close();

	}

}
