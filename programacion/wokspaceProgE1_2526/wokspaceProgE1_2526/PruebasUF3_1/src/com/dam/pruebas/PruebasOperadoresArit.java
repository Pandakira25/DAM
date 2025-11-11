package com.dam.pruebas;
// Pruebas con operadores aritméticos
public class PruebasOperadoresArit {

	public static void main(String[] args) {
		int a = 3;
		int b = 7;
		
		int resultado;
		
		resultado = a + b;
		System.out.println(a + " + " + b + " = " + resultado);
		
		resultado = a - b;
		System.out.println(a + " - " + b + " = " + resultado);
		
		resultado = a * b;
		System.out.println(a + " x " + b + " = " + resultado);
		
		// si las variables que intervienen en la división son enteras el resultado es entero
		resultado = b / a;
		System.out.println("división entera: " + b + " / " + a + " = " + resultado);
		
		// para obtener un resultado de una división decimal tenemos que castear alguna de las variables
		// si es que no son decimales
		double resultadoDecimal = (double) b / a;
		System.out.println("división decimal: " + b + " / " + a + " = " + resultadoDecimal);

		// el operador % devuelve el resto de la división, es decir, divido a entre b y me devuelve el resto
		resultado = a % b;
		System.out.println("resto de dividir " + a + " entre " + b + " = " + resultado);
	}

}
