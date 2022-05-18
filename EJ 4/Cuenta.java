import java.util.Calendar;
import java.util.Vector;

public class Cuenta {
	private Integer numero;
	private Vector<Transaccion> transacciones;
	private Titular titular;
	
	public Cuenta(Integer numero, Titular titular) {
		this.numero = numero;
		transacciones = new Vector<Transaccion>();
		this.titular = titular;
	}
	
	public void addTransaccion(Transaccion t) {
		transacciones.add(t);
	}
	
	public void obtenerComision(Calendar fecha_desde, Calendar fecha_hasta) {
	
		Integer a = this.cantidadTransacciones(fecha_desde, fecha_hasta);
		
		if(a != 0) {
			Float b = this.sumatoriaTransacciones(fecha_desde, fecha_hasta);
			Float comision = (float) (30-(b/a)*0.05f);
			
			System.out.println("Cuenta n° "+numero+" - Comision: "+comision);
		} else {
			System.out.println("Cuenta n° "+numero+" - Comision: 0.0");
		}
	}
	
	public Integer cantidadTransacciones(Calendar fecha_desde, Calendar fecha_hasta) {
		Integer cantidad = 0;
		
		for(Transaccion oTransaccion : transacciones) {
			if(oTransaccion.perteneceAPeriodo(fecha_desde, fecha_hasta)) {
				cantidad += 1;
			}
		}
		
		return cantidad;
	}
	
	public Float sumatoriaTransacciones(Calendar fecha_desde, Calendar fecha_hasta) {
		Float sum = 0f;
		
		for(Transaccion oTransaccion : transacciones) {
			if(oTransaccion.perteneceAPeriodo(fecha_desde, fecha_hasta)) {
				sum += oTransaccion.getMontoPesos();
			}
		}
		
		return sum;
	}
}
