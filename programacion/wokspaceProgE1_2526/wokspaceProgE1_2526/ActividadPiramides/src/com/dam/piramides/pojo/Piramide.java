package com.dam.piramides.pojo;

public class Piramide {
	private String nombre;
	private double lado;
	private double altura;
	
	public Piramide(String nombre, double lado, double altura) {
		this.nombre = nombre;
		this.lado = lado;
		this.altura = altura;
	}
	
	public double calcularVolumen() {
		double area = lado * lado;
		double volumen = area * altura / 3;
		return volumen;
	}

	public double getAltura() {
		return altura;
	}

	public String getNombre() {
		return nombre;
	}

	@Override
	public String toString() {
		return "\n" + nombre + " lado de la base: " + lado + " cm y altura: " + altura + " cm";
	}
}
