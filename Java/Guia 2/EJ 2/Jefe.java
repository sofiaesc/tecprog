import java.util.Calendar;
import java.util.Vector;

public class Jefe extends Trabajador {

	private Float sueldo;

	private Vector<Jornalizado> myJornalizado;
	
	private Vector<Mensualizado> myMensualizado;

	public Float calcularSueldo(Calendar periodo) {
		return sueldo;
	}

	public Jefe(Float sueldo, String nombre, String apellido, String direccion, Integer dni) {
		super(nombre, apellido, direccion, dni);
		this.sueldo = sueldo;
		this.myJornalizado = new Vector<Jornalizado>();
		this.myMensualizado = new Vector<Mensualizado>();
	}

	public String mostrar() {
		return "JEFE: " + super.mostrar();
	}

	
}