package com.dam.ejercicio1;

public class Ejercicio1 {
	
	static final int CANTIDAD_TERMINOS = 24;
	static final int TERMINO_INICIAL = 17;
	static final int DIF_TERMINOS = 7;

	public static void main(String[] args) {
		int termino = TERMINO_INICIAL;
		
		for (int i = 0; i < CANTIDAD_TERMINOS; i++) {
			System.out.print(termino);
			if (i < CANTIDAD_TERMINOS - 1) {
				System.out.print(" - ");
			}
			termino += DIF_TERMINOS;
		}
		
		// otra opción
		int termino2;
		for (int i = 0; i < CANTIDAD_TERMINOS; i++) {
			termino2 = TERMINO_INICIAL + i * DIF_TERMINOS;
			System.out.print(termino2 + " ");
			
		}
				
		/* otra opción
		int i = 1;
		
		for (int termino = TERMINO_INICIAL; i <= CANTIDAD_TERMINOS; termino += DIF_TERMINOS) {
			System.out.print(termino + " ");
			i++;
		}*/
		
	}

}
