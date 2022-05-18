import java.util.Vector;

public class Vehículo {
	private String marca;
	private Integer modelo;
	private String patente;
	private Float precio;
	private Integer kilometraje;
	private Dueño myDueño;
	private Venta myVenta;
	private Vector<Detalle> myDetalle;
	
	public Vehículo(String marca, Integer modelo, String patente, Float precio, Integer kilometraje) {
		this.marca = marca;
		this.modelo = modelo;
		this.patente = patente;
		this.precio = precio;
		this.kilometraje = kilometraje;
		
		myDetalle = new Vector<Detalle>();
	}
	
	public void addDueño(Dueño d) {
		myDueño = d;
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
	
	public Boolean tieneDueño() {
		if(myDueño == null) return false;
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
