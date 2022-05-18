import java.util.Vector;

public class Universidad {
	private String nombre;
	private Vector<Carrera> carreras;
	
	public Universidad(String nombre) {
		this.nombre = nombre;
		carreras = new Vector<Carrera>();
	}

	public void listarAlumno(Catedra catedra) {
		System.out.print("Mostrar alumnos de la cátedra ");
		catedra.mostrar();
		catedra.listarAlumnos();
	}
}
