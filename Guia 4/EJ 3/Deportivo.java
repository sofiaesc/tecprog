
public class Deportivo extends Embarcacion {
	private Float potencia;

	public Deportivo(Float potencia,String matricula, Float eslora, Short año) {
		super(matricula, eslora, año);
		this.potencia = potencia;
	}

	
	protected Float moduloEspecial() {
		
		return potencia;
	}
	
	
}
