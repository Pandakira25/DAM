package com.dam.ejercicio3.main;

import java.util.Scanner;

import com.dam.ejercicio3.pojo.Helipuerto;

public class CompararHelipuertos {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("** Bienvenido al comparador de helipuertos **");
		
		System.out.println("\nIntroduce el nombre del primer helipuerto");
		String nombreH1 = sc.nextLine();
		
		System.out.println("Introduce el radio del primer helipuerto");
		double radioH1 = Double.parseDouble(sc.nextLine());
		/*double radioH1 = sc.nextDouble();
		sc.nextLine();*/
		
		Helipuerto h1 = new Helipuerto(nombreH1, radioH1);
		
		Helipuerto h2 = new Helipuerto();
		
		System.out.println("\nIntroduce el nombre del segundo helipuerto");
		String nombreH2 = sc.nextLine();
		
		System.out.println("Introduce el radio del segundo helipuerto");
		double radioH2 = Double.parseDouble(sc.nextLine());
		
		sc.close();
		
		h2.setNombre(nombreH2);
		h2.setRadio(radioH2);
		
		// tenemos que comparar sus áreas
		double areaH1 = h1.calcularArea();
		double areaH2 = h2.calcularArea();
		
		if (areaH1 > areaH2) {
			System.out.println("\nEl helipuerto con mayor área es " + h1);
			System.out.println("Área: " + areaH1);
		} else if (areaH2 > areaH1){
			System.out.println("\nEl helipuerto con mayor área es " + h2);
			System.out.println("Área: " + areaH2);
		} else {
			System.out.println("\nLos helipuertos:\n" + h1 + "\n"+ h2 + "\ntienen el mismo área");
			System.out.println("Área: " + areaH1);
		}
		
	}

}
