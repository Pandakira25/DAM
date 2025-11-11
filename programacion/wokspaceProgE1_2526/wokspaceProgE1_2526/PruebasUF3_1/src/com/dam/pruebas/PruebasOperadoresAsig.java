package com.dam.pruebas;

public class PruebasOperadoresAsig {

	public static void main(String[] args) {
		int a = 7;
		int b = 3;
		
		a += b; // a = a + b --> 10
		System.out.println("a tras sumarle b: " + a);
		
		a -= b; // a = a - b --> 7
		System.out.println("a tras restarle b: " + a);
		
		a *= b; // a = a * b --> 21
		System.out.println("a tras multiplicarlo por b: " + a);
		
		a /= b; // a = a / b --> 7
		System.out.println("a tras dividirlo entre b: " + a);

		a %= b; // a = a % b --> 1
		System.out.println("a tras asignarle el resto de dividir a entre b: " + a);
	}

}
