import java.util.Calendar;
import java.util.Vector;

public class Empresa {

	private String nombre;
	private Vector<Trabajador> myTrabajador;

	public void calcularRemuneraciones(Calendar periodo) {
		
		for(Trabajador oTrabajador : myTrabajador) {
			System.out.println(oTrabajador.mostrar() + ": " + oTrabajador.calcularSueldo(periodo));
		}
	}

	public Empresa(String nombre) {
		this.nombre = nombre;
		this.myTrabajador = new Vector<Trabajador>();
	}

	public void addEmpleado(Trabajador trabajador) {
		myTrabajador.add(trabajador);
	}

}