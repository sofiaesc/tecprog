import java.util.Calendar;
import java.util.Vector;

public class Alumno {
	private Calendar fecha_ingreso;
	private Calendar fecha_egreso;
	private Vector<Carrera> carreras;
	private Persona persona;
	private Vector<Catedra> catedra;
	private Vector<Examen> examenes;
	private Vector<Comision> comisiones;
	
	public Alumno(Calendar fecha_ingreso, Persona persona) {
		this.persona = persona;
		this.fecha_ingreso = fecha_ingreso;
		
		carreras = new Vector<Carrera>();
		examenes = new Vector<Examen>();
		catedra = new Vector<Catedra>();
		comisiones = new Vector<Comision>();
	}

	public void addFechaEgreso(Calendar fecha) {
		fecha_egreso = fecha;
	}
	public void addCatedra(Catedra c) {
		catedra.add(c);
	}
	public void addComisiones(Comision c) {
		comisiones.add(c);
	}
	
	public void addExamen(Examen e) {
		examenes.add(e);
	}
	
	public void mostrar() {
		persona.mostrar();
	}
}