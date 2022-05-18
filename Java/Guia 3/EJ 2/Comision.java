import java.util.Calendar;
import java.util.Vector;

public class Comision {
	private Calendar fechaInicio;
	private String identificacion;
	private Vector<Alumno> alumnos;
	private Docente titular;
	
	public Comision(Calendar fechaInicio, String identificacion, Docente titular) {
		this.fechaInicio = fechaInicio;
		this.identificacion = identificacion;
		this.alumnos = new Vector<Alumno>();
		this.titular = titular;
	}

	public Boolean esVigente() {
		return true;
	}
	
	public void listarAlumnos() {
		System.out.println(identificacion);
		for(Alumno oAlumno : alumnos) {
			oAlumno.mostrar();
		}
	}
	
	public void addAlumno(Alumno a) {
		alumnos.add(a);
	}
}
