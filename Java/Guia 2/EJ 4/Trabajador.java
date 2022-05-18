import java.util.Calendar;

public abstract class Trabajador {

	private String nombre, apellido, direccion;
	private Integer dni;
	
	public Trabajador(String nombre, String apellido, String direccion, Integer dni) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.direccion = direccion;
		this.dni = dni;
	}

	public abstract Float calcularSueldo(Calendar periodo);

	public String mostrar() {
		return apellido.toUpperCase() + ", " + nombre.toUpperCase();
	}

}