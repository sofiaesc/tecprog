import java.util.Calendar;
import java.util.Vector;

public class Mensualizado extends Trabajador implements Empleado {

	private Jefe myJefe;
	private Categoria myCategoria;

	public Float calcularSueldo(Calendar periodo) {
		return myCategoria.getSueldo();
	}

	public Mensualizado(Jefe myJefe, Categoria myCategoria, String nombre, String apellido, String direccion, Integer dni) {
		super(nombre, apellido, direccion, dni);
		this.myJefe = myJefe;
		this.myCategoria = myCategoria;
		
		myJefe.addEmpleado(this);
	}

	public String mostrar() {
		return "MENSUALIZADO "+myCategoria.toString()+": "+ super.mostrar();
	}

}