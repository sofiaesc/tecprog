import java.util.Calendar;

public class Examen {
	private Integer nota;
	private Calendar fecha;
	private Catedra catedra;
	private Alumno alumno;
	
	public Examen(Integer nota, Calendar fecha, Catedra catedra, Alumno alumno) {
		this.nota = nota;
		this.fecha = fecha;
		this.catedra = catedra;
		this.alumno = alumno;
	}

	public Integer getNota() {
		return nota;
	}

}
