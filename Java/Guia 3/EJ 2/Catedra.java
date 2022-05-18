import java.util.Vector;

public class Catedra {
	// cambio el tipo de dato de nombre por String, no Integer.
	private String nombre;
	private Vector<Alumno> cAlumnos;
	private Vector<Examen> examenes;
	private Vector<Comision> comisiones;
	
	public Catedra(String nombre) {
		this.nombre = nombre;
		this.cAlumnos = new Vector<Alumno>();
		this.examenes = new Vector<Examen>();
		this.comisiones = new Vector<Comision>();
	}
	
	public void addAlumno(Alumno a) {
		cAlumnos.add(a);
	}
	
	public void addAlumno(Comision c) {
		comisiones.add(c);
	}
	
	public void addExamen(Examen a) {
		examenes.add(a);
	}
	
	public void addComision(Comision c) {
		comisiones.add(c);
	}
	public void listarAlumnos() {
		for(Comision oComision : comisiones) {
			if(oComision.esVigente()) {
				oComision.listarAlumnos();
			}
		}	
	}
	
	public void mostrar() {
		System.out.println(nombre);
	}
}
