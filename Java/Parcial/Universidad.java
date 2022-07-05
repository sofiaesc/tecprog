import java.util.Vector;

public class Universidad {
	private String nombre;
	private Vector<ComedorDTO> cComedorDTO;
	private Vector<Facultad> cFacultad;
	private Vector<UsuarioDTO> cUsuarioDTO;
	
	public Universidad(String nombre) {
		super();
		this.nombre = nombre;
		this.cComedorDTO = new Vector<ComedorDTO>();
		this.cFacultad = new Vector<Facultad>();
		this.cUsuarioDTO = new Vector<UsuarioDTO>();
	}
	
	public void añadirUsuario(UsuarioDTO usuario) {
		cUsuarioDTO.add(usuario);
	}
	
	public void mostrarComensalesMasRol() {
		for(UsuarioDTO oUsuario : cUsuarioDTO) {
			if(oUsuario.esComensal() & oUsuario.masDeUnRol()) {
				oUsuario.mostrarComensal();
			}
		}
	}
}
