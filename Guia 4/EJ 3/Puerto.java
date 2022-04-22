import java.util.Vector;

public class Puerto {
	private String nombre;
	private Vector<Amarra> amarras;
	private Vector<Alquiler> alquileres;
	public Puerto(String nombre) {
		this.nombre = nombre;
		this.amarras = new Vector<Amarra>();
		this.alquileres = new Vector<Alquiler>();
	}
	public void addAlquiler(Alquiler alquiler) {
		alquileres.add(alquiler);
	}
	public void addAmarra(Amarra amarra) {
		amarras.add(amarra);
	}
	
}
