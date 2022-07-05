
// no se muestra abstracta en el UML, pero es regla del buen diseño
// que la clase padre sea abstracta asi que lo implemento en codigo.
public abstract class RolUsuarioDTO {
	private UsuarioDTO usuario;

	public RolUsuarioDTO(UsuarioDTO usuario) {
		super();
		this.usuario = usuario;
		
		// añade a la coleccion de roles de usuario al construirse.
		usuario.añadirRol(this);
	}

	public boolean esComensal() {
		return false;
	}
	
	public abstract void mostrar();

}
