package com.dam.ejercicio4.pojo;

public class CampoFutbol {
	
	static final int LARGO_MIN_FIFA = 100;
	static final int LARGO_MAX_FIFA = 110;
	static final int ANCHO_MIN_FIFA = 64;
	static final int ANCHO_MAX_FIFA = 75;
		
	private String nombre;
	private double largo;
	private double ancho;
	private int capacidad;
	
	public CampoFutbol(String nombre, double largo, double ancho, int capacidad) {
		this.nombre = nombre;
		this.largo = largo;
		this.ancho = ancho;
		this.capacidad = capacidad;
	}

	// no añadimos los métodos de acceso hasta que identifiquemos su necesidad
	public int getCapacidad() {
		return capacidad;
	}
	
	

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	@Override
	public String toString() {
		return "Campo de Fútbol: " + nombre + "\nMedidas: " + largo + " x " + ancho 
				+ "\nCapacidad de espectadores: " + capacidad;
	}
	
	public double calcularPerimetro() {
		return largo * 2 + ancho * 2;
	}
	
	public double calcularArea() {
		return largo * ancho;
	}
	
	/*
	 * método que indique si el campo tiene medidas para partidos oficiales o
internacionales según la FIFA, es decir, un mínimo de 64m x 100m y un máximo de 75m x
110m
	 */
	public boolean tieneMedidasOficiales() {
		return ((ancho >= ANCHO_MIN_FIFA && ancho <= ANCHO_MAX_FIFA) 
				&& (largo >= LARGO_MIN_FIFA && largo <= LARGO_MAX_FIFA));
	}

}
