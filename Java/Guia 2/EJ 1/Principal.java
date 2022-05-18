import java.util.Calendar;

public class Principal {

	public static void main(String[] args) {
		IVA iva_ej = new IVA("Monotributo");
		Empresa e = new Empresa("Mayorista S.A.",iva_ej);
		
		Calendar c = Calendar.getInstance();
		Cliente cliente_ej = new Cliente("R.I.","30-12345678-1",iva_ej);
		Factura fact_ej = new Factura("0001 0100",c, cliente_ej);
		
		Producto prod_ej = new Producto("Porcelanato",6f);
		Producto prod_ej2 = new Producto("Grifería",400f);
		
		detalleFactura det_1 = new detalleFactura(100,prod_ej,fact_ej);
		detalleFactura det_2 = new detalleFactura(1,prod_ej2,fact_ej);
		
		e.addFactura(fact_ej);
		e.calcularTotalFacturas();
	}
}
