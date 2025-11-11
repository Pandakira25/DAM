package com.dam.ejercicios;

import java.util.Scanner;

/*
 * Realiza un programa que solicite un número entero 
 * e indique si es par o impar (usa el operador ternario)
 */
public class Ejercicio3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un número entero");
		int numero = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		int resto = numero % 2;
		String mensaje = (resto == 0)? "El número es par" :
			"El número es impar";
		
		System.out.println(mensaje);
		
	}

}
