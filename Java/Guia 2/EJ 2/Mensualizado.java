import java.util.Calendar;
import java.util.Vector;

public class Mensualizado extends Trabajador {

	private Jefe myJefe;
	private Categoria myCategoria;

	public Float calcularSueldo(Calendar periodo) {
		return myCategoria.getSueldo();
	}

	public Mensualizado(Jefe myJefe, Categoria myCategoria, String nombre, String apellido, String direccion, Integer dni) {
		super(nombre, apellido, direccion, dni);
		this.myJefe = myJefe;
		this.myCategoria = myCategoria;
		
	
	}

	public String mostrar() {
		return "MENSUALIZADO: "+ super.mostrar();
	}
}