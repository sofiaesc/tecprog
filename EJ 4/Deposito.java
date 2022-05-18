import java.util.Calendar;

public class Deposito extends Transaccion {

	private Monto monto;
	
	public Deposito(Calendar fecha, Monto monto) {
		super(fecha);
		this.monto = monto;
	}
	
	public Float getMontoPesos() {
		return monto.getMontoPesos();
	}

}
