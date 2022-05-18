import java.util.Vector;

public class Concesionaria {

	private String nombre;
  private Vector<Veh�culo> myVeh�culo;
  private Vector<Venta> myVenta;
  
  public Concesionaria(String nombre) {
	this.nombre = nombre;
	this.myVeh�culo = new Vector<Veh�culo>();
	this.myVenta = new Vector<Venta>();
  }


  public void addVeh�culo(Veh�culo v) {
	myVeh�culo.add(v);
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