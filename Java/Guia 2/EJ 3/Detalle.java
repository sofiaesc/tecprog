public class Detalle {

  private Float precio;
  private Venta venta;
  private Veh�culo veh�culo;
  
  public Detalle(Float precio, Venta venta, Veh�culo veh�culo) {
	this.precio = veh�culo.getPrecio();
	this.venta = venta;
	this.veh�culo = veh�culo;
	
	venta.addDetalle(this);
	veh�culo.addDetalle(this);
}

public Float getPrecio() {
	  return precio;
  }

public String getVeh�culo() {
	return veh�culo.mostrar();
}
}