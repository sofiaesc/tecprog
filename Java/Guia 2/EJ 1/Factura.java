import java.util.Calendar;
import java.util.Vector;

public class Factura {

  private String numero;
  private Calendar fecha;
  
  private Vector<Producto> myProducto;
  private Cliente myCliente;
  private Vector<detalleFactura>  mydetalleFactura;

  public Factura(String numero, Calendar fecha, Cliente cliente) {
	this.numero = numero;
	this.fecha = fecha;
	this.myProducto = new Vector<Producto>();
	mydetalleFactura = new Vector<detalleFactura>();
}
  
  public void addDetalleFactura(detalleFactura d) {
	  mydetalleFactura.add(d);
  }
  
public Float calcularTotal() {
	  Float sum = 0f;
	  
	  for(detalleFactura oDetalle : mydetalleFactura) {
		  sum += oDetalle.calcularTotal();
	  }
	  
	  return sum;
  }
}