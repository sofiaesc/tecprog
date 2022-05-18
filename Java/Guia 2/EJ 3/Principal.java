import java.util.Calendar;

public class Principal {
	
	public static void main(String[] args) {
		País p1 = new País(0,"Argentina");
		Auto auto = new Auto("Volkswagen", 309, "AB 129 CD", 100000f, 90000, p1);
		
		Persona persona = new Persona("Apellido","Nombre");
		Comprador comprador = new Comprador("123456", persona);
		
		Dueño dueño = new Dueño(persona, "3424321324");
		
		
		Calendar fecha = Calendar.getInstance();
		Venta venta = new Venta(comprador, fecha);
		
		Detalle detalle = new Detalle(90000f, venta, auto);
		
		venta.addVehículo(auto);
		
		auto.addDueño(dueño);
		
		Concesionaria conces = new Concesionaria("concesionaria");
		conces.addVehículo(auto);
		conces.addVenta(venta);
		
		conces.mostrarVentasSeleccionadas();
	}

}
