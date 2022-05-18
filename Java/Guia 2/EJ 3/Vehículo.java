import java.util.Vector;

public class Veh�culo {
	private String marca;
	private Integer modelo;
	private String patente;
	private Float precio;
	private Integer kilometraje;
	private Due�o myDue�o;
	private Venta myVenta;
	private Vector<Detalle> myDetalle;
	
	public Veh�culo(String marca, Integer modelo, String patente, Float precio, Integer kilometraje) {
		this.marca = marca;
		this.modelo = modelo;
		this.patente = patente;
		this.precio = precio;
		this.kilometraje = kilometraje;
		
		myDetalle = new Vector<Detalle>();
	}
	
	public void addDue�o(Due�o d) {
		myDue�o = d;
	}
	
	public void addVenta(Venta v) {
		myVenta = v;
	}
	
	public void addDetalle(Detalle d) {
		myDetalle.add(d);
	}

	public Boolean esAuto() {
		return false;
	}
	
	public Boolean tieneDue�o() {
		if(myDue�o == null) return false;
		return true;
	}
	
	public Boolean esAutoNacional() {
		return false;
	}

	public Float getPrecio() {
		return precio;
	}

	public String mostrar() {
		return(marca + " - Modelo "+modelo+" - Patente "+patente+" - Kilometraje: "+kilometraje);
	}
	
}
