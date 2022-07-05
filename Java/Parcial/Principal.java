import java.util.Calendar;

public class Principal {
	public static void main(String[] args) {
		
		Universidad uni = new Universidad("UNL");
		Facultad facu = new Facultad("FICH");
		
		// usuario con 2 roles, incluido comensal
		UsuarioDTO usu = new UsuarioDTO("username","Escudero","Alejandro","alejgmail");
		uni.añadirUsuario(usu);
		RolAdminDTO rolA = new RolAdminDTO(usu, "001");
		RolComensalDTO rolC = new RolComensalDTO(usu, Calendar.getInstance(),"1021", facu);
		Cupon c1 = new Cupon("cupon1",Calendar.getInstance());
		Cupon c2 = new Cupon("cupon2",Calendar.getInstance());
		rolC.añadirCupon(c1);
		rolC.añadirCupon(c2);
		
		// usuario con comensal pero 1 solo rol
		UsuarioDTO usu2 = new UsuarioDTO("username2","Rossi","Laura","rossigmail");
		uni.añadirUsuario(usu2);
		RolComensalDTO rolC2 = new RolComensalDTO(usu2,Calendar.getInstance(),"1022",facu);
		rolC2.añadirCupon(c2);
		
		// usuario con 2 roles pero sin comensal
		UsuarioDTO usu3 = new UsuarioDTO("username3","Escudero","Nicolas","nicogmail");
		uni.añadirUsuario(usu3);
		RolAdminDTO rolA2 = new RolAdminDTO(usu3, "002");
		ComedorDTO comedor = new ComedorDTO("comedor 1", "saavedra 4000");
		RolVentanillaDTO rolV2 = new RolVentanillaDTO(usu3, "abcd", comedor);
		
		uni.mostrarComensalesMasRol();
	}
}
