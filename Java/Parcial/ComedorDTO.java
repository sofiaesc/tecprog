import java.util.Vector;

public class ComedorDTO {
	private String descripcion;
	private String domicilio;
	private Vector<Entrega> cEntrega;
	public ComedorDTO(String descripcion, String domicilio) {
		this.descripcion = descripcion;
		this.domicilio = domicilio;
		this.cEntrega = new Vector<Entrega>();
	}
	
	public void añadirEntrega(Entrega entrega){
		cEntrega.add(entrega);
	}
	
}
