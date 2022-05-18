public class Auto extends Veh�culo {
	
	private Pa�s myPa�s;
	
    public Auto(String marca, Integer modelo, String patente, Float precio, Integer kilometraje, Pa�s myPa�s) {
		super(marca, modelo, patente, precio, kilometraje);
		this.myPa�s = myPa�s;
	}

  public Boolean esAuto() {
  	return true;
  }

  public Boolean esAutoNacional() {
  	return myPa�s.esArgentina();
  }

  public Float getPrecio() {
	  return (super.getPrecio() + myPa�s.getImpuesto());
  }
}