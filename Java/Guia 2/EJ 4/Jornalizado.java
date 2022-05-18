import java.util.Calendar;
import java.util.Iterator;
import java.util.Vector;

public class Jornalizado extends Trabajador implements Empleado {

	private Vector<Jornada> jornadasTrabajadas;
	private Vector<HorasJornal> preciosHora;
	private Jefe myJefe;

	public Float calcularSueldo(Calendar periodo) {
		Float sueldo = 0f;
		Integer horasTrabajadas = 0;
		
		for(Jornada oJornada : jornadasTrabajadas) {
			if(oJornada.pertenecePeriodo(periodo)){
				horasTrabajadas += oJornada.mostrarHoras();
			}
		}
		
		Boolean noEncontre = true;
		Iterator<HorasJornal> iPreciosHora = preciosHora.iterator();
		while(iPreciosHora.hasNext() && noEncontre) {
			HorasJornal oHora = iPreciosHora.next();
			if(oHora.pertenecePeriodo(periodo)) {
				sueldo = oHora.calcularSueldo(horasTrabajadas);
				noEncontre = false;
			}
		}
		
		return sueldo;
	}

	public Jornalizado(Jefe myJefe, String nombre, String apellido, String direccion, Integer dni, Vector<HorasJornal> preciosHora) {
		super(nombre, apellido, direccion, dni);
		this.jornadasTrabajadas = new Vector<Jornada>();
		this.preciosHora = preciosHora;
		this.myJefe = myJefe;
		
		myJefe.addEmpleado(this);
	}
	
	public void addPreciosHora(HorasJornal horas) {
		preciosHora.add(horas);
	}
	
	public void addJornadasTrabajadas(Jornada jornada) {
		jornadasTrabajadas.add(jornada);
	}
	
	public String mostrar() {
		return "JORNALIZADO: " + super.mostrar();
	}
	
}