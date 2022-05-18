import java.util.Vector;

public class Cliente {

  private String razonSocial;
  private String cuit;
  private IVA iva;
  
  public Cliente(String razonSocial, String cuit, IVA iva) {
	this.razonSocial = razonSocial;
	this.cuit = cuit;
	this.iva = iva;
  } 
}