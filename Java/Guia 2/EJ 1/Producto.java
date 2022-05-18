import java.util.Vector;

public class Producto {

	private String nombre;
	private Float precio;
	private Vector<Factura> myFactura;
	
	public Producto(String nombre, Float precio) {
		this.nombre = nombre;
		this.precio = precio;
	}

	public Float calcularPrecio() {
		return precio;
	}

}