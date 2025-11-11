package com.dam.ejerciciosif;

import java.util.Scanner;

public class Ejercicio8_2 {

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
			
		} else if (mes < 1 || mes > 12) {
				System.out.println("El mes no es válido");
				fechaCorrecta = false;
			
		} else {
			int maxDiaFeb = 28;
			if (mes == 2 && ((anio % 4 == 0 && anio % 100 != 0) || anio % 400 == 0)) {
				// esBisiesto = true;
				maxDiaFeb = 29;
			}
			
			if ( ((mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) && (dia < 1 || dia > 31)) 
					|| (mes == 2 && (dia < 1 || dia > maxDiaFeb)) 
					|| ((mes == 4 || mes == 6 || mes == 9 || mes == 11) && (dia < 1 || dia > 30)) ) {
					System.out.println("El día no es válido");
					fechaCorrecta = false;
			} 
		}
		
		if (fechaCorrecta) { // if (fechaCorrecta == true) {
			System.out.println("La fecha es correcta: " + dia + "/" + mes + "/" + anio);
		}

	}

}
