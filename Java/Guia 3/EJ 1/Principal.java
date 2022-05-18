import java.util.Calendar;

public class Principal {
	
	public static void main(String[] args) {
		Carrera carr = new Carrera("carrera");
		Calendar fecha = Calendar.getInstance();
		Alumno a = new Alumno("nombre",fecha,fecha,carr);
		Catedra c = new Catedra("catedra");
		Examen e = new Examen(8, fecha, c, a);
		Examen e2 = new Examen(9, fecha, c, a);
		a.addExamen(e);
		a.addExamen(e2);
		
		carr.listar_egresados();
	}
}
