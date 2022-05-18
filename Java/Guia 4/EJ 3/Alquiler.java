import java.util.Calendar;

public class Alquiler {
	private Calendar fechaInicial;
	private Calendar fechaFinal;
	private Puerto puerto;
	private Amarra amarra;
	private Embarcacion embarcacion;
	private Cliente cliente;
	
	public Alquiler(Calendar fechaInicial, Calendar fechaFinal, Puerto puerto, Amarra amarra,Embarcacion embarcacion,Cliente cliente) {
		this.fechaInicial = fechaInicial;
		this.fechaFinal = fechaFinal;
		this.puerto = puerto;
		this.amarra = amarra;
		this.embarcacion = embarcacion;
		this.cliente = cliente;
		
		amarra.addAlquiler(this);
		puerto.addAlquiler(this);
	}
	
	public Float calcularAlquiler() {
		return 0f;
	}
	
}
