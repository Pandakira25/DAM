package com.dam.ejerciciosswitch;

import java.util.Scanner;

public class Ejercicio12 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un número entre 1 y 12");
		int mes = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		switch (mes) {
		case 1, 3, 5, 7, 8, 10, 12:
			System.out.println("El mes " + mes + " tiene 31 días ");
			break;
		case 2:
			System.out.println("El mes " + mes + " tiene 28 días si es un año no bisiesto, 29 en otro caso");
			break;
		default:
			System.out.println("El mes " + mes + " tiene 30 días ");
		}
		
		switch (mes) {
		case 1:
			System.out.println("Enero tiene 31 días ");
			break;
		case 2:
			System.out.println("Febrero tiene 28 días si es un año no bisiesto, 29 en otro caso");
			break;
		case 3:
			System.out.println("Marzo tiene 31 días ");
			break;
		case 4:
			System.out.println("Abril tiene 30 días ");
			break;
		case 5:
			System.out.println("Mayo tiene 31 días ");
			break;
		case 6:
			System.out.println("Junio tiene 30 días ");
			break;
		case 7:
			System.out.println("Julio tiene 31 días ");
			break;
		case 8:
			System.out.println("Agosto tiene 31 días ");
			break;
		case 9:
			System.out.println("Septiembre tiene 30 días ");
			break;
		case 10:
			System.out.println("Octubre tiene 31 días ");
			break;
		case 11:
			System.out.println("Noviembre tiene 30 días ");
			break;
		case 12:
			System.out.println("Diciembre tiene 31 días ");
			break;
		default:
			System.out.println("El mes es incorrecto ");
		}

	}

}
