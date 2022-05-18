import java.util.Calendar;
import java.util.Vector;

public class Jefe extends Trabajador {

	private Float sueldo;
	
	private Vector<Empleado> myEmpleado;

	public Float calcularSueldo(Calendar periodo) {
		return sueldo;
	}

	public Jefe(Float sueldo, String nombre, String apellido, String direccion, Integer dni) {
		super(nombre, apellido, direccion, dni);
		this.sueldo = sueldo;
		this.myEmpleado = new Vector<Empleado>();
	}

	public String mostrar() {
		return "JEFE: " + super.mostrar();
	}

	public void addEmpleado(Empleado emp) {
		myEmpleado.add(emp);
	}

	public void listarEmpleados() {
		for(Empleado oEmpleado : myEmpleado) {
			System.out.println(oEmpleado.mostrar());
		}
	}
}