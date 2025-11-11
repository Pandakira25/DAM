package com.dam.pruebas;

public class PruebasOperadoresUni {

	public static void main(String[] args) {
		int contador = 0;
		
		contador = contador + 1;
		
		contador++; // es lo mismo que contador = contador + 1
		
		System.out.println("contador: " + contador); // 2 porque hemos aumentado contador dos veces
		
		int a;
		
		a = contador + 1; // a valdrá 3 y contador sigue valiendo 2
		
		System.out.println("a: " + a);
		
		a = contador++; // a valdrá 2 porque primero asigna y después aumenta contador, contador valdrá 3
		
		System.out.println("a: " + a);
		
		System.out.println("contador: " + contador); // 3 porque hemos aumentado al asignar valor a a (línea 20)
		
		contador--; // es lo mismo que contador = contador - 1
		
		System.out.println("contador: " + contador); // 1

	}

}
