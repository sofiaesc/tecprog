
public class RolVentanillaDTO extends RolUsuarioDTO {
	private String clave;
	private ComedorDTO comedorDTO;
	
	public RolVentanillaDTO(UsuarioDTO usuario, String clave, ComedorDTO comedorDTO) {
		super(usuario);
		this.clave = clave;
		this.comedorDTO = comedorDTO;
	}
	
	public void mostrar() {
	}
}
