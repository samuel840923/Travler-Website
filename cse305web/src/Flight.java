
public class Flight {
	String AirlineID;
	int FlightNo;
	int NoOfSeats;
	String DaysOperating;
	int MinStay;
	int MaxStay;
	
	public Flight(String AirlineID,int FlightNo,int NoOfSeats,String DaysOperating,int MinStay, int MaxStay) {
		this.AirlineID = AirlineID;
		this.FlightNo = FlightNo;
		this.NoOfSeats = NoOfSeats;
		this.MinStay = MinStay;
		this.MaxStay = MaxStay;
	}
	public String getAirlineID() {
		return this.AirlineID;
	}
	public int getFlightNo() {
		return this.FlightNo;
	}
	public String getDaysop() {
		return this.DaysOperating;
	}
	public int getNumSeat() {
		return this.NoOfSeats;
	}
	public int getMinC() {
		return this.MinStay;
	}
	public int getMax() {
		return this.MaxStay;
	}
	public void setAirlineID(String s) {
		this.AirlineID = s;
	}
	public void getFlightNo(int i) {
		 this.FlightNo = i;
	}
	public void getDaysop(String s) {
		this.DaysOperating = s;
	}
	public void getNumSeat(int i) {
		this.NoOfSeats = i;
	}
	public void getMinC(int i) {
		this.MinStay = i;
	}
	public void getMax(int i) {
		 this.MaxStay = i;
	}
}
