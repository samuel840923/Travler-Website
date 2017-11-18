
public class Airport {
String id;
String Name;
String city;
String country;

public Airport(String i, String n, String c, String co) {
	this.id = i;
	this.Name = n;
	this.city = c;
	this.country = co;
}
public String getID() {
	return this.id;
}
public String getName() {
	return this.Name;
}
public String getCity() {
	return this.city;
}
public String getCountry() {
	return this.country;
}
public void setID(String s) {
	 this.id = s;
}
public void setName(String s) {
	 this.Name= s;
}
public void setCity(String s) {
	this.city = s;
}
public void setCountry(String s) {
	this.country = s;
}
}
