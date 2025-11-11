package com.dam.pojos;

public class Libro {
	
	// ## constantes
	
	// ## atributos o variables globales
	private String titulo;
	private String autor;
	private int numPag;
	private boolean tapasDuras;
	
	// ## constructores
	// son públicos
	// no tienen indicador de retorno
	// nombre igual a la clase
	
	// constructor por defecto
	public Libro() {}
	
	// constructor para inicializar todos los atributos, como hay 4 atributos, necesita 4 parámetros
	public Libro(String valorTitulo, String valorAutor, int valorNumPag, boolean valorTD) {
		titulo = valorTitulo;
		autor = valorAutor;
		numPag = valorNumPag;
		tapasDuras = valorTD;
		
	}
	
	// ## métodos de acceso a los atributos
	
	// método get del atributo titulo 
	// retorna el valor del atributo de tipo String
	// no necesita parámetros (declaración de variables entre los paréntesis)
	public String getTitulo() {
		return titulo;
	}
	
	// método set del atributo titulo 
	// para asignar valor al atributo
	// no retorna nada (void)
	// necesita un parámetro de tipo String que contendrá el valor que se asignará al atributo
	public void setTitulo(String valor) {
		titulo = valor;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		// this se usa para diferenciar el atributo o variable globar de la variable local con el mismo nombre
		this.autor = autor;
	}

	public int getNumPag() {
		return numPag;
	}

	public void setNumPag(int numPag) {
		this.numPag = numPag;
	}

	public boolean isTapasDuras() {
		return tapasDuras;
	}

	public void setTapasDuras(boolean tapasDuras) {
		this.tapasDuras = tapasDuras;
	}

	/* toString generado por eclipse
	@Override
	public String toString() {
		return "Título: " + titulo + "\nAutor: " + autor 
				+ "\nNúmero de páginas: " + numPag 
				+ "\n¿Tiene tapas duras? " + (tapasDuras? "SI":"NO");
	}*/
	
	
	// toString generado de manera manual
	public String toString() {
		String cadena = "Título: " + titulo + "\nAutor: " + autor 
				+ "\nNúmero de páginas: " + numPag 
				+ "\n¿Tiene tapas duras? " + (tapasDuras? "SI":"NO");
		return cadena;
	}

}
