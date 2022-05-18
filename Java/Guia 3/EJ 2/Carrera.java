import java.util.Vector;

public class Carrera {
	// modifico el tipo de dato para nombre, debe ser String y no Integer.
	private String nombre;
	private Vector<Alumno> alumnos;
	private Vector<Docente> docentes;
	
	// implemento el constructor de Carrera que no se ve en el código.
	// no cumple con la definición de un Objeto Bien Formado.
	public Carrera(String nombre) {
		this.nombre = nombre;
		alumnos = new Vector<Alumno>();
		docentes = new Vector<Docente>();
	}
	
	public void addAlumno(Alumno a) {
		alumnos.add(a);
	}
	
	public void addDocente(Docente d) {
		docentes.add(d);
	}
	
}
