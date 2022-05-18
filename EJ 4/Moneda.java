
public class Moneda {
	
	private String descripcion;
	private Float cotizacion;
	
	public Moneda(String descripcion, Float cotizacion) {
		this.descripcion = descripcion;
		this.cotizacion = cotizacion;
	}

	public Float convertirAPeso(Float monto) {
		return cotizacion*monto;
	}

}
