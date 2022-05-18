public class Auto extends Vehículo {
	
	private País myPaís;
	
    public Auto(String marca, Integer modelo, String patente, Float precio, Integer kilometraje, País myPaís) {
		super(marca, modelo, patente, precio, kilometraje);
		this.myPaís = myPaís;
	}

  public Boolean esAuto() {
  	return true;
  }

  public Boolean esAutoNacional() {
  	return myPaís.esArgentina();
  }

  public Float getPrecio() {
	  return (super.getPrecio() + myPaís.getImpuesto());
  }
}