package com.dam.ejercicios;

import java.util.Scanner;

/*
 * Realiza un programa que solicite el nombre de un producto, su precio inicial 
 * y un porcentaje de descuento, y calcule y muestre por consola el precio final 
 * de dicho producto
 */
public class Ejercicio5 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introduce el nombre del producto");
		String producto = sc.nextLine();
		
		System.out.println("Introduce su precio");
		double precio = Double.parseDouble(sc.nextLine());
		
		System.out.println("Introduce el porcentaje de descuento");
		int porcentaje = Integer.parseInt(sc.nextLine());
		
		sc.close();
		
		double precioFinal = precio - (precio * porcentaje / 100);
		
		System.out.println("El precio final del producto " + producto 
				+ " es " + precioFinal);

	}

}
