public class Detalle {

  private Float precio;
  private Venta venta;
  private Vehículo vehículo;
  
  public Detalle(Float precio, Venta venta, Vehículo vehículo) {
	this.precio = vehículo.getPrecio();
	this.venta = venta;
	this.vehículo = vehículo;
	
	venta.addDetalle(this);
	vehículo.addDetalle(this);
}

public Float getPrecio() {
	  return precio;
  }

public String getVehículo() {
	return vehículo.mostrar();
}
}