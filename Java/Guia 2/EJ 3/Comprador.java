import java.util.Vector;

public class Comprador {

	private String dni;
  	private Persona persona;
  	public Vector<Venta> compras;
  
  	public Comprador(String dni, Persona persona) {
  		this.dni = dni;
  		this.persona = persona;
  		compras = new Vector<Venta>();
  	}

	public void mostrar() {
		System.out.println(persona.toString() + " - DNI "+dni);
	}
  
}