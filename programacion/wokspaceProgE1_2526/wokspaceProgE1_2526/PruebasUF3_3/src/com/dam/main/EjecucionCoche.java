package com.dam.main;

import com.dam.pojos.CochePojo;

public class EjecucionCoche {

	public static void main(String[] args) {
		CochePojo objCoche = new CochePojo();
		
		objCoche.setMatricula("JLS1234");
		objCoche.setVelocidad(0);
		
		System.out.println("El coche con matrícula " + objCoche.getMatricula() 
		+ " tiene una velocidad inicial de " + objCoche.getVelocidad() + " km/h");
		
		objCoche.acelera(50);
		
		System.out.println("\nEl coche con matrícula " + objCoche.getMatricula() 
		+ ", después de acelerar, tiene una velocidad de " + objCoche.getVelocidad() + " km/h");
		
		objCoche.frena(10);
		
		System.out.println("\nEl coche con matrícula " + objCoche.getMatricula() 
		+ ", después de frenar, tiene una velocidad de " + objCoche.getVelocidad() + " km/h");

	}

}
