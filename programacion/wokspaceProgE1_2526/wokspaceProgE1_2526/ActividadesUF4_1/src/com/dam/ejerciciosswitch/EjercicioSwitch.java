package com.dam.ejerciciosswitch;

import java.util.Scanner;

/*
 * solicitar la nota de un examen, teniendo que ser esta nota un valor entero y
 * mostrar por consola la nota en formato de texto correspondiente usando un switch
 */
public class EjercicioSwitch {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce la nota entera");
		int nota = sc.nextInt();
		sc.nextLine();
		
		sc.close();
		
		switch (nota) {
		case 9, 10:
			System.out.println("SOBRESALIENTE");
			break;
		case 7, 8:
			System.out.println("NOTABLE");
			break;
		case 6:
			System.out.println("BIEN");
			break;
		case 5:
			System.out.println("SUFICIENTE");
			break;
		default:
			System.out.println("INSUFICIENTE");
		}

	}

}
