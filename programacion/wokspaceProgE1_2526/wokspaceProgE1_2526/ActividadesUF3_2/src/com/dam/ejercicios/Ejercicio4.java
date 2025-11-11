package com.dam.ejercicios;

import java.util.Scanner;

/*
 * Realiza un programa que solicite el número de 
 * horas, el número de minutos y el número de segundos 
 * e indique por consola cuántos segundos son en total
 */
public class Ejercicio4 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce número de horas " 
		+ "\nseparado por un espacio del número de minutos y "
		+ "\nseparado por un espacio del número de segundos");
		int numHoras = sc.nextInt();
		int numMin = sc.nextInt();
		int numSeg = sc.nextInt();
		sc.nextLine();
		
		sc.close();
		
		int totalSeg = numSeg + numMin * 60 + numHoras * 3600;
		
		System.out.println(numHoras + " horas, " + numMin + " minutos y " 
		+ numSeg + " segundos son en total " + totalSeg + " segundos");

	}

}
