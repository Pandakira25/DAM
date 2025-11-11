package com.dam.ejerciciosif;

import java.util.Scanner;

public class Ejercicio8 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce el día");
		int dia = sc.nextInt();
		sc.nextLine();
		
		System.out.println("Introduce el mes");
		int mes = Integer.parseInt(sc.nextLine());
		
		System.out.println("Introduce el año");
		int anio = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		boolean fechaCorrecta = true;
		if (anio <= 0) {
			System.out.println("El año no es válido");
			fechaCorrecta = false;
		} else {
			
			if (mes < 1 || mes > 12) {
				System.out.println("El mes no es válido");
				fechaCorrecta = false;
			} else {
				
				if (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) {
					if (dia < 1 || dia > 31) {
						System.out.println("El día no es válido");
						fechaCorrecta = false;
					} 
					// else {
						// fechaCorrecta = true;
					//}
				} else if (mes == 2) {
					// analizar si es bisiesto
					// boolean esBisiesto = false;
					int maxDiaFeb = 28;
					if ((anio % 4 == 0 && anio % 100 != 0) || anio % 400 == 0) {
						// esBisiesto = true;
						maxDiaFeb = 29;
					}
					
					if (dia < 1 || dia > maxDiaFeb) {
						System.out.println("El día no es válido");
						fechaCorrecta = false;
					} 
					// else {
						// fechaCorrecta = true;
					//}
					
				} else {
					if (dia < 1 || dia > 30) {
						System.out.println("El día no es válido");
						fechaCorrecta = false;
					} 
					// else {
						// fechaCorrecta = true;
					// }
				}
			}
		}
		
		if (fechaCorrecta) { // if (fechaCorrecta == true) {
			System.out.println("La fecha es correcta: " + dia + "/" + mes + "/" + anio);
		}

	}

}
