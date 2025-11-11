package com.dam.ejerciciosfor;

public class Ejercicio2 {

	static final int LIM_INF = 40;
	static final int LIM_SUP = 280;
	static final int PASO = 2;
	
	public static void main(String[] args) {
		for (int i = LIM_INF; i <= LIM_SUP; i+=PASO) {
			System.out.print(i + " ");
		}

		/*int n = LIM_INF;
		while (n <= LIM_SUP) {
			System.out.print(n + " ");
			n = n + PASO;
		}*/
	}

}
