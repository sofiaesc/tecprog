import java.util.Calendar;

public class Examen {
	private Integer nota;
	private Calendar fecha;
	private Catedra catedra;
	private Alumno alumno;
	private TipoExamen tipo;
	
	public Examen(Integer nota, Calendar fecha, Catedra catedra, Alumno alumno, TipoExamen tipo) {
		this.nota = nota;
		this.fecha = fecha;
		this.catedra = catedra;
		this.alumno = alumno;
		this.tipo = tipo;
		
		alumno.addExamen(this);
		catedra.addExamen(this);
	}

	public Integer getNota() {
		return nota;
	}

}
