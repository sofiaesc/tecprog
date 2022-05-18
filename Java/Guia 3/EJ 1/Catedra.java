import java.util.Vector;

public class Catedra {
	// cambio el tipo de dato de nombre por String, no Integer.
	private String nombre;
	private Vector<Alumno> cAlumnos;
	private Vector<Examen> examenes;
	
	public Catedra(String nombre) {
		this.nombre = nombre;
		this.cAlumnos = new Vector<Alumno>();
		this.examenes = new Vector<Examen>();
	}
	
	public void addAlumno(Alumno a) {
		cAlumnos.add(a);
	}
	
	public void addExamen(Examen a) {
		examenes.add(a);
	}
}
