import java.util.Calendar;

public class HorasJornal {

	private Float menor40;
	private Float mayor40;
	private Calendar fechasDesde;
	private Calendar fechasHasta;
	
	public HorasJornal(Float menor40, Float mayor40, Calendar fechasDesde, Calendar fechasHasta) {
		this.menor40 = menor40;
		this.mayor40 = mayor40;
		this.fechasDesde = fechasDesde;
		this.fechasHasta = fechasHasta;
	}

	public boolean pertenecePeriodo(Calendar periodo) {
		
		if(periodo.after(fechasDesde) && periodo.before(fechasHasta)) {
			return true;
		} else {
			return false;
		}
	}

	public Float calcularSueldo(Integer horasTrabajadas) {
		Float sueldo = 0f;
		if(horasTrabajadas>40) {
			sueldo += 40*menor40;
			sueldo += mayor40*(horasTrabajadas-40);
		} else {
			sueldo += horasTrabajadas*menor40;
		}
		
		return sueldo;
	}

}