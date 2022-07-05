
public class RolAdminDTO extends RolUsuarioDTO {
	private String clave;

	public RolAdminDTO(UsuarioDTO usuario, String clave) {
		super(usuario);
		this.clave = clave;
	}
	
	public void mostrar() {
	}
}
