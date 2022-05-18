import java.util.Calendar;
import java.util.Vector;

public class Venta {

	private Vector<Veh�culo> myVeh�culo;
	private Vector<Detalle> detalle;
	private Comprador myComprador;
	private Calendar fecha;
	
	public Venta(Comprador myComprador, Calendar fecha) {
		this.myVeh�culo = new Vector<Veh�culo>();
		this.detalle = new Vector<Detalle>();
		this.myComprador = myComprador;
		this.fecha = fecha;
	}

	public Boolean esVentaAuto() {
		for(Veh�culo oVeh�culo : myVeh�culo) {
			if(oVeh�culo.esAuto()) return true;
		}
		return false;
	}
	
	public Boolean esVentaAutoNacional() {
		for(Veh�culo oVeh�culo : myVeh�culo) {
			if(oVeh�culo.esAutoNacional()) return true;
		}
		return false;
	}
	
	public Boolean tieneDue�o() {
		for(Veh�culo oVeh�culo : myVeh�culo) {
			if(oVeh�culo.tieneDue�o()) return true;
		}
		return false;
	}
	
	public void addVeh�culo(Veh�culo v) {
		myVeh�culo.add(v);
	}
	
	public void addDetalle(Detalle d) {
		detalle.add(d);
	}

	public void mostrarSeleccionados() {
		if(this.esVentaAuto() && this.esVentaAutoNacional() && this.tieneDue�o()) {
			  
			Float sum = 0f;
			  for(Detalle oDetalle : detalle) {
				 sum += oDetalle.getPrecio();
			  }
			System.out.print("Monto de la venta: ");
			System.out.println(sum);
			
			System.out.println("Producto vendido: ");
			for(Detalle oDetalle : detalle) {
				 System.out.println(oDetalle.getVeh�culo());
			  }
			
			System.out.print("Comprador: ");
			myComprador.mostrar();
			System.out.println("Fecha: "+fecha.get(Calendar.DAY_OF_MONTH)+"/"+fecha.get(Calendar.MONTH)+"/"+fecha.get(Calendar.YEAR));
			  
		  }
	}
}