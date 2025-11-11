package com.dam.main;

import com.dam.pojos.Libro;

public class UsoLibro {

	public static void main(String[] args) {
		Libro libro1 = new Libro();
		
		libro1.setTitulo("El Quijote");
		libro1.setAutor("Miguel de Cervantes");
		libro1.setNumPag(567);
		libro1.setTapasDuras(true);
		
		/*
		System.out.println("Título: " + libro1.getTitulo());
		System.out.println("Autor: " + libro1.getAutor());
		System.out.println("Número de páginas: " + libro1.getNumPag());
		System.out.println("¿Tiene tapas duras? " + (libro1.isTapasDuras()? "SI":"NO"));
		*/
		System.out.println(" Libro 1:");
		System.out.println(libro1); // necesario definir el método toString en el POJO

		Libro libro2 = new Libro("Viaje a la Alcarria", "Camilo José Cela", 371, false);
		
		System.out.println("\n Libro 2:");
		System.out.println(libro2);
		
	}

}
