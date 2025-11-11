package com.dam.piramides.main;

import java.util.Scanner;

import com.dam.piramides.pojo.Piramide;

public class CompararPiramides {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int numPiramide = 1;
		Piramide piramide1 = solicitarDatosPiramide(sc, numPiramide);
		
		numPiramide++;
		Piramide piramide2 = solicitarDatosPiramide(sc, numPiramide);
		
		sc.close();
		
		System.out.println(piramide1);
		System.out.println(piramide2);
		
		double volumenP1 = piramide1.calcularVolumen();
		double volumenP2 = piramide2.calcularVolumen();
		
		if (volumenP1 > volumenP2) {
			System.out.println("\nLa pirámide " + piramide1.getNombre() + " tiene mayor volumen");
			
		} else if (volumenP1 < volumenP2) {
			System.out.println("\nLa pirámide " + piramide2.getNombre() + " tiene mayor volumen");
			
		} else {
			System.out.println("\nLa pirámide " + piramide1.getNombre() + " y la pirámide " + piramide2.getNombre() 
			+ " tienen igual volumen");
		}
		
		if (piramide1.getAltura() > piramide2.getAltura()) {
			System.out.println("\nLa pirámide " + piramide1.getNombre() + " tiene mayor altura");
			
		} else if (piramide1.getAltura() < piramide2.getAltura()) {
			System.out.println("\nLa pirámide " + piramide2.getNombre() + " tiene mayor altura");
			
		} else {
			System.out.println("\nLa pirámide " + piramide1.getNombre() + " y la pirámide " + piramide2.getNombre() 
			+ " tienen igual altura");
		}
		

	}

	private static Piramide solicitarDatosPiramide(Scanner sc, int numPiramide) {
		String nombre;
		double lado;
		double altura;
		
		System.out.println("Introduce el nombre de la pirámide " + numPiramide);
		nombre = sc.nextLine();
		
		System.out.println("Introduce el lado de la base y la altura separador por espacio");
		lado = sc.nextDouble();
		altura = sc.nextDouble();
		sc.nextLine();
		
		Piramide piramide = new Piramide(nombre, lado, altura);
		return piramide;
	}

}
