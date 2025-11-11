package com.dam.ejercicio3.pojo;

public class Helipuerto {
	
	static final double PI = 3.1416;
	
	private String nombre;
	private double radio;
	
	public Helipuerto() {}
	
	public Helipuerto(String nombre, double radio) {
		this.nombre = nombre;
		this.radio = radio;
	}

	// método de acceso set del atributo nombre
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	// método de acceso get del atributo nombre
	public String getNombre() {
		return nombre;
	}

	public double getRadio() {
		return radio;
	}

	public void setRadio(double radio) {
		this.radio = radio;
	}
	
	public double calcularArea() {
		double area = PI * radio * radio;
		return area;
	}

	@Override
	public String toString() {
		return "Helipuerto " + nombre + " con un radio de " + radio;
	}
	
}
