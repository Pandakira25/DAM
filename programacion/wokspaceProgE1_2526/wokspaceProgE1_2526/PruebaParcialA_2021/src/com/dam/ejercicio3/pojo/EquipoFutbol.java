package com.dam.ejercicio3.pojo;

public class EquipoFutbol {
	
	static final int PUNTOS_PG = 3;
	static final int PUNTOS_PE = 1;
	static final int PUNTOS_PP = 0;
	
	private String nombre;
	private String ciudad;
	private int numPG;
	private int numPE;
	private int numPP;
	
	public EquipoFutbol(String nombre, String ciudad, int numPG, int numPE, int numPP) {
		this.nombre = nombre;
		this.ciudad = ciudad;
		this.numPG = numPG;
		this.numPE = numPE;
		this.numPP = numPP;
	}
	
	
	
	public String getNombre() {
		return nombre;
	}



	public int calcularPuntos() {
		int totalPuntos = numPG * PUNTOS_PG + numPE * PUNTOS_PE + numPP * PUNTOS_PP;
		return totalPuntos;
	}

	@Override
	public String toString() {
		return nombre + " - " + ciudad 
				+ "\nNúmero de partidos ganados: " + numPG 
				+ "\nNúmero de partidos empatados: " + numPE
				+ "\nNúmero de partidos perdidos: " + numPP;
	}
	

}
