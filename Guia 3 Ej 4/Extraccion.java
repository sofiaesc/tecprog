import java.util.Calendar;

public class Extraccion extends Transaccion {

	private Monto monto;
	
	public Extraccion(Calendar fecha, Monto monto) {
		super(fecha);
		this.monto = monto;
	}
	
	public Float getMontoPesos() {
		return (-1)*monto.getMontoPesos();
	}

}
