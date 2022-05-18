public class Persona {

  private String apellido;
  private String nombre;

  public Persona(String apellido, String nombre) {
	  this.apellido = apellido;
	  this.nombre = nombre;
  }
  
  public String toString() {
	  return nombre + " " + apellido;
  }
  
}