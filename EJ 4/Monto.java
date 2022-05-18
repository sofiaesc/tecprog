
public class Monto {
	private Float monto;
	private Float monto_pesos;
	private Moneda moneda;
	
	public Monto(Float monto, Moneda moneda) {
		this.monto = monto;
		monto_pesos = moneda.convertirAPeso(monto);
		this.moneda = moneda;
	}
	
	public Float getMontoPesos() {
		return monto_pesos;
	}
}
