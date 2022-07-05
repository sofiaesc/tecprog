import java.util.Calendar;
import java.util.Vector;

public class Cupon {
	private String identificador;
	private Calendar fechaCompra;
	private Entrega entrega;
	
	public Cupon(String identificador, Calendar fechaCompra) {
		this.identificador = identificador;
		this.fechaCompra = fechaCompra;
	}

	public void añadirEntrega(Entrega entrega2) {
		this.entrega = entrega2;
	}
	
	// verifica si el cupon tiene entrega o no para calcular el saldo despues
	public Boolean noFueEntregado() {
		Boolean flag = false;
		if(entrega == null) {
			flag = true;
		}
		return flag;
	}
}
