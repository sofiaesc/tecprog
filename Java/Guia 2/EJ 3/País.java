public class Pa�s {

  private Integer impuesto;

  private String nombre;
  
  public Pa�s(Integer impuesto, String nombre) {
	this.impuesto = impuesto;
	this.nombre = nombre;
}

public Boolean esArgentina() {
	  if(nombre == "Argentina") return true;
	  return false;
  }
  
  public Integer getImpuesto() {
	  return impuesto;
  }

}