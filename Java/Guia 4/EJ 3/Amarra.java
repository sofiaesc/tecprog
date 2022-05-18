import java.util.Vector;

public class Amarra {
	private Short posicion;
	private Vector<Alquiler> alquileres;
	public Amarra(Short posicion) {
		
		this.posicion = posicion;
		alquileres = new Vector<Alquiler>();
	}
	
	public void addAlquiler(Alquiler a) {
		alquileres.add(a);
	}
}
