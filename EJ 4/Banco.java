import java.util.Calendar;
import java.util.Vector;

public class Banco {
	private String nombre;
	private Vector<Cuenta> cuentas;

	public Banco(String nombre) {
		this.nombre = nombre;
		cuentas = new Vector<Cuenta>();
	}
	
	public void addCuenta(Cuenta c) {
		cuentas.add(c);
	}
	
	public void listarComisionesTotales(Calendar fecha_desde, Calendar fecha_hasta) {
		for(Cuenta oCuenta : cuentas) {
			oCuenta.obtenerComision(fecha_desde, fecha_hasta);
		}
	}
	
}
