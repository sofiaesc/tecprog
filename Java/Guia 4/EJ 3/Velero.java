
public class Velero extends Embarcacion {
	private Integer numMastiles;

	public Velero(String matricula, Float eslora, Short año, Integer numMastiles) {
		super(matricula, eslora, año);
		this.numMastiles = numMastiles;
	}

	protected Float moduloEspecial() {
		return (float) numMastiles;
	}
}
