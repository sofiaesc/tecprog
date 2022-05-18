import java.util.Calendar;
import java.util.Vector;

public class Principal {
	
	public static void main(String[] args) {
		
		Empresa empresa = new Empresa("empresa");
		Jefe jefe = new Jefe(100000f,"Juan","Perez","Calle 123",123456);
		Categoria cat = new Categoria(30000f,"JUNIOR");
		Mensualizado mens = new Mensualizado(jefe, cat, "Jose", "Juarez", "Calle 234", 678965);
		
		Calendar cal1 = Calendar.getInstance(), cal2 = Calendar.getInstance();
		cal1.set(2020,10,23);
		cal2.set(2020,11,23);
		
		HorasJornal hora1 = new HorasJornal(1000f,1200f,cal1,cal2);
		Vector<HorasJornal> horas = new Vector<HorasJornal>();
		horas.add(hora1);
		
		Calendar cal3 = Calendar.getInstance();
		cal3.set(2020, 10,25);
		Jornalizado jornalizado = new Jornalizado(jefe, "Alejandro","Rodriguez","Calle 345",546324, horas);
		Jornada jornada = new Jornada(41,cal3);
		jornalizado.addJornadasTrabajadas(jornada);
		
		empresa.addEmpleado(jornalizado);
		empresa.addEmpleado(mens);
		empresa.addEmpleado(jefe);
		
		empresa.calcularRemuneraciones(cal3);
		System.out.println("");
		empresa.listarEmpleadosPorJefe(jefe);
	}
}
