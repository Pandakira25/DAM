package com.dam.ejerciciosif;

import java.util.Scanner;

/*
 * Un obrero necesita calcular su salario semanal, el cual se obtiene de la siguiente manera:
 * Si trabaja 40 horas o menos se le paga $16 por hora
 * Si trabaja más de 40 horas se le paga $16 por cada una de las
 * primeras 40 horas y $20 por cada hora extra
 */
public class Ejercicio3 {
	static final int JORNADA_SEMANAL = 40;
	static final int SALARIO_HORA = 16;
	static final int SALARIO_HORA_EXTRA = 20;

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce el número de horas trabajadas esta semana");
		double horasTrabajadas = Double.parseDouble(sc.nextLine());
		
		sc.close();
		
		double salarioSemanal = horasTrabajadas;
		
		if (horasTrabajadas <= JORNADA_SEMANAL) {
			salarioSemanal = horasTrabajadas * SALARIO_HORA;
		} else {
			salarioSemanal = JORNADA_SEMANAL * SALARIO_HORA + (horasTrabajadas - JORNADA_SEMANAL) * SALARIO_HORA_EXTRA;
		}
		
		System.out.println("El salario de esta semana es " + salarioSemanal);
	}

}
