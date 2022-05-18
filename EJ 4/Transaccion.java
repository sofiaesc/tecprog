import java.util.Calendar;

public class Transaccion {
	private Calendar fecha;

	public Transaccion(Calendar fecha) {
		this.fecha = fecha;
	}

	public Boolean perteneceAPeriodo(Calendar fecha_desde, Calendar fecha_hasta) {
		if(fecha.after(fecha_desde) & fecha.before(fecha_hasta)) return true;
		return false;
	}
	
	public Float getMontoPesos() {
		return 0f;
	}
}
