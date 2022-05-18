
public class detalleFactura {

	private Integer unidades;
	private Float precioUnitario;
	private Producto myProducto;
	private Factura factura;
	
	public detalleFactura(Integer unidades, Producto myProducto, Factura factura) {
		this.unidades = unidades;
		this.precioUnitario = myProducto.calcularPrecio();
		this.myProducto = myProducto;
		this.factura = factura;
		
		factura.addDetalleFactura(this);
	}

	public Float calcularTotal() {
		
		return unidades*precioUnitario;
	}
}