package com.dam.ejercicio3.main;

import java.util.Scanner;

import com.dam.ejercicio3.pojo.EquipoFutbol;

public class CompararResultados {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int numEquipo = 1;
		
		EquipoFutbol eq1 = solicitarDatosEquipo(sc, numEquipo);
		
		numEquipo++;
		
		EquipoFutbol eq2 = solicitarDatosEquipo(sc, numEquipo);
		
		sc.close();
		
		System.out.println(eq1);
		int totalPuntosEq1 = eq1.calcularPuntos();
		System.out.println("Puntos de " + eq1.getNombre() + ": " + totalPuntosEq1 + "\n");
		
		System.out.println(eq2);
		int totalPuntosEq2 = eq2.calcularPuntos();
		System.out.println("Puntos de " + eq2.getNombre() + ": " + totalPuntosEq2 + "\n");
		
		if (totalPuntosEq1 > totalPuntosEq2) {
			System.out.println("El equipo con más puntos es " + eq1.getNombre());
		} else if (totalPuntosEq2 > totalPuntosEq1) {
			System.out.println("El equipo con más puntos es " + eq2.getNombre());
		} else {
			System.out.println("Los dos equipos tienen los mismos puntos");
		}
		
		

	}

	private static EquipoFutbol solicitarDatosEquipo(Scanner sc, int numEquipo) {
		System.out.println("Introduce el nombre del " + numEquipo + "º equipo");
		String nombre = sc.nextLine();
		
		System.out.println("Introduce la ciudad a la que pertenece");
		String ciudad = sc.nextLine();
		
		System.out.println("Introduce número de partidos ganados, empatados y perdidos");
		int numPG = sc.nextInt();
		int numPE = sc.nextInt();
		int numPP = sc.nextInt();
		sc.nextLine();
		
		EquipoFutbol eq = new EquipoFutbol(nombre, ciudad, numPG, numPE, numPP);
		return eq;
	}

}
