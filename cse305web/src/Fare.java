
public class Fare {
String AirlineID ;
int FlightNo;
String FareType;
String Class;
double Fare;
public Fare(String AirlineID,int FlightNo,String FareType,String Class,double Fare) {
	this.AirlineID = AirlineID;
	this.FlightNo = FlightNo;
	this.FareType = FareType;
	this.Class = Class;
	this.Fare = Fare;
}
public String getAirlineID() {
	return this.AirlineID;
}
public int getFlightNo() {
	return this.FlightNo;
}
public String getFareType() {
	return this.FareType;
}
public String getC() {
	return this.Class;
}
public double getFare() {
	return this.Fare;
}
public void setAirlineID(String s) {
	this.AirlineID = s;
}
public void getFlightNo(int i) {
this.FlightNo = i;
}
public void getFareType(String s) {
	this.FareType = s;
}
public void getC(String s) {
	this.Class = s;
}
public void getFare(double d) {
	this.Fare = d;
}
}
