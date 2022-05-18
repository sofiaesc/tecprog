import java.util.Calendar;
import java.util.Vector;

public class Venta {

	private Vector<Vehículo> myVehículo;
	private Vector<Detalle> detalle;
	private Comprador myComprador;
	private Calendar fecha;
	
	public Venta(Comprador myComprador, Calendar fecha) {
		this.myVehículo = new Vector<Vehículo>();
		this.detalle = new Vector<Detalle>();
		this.myComprador = myComprador;
		this.fecha = fecha;
	}

	public Boolean esVentaAuto() {
		for(Vehículo oVehículo : myVehículo) {
			if(oVehículo.esAuto()) return true;
		}
		return false;
	}
	
	public Boolean esVentaAutoNacional() {
		for(Vehículo oVehículo : myVehículo) {
			if(oVehículo.esAutoNacional()) return true;
		}
		return false;
	}
	
	public Boolean tieneDueño() {
		for(Vehículo oVehículo : myVehículo) {
			if(oVehículo.tieneDueño()) return true;
		}
		return false;
	}
	
	public void addVehículo(Vehículo v) {
		myVehículo.add(v);
	}
	
	public void addDetalle(Detalle d) {
		detalle.add(d);
	}

	public void mostrarSeleccionados() {
		if(this.esVentaAuto() && this.esVentaAutoNacional() && this.tieneDueño()) {
			  
			Float sum = 0f;
			  for(Detalle oDetalle : detalle) {
				 sum += oDetalle.getPrecio();
			  }
			System.out.print("Monto de la venta: ");
			System.out.println(sum);
			
			System.out.println("Producto vendido: ");
			for(Detalle oDetalle : detalle) {
				 System.out.println(oDetalle.getVehículo());
			  }
			
			System.out.print("Comprador: ");
			myComprador.mostrar();
			System.out.println("Fecha: "+fecha.get(Calendar.DAY_OF_MONTH)+"/"+fecha.get(Calendar.MONTH)+"/"+fecha.get(Calendar.YEAR));
			  
		  }
	}
}