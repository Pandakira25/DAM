package com.dam.ejerciciosfor;

public class Ejercicio1 {

	static final int NUM_TABLA = 7;
	static final int LIMITE = 12;
	
	public static void main(String[] args) {
		// 7 X 1 = 7
		// 7 X 2 = 14
		// 7 X 3 = 21
		// ...
		// 7 x 10 = 70
		
		System.out.println("** TABLA DEL " + NUM_TABLA + " **");
		for (int i = 1; i <= LIMITE; i++) {
			System.out.println(NUM_TABLA + " x " + i + " = " + (NUM_TABLA * i));
		}

	}

}
