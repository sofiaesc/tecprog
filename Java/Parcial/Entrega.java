import java.util.Calendar;

public class Entrega {
	private Calendar fecha;
	private RolVentanillaDTO rolVentanillaDTO;
	private Cupon cupon;
	private ComedorDTO comedorDTO;
	public Entrega(Calendar fecha, RolVentanillaDTO rolVentanillaDTO, Cupon cupon, ComedorDTO comedorDTO) {
		super();
		this.fecha = fecha;
		this.rolVentanillaDTO = rolVentanillaDTO;
		this.cupon = cupon;
		this.comedorDTO = comedorDTO;
		
		comedorDTO.añadirEntrega(this);
		cupon.añadirEntrega(this);
	}
	
	
}
