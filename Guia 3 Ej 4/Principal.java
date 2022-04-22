import java.util.Calendar;

public class Principal {
	public static void main(String[] args) {
		Moneda moneda = new Moneda("peso",1f);
		Banco banco = new Banco("banco");
		Titular t1 = new Titular("nombre");
		Cuenta c1 = new Cuenta(1234, t1);
		Calendar fecha = Calendar.getInstance();
		Monto monto = new Monto(1200f, moneda);
		Monto monto2 = new Monto(1400f, moneda);
		Deposito d1 = new Deposito(fecha, monto);
		Extraccion e1 = new Extraccion(fecha, monto2);
		c1.addTransaccion(e1);
		c1.addTransaccion(d1);
		banco.addCuenta(c1);
		
		Calendar f1 = Calendar.getInstance();
		Calendar f2 = Calendar.getInstance();
		f1.set(2022, 0, 1);
		f2.set(2022, 8, 1);
		banco.listarComisionesTotales(f1,f2);
	}
}
