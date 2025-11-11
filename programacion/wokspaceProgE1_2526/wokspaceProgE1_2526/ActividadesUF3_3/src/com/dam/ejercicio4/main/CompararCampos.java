package com.dam.ejercicio4.main;

import java.util.Scanner;

import com.dam.ejercicio4.pojo.CampoFutbol;

public class CompararCampos {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("** Comparador de campos de fútbol **\n");
		
		int numcampo = 1;
		CampoFutbol cf1 = solicitarDatosCampoFutbol(sc, numcampo);
		numcampo++;
		CampoFutbol cf2 = solicitarDatosCampoFutbol(sc, numcampo);
		
		double perimetroCF1 = cf1.calcularPerimetro();
		double areaCF1 = cf1.calcularArea();
		boolean tieneMedidasOfi1 = cf1.tieneMedidasOficiales();
		
		double perimetroCF2 = cf2.calcularPerimetro();
		double areaCF2 = cf2.calcularArea();
		boolean tieneMedidasOfi2 = cf2.tieneMedidasOficiales();
		
		if (perimetroCF1 > perimetroCF2) {
			System.out.println("El campo con mayor perímetro es \n" + cf1);
		} else if (perimetroCF2 > perimetroCF1) {
			System.out.println("El campo con mayor perímetro es \n" + cf2);
		} else {
			System.out.println("Tienen el mismo perímetro");
			System.out.println(cf1);
			System.out.println(cf2);
		}
		
		System.out.println();
		
		if (areaCF1 < areaCF2) {
			System.out.println("El campo con mayor área es \n" + cf1);
		} else if (areaCF2 < areaCF1) {
			System.out.println("El campo con mayor área es \n" + cf2);
		} else {
			System.out.println("Tienen el mismo área");
			System.out.println(cf1);
			System.out.println(cf2);
		}
		
		System.out.println();
		
		if (cf1.getCapacidad() > cf2.getCapacidad()) {
			System.out.println("El campo con mayor capacidad es \n" + cf1);
		} else if (cf2.getCapacidad() > cf1.getCapacidad()) {
			System.out.println("El campo con mayor capacidad es \n" + cf2);
		} else {
			System.out.println("Tienen la misma capacidad");
			System.out.println(cf1);
			System.out.println(cf2);
		}
		
		System.out.println();
		
		if (tieneMedidasOfi1) {
			System.out.println("El campo " + cf1.getNombre() + " tiene medidas oficiales");
		} else {
			System.out.println("El campo " + cf1.getNombre() + " tiene medidas oficiales");
		}
		
		if (tieneMedidasOfi2) {
			System.out.println("El campo " + cf2.getNombre() + " tiene medidas oficiales");
		} else {
			System.out.println("El campo " + cf2.getNombre() + " tiene medidas oficiales");
		}
		
		sc.close();

	}

	private static CampoFutbol solicitarDatosCampoFutbol(Scanner sc, int numcampo) {
		System.out.println("Introduce el nombre del campo " + numcampo);
		String nombre = sc.nextLine();
		
		System.out.println("Introduce las medidas (largo ancho)");
		double largo = sc.nextDouble();
		double ancho = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Introduce la capacidad de espectadores");
		int capacidad = Integer.parseInt(sc.nextLine());
		
		CampoFutbol cf = new CampoFutbol(nombre, largo, ancho, capacidad);
		return cf;
	}

}
