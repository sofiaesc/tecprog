import java.util.Vector;

public class Concesionaria {

	private String nombre;
  private Vector<Vehículo> myVehículo;
  private Vector<Venta> myVenta;
  
  public Concesionaria(String nombre) {
	this.nombre = nombre;
	this.myVehículo = new Vector<Vehículo>();
	this.myVenta = new Vector<Venta>();
  }


  public void addVehículo(Vehículo v) {
	myVehículo.add(v);
  }

  public void addVenta(Venta v) {
	myVenta.add(v);
  }
  
  public void mostrarVentasSeleccionadas() {
	  for(Venta oVenta : myVenta) {
		  oVenta.mostrarSeleccionados();
	  }
  }
}