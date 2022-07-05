import java.util.Calendar;
import java.util.Vector;

public class RolComensalDTO extends RolUsuarioDTO {
	private Calendar ultimoAcceso;
	private String tokenSesion;
	private Facultad facultad;
	private Vector<Cupon> cupones;
	
	public RolComensalDTO(UsuarioDTO usuario, Calendar ultimoAcceso, String tokenSesion, Facultad facultad) {
		super(usuario);
		this.ultimoAcceso = ultimoAcceso;
		this.tokenSesion = tokenSesion;
		this.facultad = facultad;
		this.cupones = new Vector<Cupon>();
		
		
	}
	
	public void añadirCupon(Cupon cupon) {
		cupones.add(cupon);
	}
	// sobreescribo el método de la clase padre para que devuelva verdadero
	public boolean esComensal() {
		return true;
	}
	
	private Integer calcularSaldo() {
		Integer sumaSaldo = 0;
		
		for(Cupon oCupon : cupones) {
			if(oCupon.noFueEntregado()) sumaSaldo += 1;
		}
		return sumaSaldo;
	}
	
	public void mostrar() {
		facultad.mostrar();
		System.out.println(" - Saldo: "+this.calcularSaldo());
	}
}
