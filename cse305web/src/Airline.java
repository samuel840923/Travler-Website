

public class Airline {
	String id;
	String Name;
	public Airline(String id,String Name) {
		this.id = id;
		this.Name = Name;
	}
	public String getid() {
		return this.id;
	}
	public String getName() {
		return this.Name;
	}
	public void settid(String i ) {
		this.id = i;
	}
	public void setName(String s) {
		this.Name = s;
	}
}
