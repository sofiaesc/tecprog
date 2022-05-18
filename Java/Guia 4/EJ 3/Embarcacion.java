
public abstract class Embarcacion {
	private String matricula;
	private Float eslora;
	private Short año;
	
	public Embarcacion(String matricula, Float eslora, Short año) {
		this.matricula = matricula;
		this.eslora = eslora;
		this.año = año;
	}
	
	protected abstract Float moduloEspecial();
	
	private Float moduloNormal() {
		return (10*eslora);
	}
	
	public Float calcularModulo() {
		return this.moduloNormal()+this.moduloEspecial();
	}
	
}
