public class Detalle {

  private Float precio;
  private Venta venta;
  private VehÝculo vehÝculo;
  
  public Detalle(Float precio, Venta venta, VehÝculo vehÝculo) {
	this.precio = vehÝculo.getPrecio();
	this.venta = venta;
	this.vehÝculo = vehÝculo;
	
	venta.addDetalle(this);
	vehÝculo.addDetalle(this);
}

public Float getPrecio() {
	  return precio;
  }

public String getVehÝculo() {
	return vehÝculo.mostrar();
}
}