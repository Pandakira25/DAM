package com.dam.pruebas.seleccion;

import java.util.Scanner;

public class PruebasSwitch {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce un número entero del 1 al 5");
		int numero = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		if (numero == 1) {
			System.out.println(" * ");
		} else if (numero == 2) {
			System.out.println(" * * ");
		} else if (numero == 3) {
			System.out.println(" * * * ");
		} else if (numero == 4){
			System.out.println(" * * * * ");
		} else {
			System.out.println(" * * * * * ");
		}
		
		System.out.println("## separación del if y el switch");
		// como estoy comparando valores exactos y una variable de tipo int puedo usar el switch
		
		switch (numero) {
		case 1:
			System.out.println(" * ");
			break;
		case 2:
			System.out.println(" * * ");
			break;
		case 3:
			System.out.println(" * * * ");
			break;
		case 4:
			System.out.println(" * * * * ");
			break;
		case 5:
			System.out.println(" * * * * * ");
			break;
		default:
			System.out.println("El número introducido no es uno de los esperados ");
			
		}

	}

}
