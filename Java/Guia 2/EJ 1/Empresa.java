import java.util.Vector;

public class Empresa {

	private String nombreEmpresa;
	private IVA myIVA;

	private Vector<Factura> myFacturas;
	private Vector<Producto> myProductos;
	private Vector<Cliente> myClientes;
	
	public Empresa(String nombreEmpresa, IVA myIVA) {
		this.nombreEmpresa = nombreEmpresa;
		this.myIVA = myIVA;
		
		this.myFacturas = new Vector<Factura>();
		this.myProductos = new Vector<Producto>();
		this.myClientes = new Vector<Cliente>();
	}
	
	public void addFactura(Factura f) {
		myFacturas.add(f);
	}

	public void calcularTotalFacturas() {
		Float totalFacturacion = 0f;
		for(Factura oFactura : myFacturas) {
			totalFacturacion += oFactura.calcularTotal();
		}
		System.out.println("TOTAL FACTURADO: "+totalFacturacion);
	}

}