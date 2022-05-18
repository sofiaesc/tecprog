
public class Yate extends Embarcacion {
	private Float potencia;
	private Integer numCamarotes;
	
	public Yate(String matricula, Float eslora, Short año, Float potencia, Integer numCamarotes) {
		super(matricula, eslora, año);
		this.potencia = potencia;
		this.numCamarotes = numCamarotes;
	}

	@Override
	protected Float moduloEspecial() {
		
		return (float) numCamarotes + potencia;
	}
	
	
}
