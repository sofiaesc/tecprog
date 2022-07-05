import java.util.Vector;

public class UsuarioDTO {
	private Vector<RolUsuarioDTO> cRolUsuario;
	private String usuario;
	private String apellido;
	private String nombre;
	private String correo;
	
	public UsuarioDTO(String usuario, String apellido, String nombre, String correo) {
		super();
		this.cRolUsuario = new Vector<RolUsuarioDTO>();
		this.usuario = usuario;
		this.apellido = apellido;
		this.nombre = nombre;
		this.correo = correo;
	}
	
	public void añadirRol(RolUsuarioDTO rol) {
		cRolUsuario.add(rol);
	}
	
	// metodos booleanos:
	public Boolean masDeUnRol() {
		Boolean flag = false;
		if(cRolUsuario.size() > 1) {
			flag = true;
		}
		return flag;
	}
	
	public Boolean esComensal() {
		Boolean flag = false;
		for(RolUsuarioDTO oRol : cRolUsuario) {
			if(oRol.esComensal()) {
				flag = true;
			}
		}
		return flag;
	}
	
	// metodo general para mostrar la info del usuario
	public void mostrar() {
		System.out.print(apellido + ", "+nombre);
	}
	
	// metodo especifico que muestra la informacion general y la del comensal
	public void mostrarComensal() {
		this.mostrar();
		for(RolUsuarioDTO oRol : cRolUsuario) {
			if(oRol.esComensal()) {
				oRol.mostrar();
			}
		}
	}
}
