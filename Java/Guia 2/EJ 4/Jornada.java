import java.util.Calendar;

public class Jornada {

	private Integer horas;
	private Calendar fecha;

	public Jornada(Integer horas, Calendar fecha) {
		this.horas = horas;
		this.fecha = fecha;
	}

	public boolean pertenecePeriodo(Calendar periodo) {
		
		if(fecha.get(Calendar.MONTH) == periodo.get(Calendar.MONTH) && fecha.get(Calendar.YEAR) == periodo.get(Calendar.YEAR)) {
			return true;
		} else {
			return false;
		}
	}

	public Integer mostrarHoras() {
		return horas;
	}
	
}