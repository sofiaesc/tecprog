import java.util.Calendar;
import java.util.Vector;

public class Alumno {
	private String nombre;
	private Calendar fecha_ingreso;
	private Calendar fecha_egreso;
	private Carrera carrera;
	private Vector<Catedra> catedra;
	private Vector<Examen> examenes;
	
	public Alumno(String nombre, Calendar fecha_ingreso, Calendar fecha_egreso, Carrera carrera) {
		this.nombre = nombre;
		this.fecha_ingreso = fecha_ingreso;
		this.fecha_egreso = fecha_egreso;
		this.carrera = carrera;
		
		carrera.addAlumno(this);
		examenes = new Vector<Examen>();
		catedra = new Vector<Catedra>();
	}

	public void addCatedra(Catedra c) {
		catedra.add(c);
	}
	
	public void addExamen(Examen e) {
		examenes.add(e);
	}
	
	// implemento la función esEgresado para no preguntarle los atributos privados
	// fuera de la clase (fecha_egreso)
	public boolean esEgresado() {
		if(fecha_egreso != null) {
			return true;
		}
		return false;
	}
	
	// calculo el promedio de cada alumno en la clase alumno.
	public Float calcularPromedio() {
		Float notas = 0f;
		Integer cant_notas = 0;
		
		for(Examen ex : examenes) {
			if(ex.getNota() >= 6) {
				notas += ex.getNota();
				++cant_notas;
			}
		}
		
		return (float) (notas/cant_notas);
	}

	public void listarEgresado() {
		System.out.println("Egresado: "+nombre+" - Promedio: "+this.calcularPromedio());	
	}

}
