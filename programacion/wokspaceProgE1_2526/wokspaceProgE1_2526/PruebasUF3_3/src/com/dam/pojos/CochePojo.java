package com.dam.pojos;

public class CochePojo {
	// atributos o variables globales. Por principio de diseño SIEMPRE privadas
	private String matricula;
	private int velocidad;
	
	// métodos de acceso get, para obtener el valor de un atributo
	public String getMatricula() {
		return matricula;
	}
	
	public int getVelocidad() {
		return velocidad;
	}
	
	// métodos de acceso set, para asignar valor a un atributo
	public void setMatricula(String valor) {
		matricula = valor;
	}
	
	public void setVelocidad(int valor) {
		velocidad = valor;
	}
	
	public void acelera(int i) {
		velocidad += i;
	}
	
	public void frena(int i) {
		velocidad -= i; // velocidad = velocidad - i
	}	

}
