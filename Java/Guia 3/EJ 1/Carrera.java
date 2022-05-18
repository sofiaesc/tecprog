import java.util.Vector;

public class Carrera {
	// modifico el tipo de dato para nombre, debe ser String y no Integer.
	private String nombre;
	private Vector<Alumno> cAlumnos;
	
	// implemento el constructor de Carrera que no se ve en el c�digo.
	// no cumple con la definici�n de un Objeto Bien Formado.
	public Carrera(String nombre) {
		this.nombre = nombre;
		cAlumnos = new Vector<Alumno>();
	}
	
	public void addAlumno(Alumno a) {
		cAlumnos.add(a);
	}
	
	// funci�n que cuenta los egresados de la carrera
	public Integer contar_egresados() {
		Integer cant_egresados = 0;
		
		// cambio el m�todo para no preguntarle su atributo (fecha_egreso). 
		// el c�digo original no cumple con TDA.
		for(Alumno alum : cAlumnos) {
			if(alum.esEgresado()) {
				cant_egresados = cant_egresados + 1;
			}
		}
		
		// no sigo con la otra parte del c�digo en la que imprime la informaci�n
		// de los egresados (nombre, promedio) ya que estar�amos haciendo muchas
		// cosas en un s�lo m�todo. no cumple con el Principio de Responsabilidad �nica.
		// hago otro m�todo para esto.
		
		return cant_egresados;
	}
	
	// funci�n que muestra los egresados de la carrera. no le pido el nombre y promedio a
	// Alumno para mostrarlo, sino que le pido a Alumno que muestre su nombre y promedio.
	public void listar_egresados() {
		for(Alumno alum : cAlumnos) {
			alum.listarEgresado();
		}
	}
}
