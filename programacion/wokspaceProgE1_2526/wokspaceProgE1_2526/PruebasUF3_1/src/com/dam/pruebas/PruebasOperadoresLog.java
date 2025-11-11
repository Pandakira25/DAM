package com.dam.pruebas;

public class PruebasOperadoresLog {

	public static void main(String[] args) {
		int a = 3;
		int b = 7;
		int c = 4;
		
		boolean resultado;
		
		resultado = a < b && c < b; // true && true ==> true
		System.out.println("a < b && c < b? " + resultado);

		resultado = a < b && c == b; // true AND false ==> false
		System.out.println("a < b && c == b? " + resultado);
		
		resultado = a == b || c < b; // false OR true ==> true
		System.out.println("a == b || c < b? " + resultado);
		
		/* si el operador es un && (AND) tienen que ser los dos true para que el resultado sea true
		 * si el operador es un || (OR) con que uno sea true, el resultado será true
		 */
		
		resultado = !(a == b || c < b); // a != b && c >= b
		// resultado : !(false OR true) = !false !OR !true = true AND false = false
		// resultado : !(true) = false
		System.out.println("!(a == b || c < b)? " + resultado);
	}

}
