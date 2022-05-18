import java.util.Calendar;

public class Principal {
	public static void main(String[] args) {
		Universidad u = new Universidad("UNL");
		Catedra c = new Catedra("matemática");
		Persona p = new Persona("agustín");
		Calendar fecha = Calendar.getInstance();
		Persona p2 = new Persona("pablo");
		Alumno a = new Alumno(fecha,p);
		Docente doc = new Docente(p2);
		Comision com = new Comision(fecha, "comision 1", doc);
		com.addAlumno(a);
		c.addComision(com);
		u.listarAlumno(c);
	}
}
