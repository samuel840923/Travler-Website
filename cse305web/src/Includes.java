
public class Includes {
	private int resrNo;
	private String airlineID;
	private int flightNo;
	private int legNo;
	private String date;
	
	public Includes(int resrNo, String airlineID, int flightNo, int legNo, String date) {
		this.resrNo = resrNo;
		this.airlineID = airlineID;
		this.flightNo = flightNo;
		this.legNo = legNo;
		this.date = date;
	}
	
	public int getResrNo() {
		return resrNo;
	}
	
	public String getAirlineID() {
		return airlineID;
	}
	
	public int getFlightNo() {
		return flightNo;
	}
	
	public int getLegNo() {
		return legNo;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setResrNo(int resrNo) {
		this.resrNo = resrNo;
	}
	
	public void setAirlineID(String airlineID) {
		this.airlineID = airlineID;
	}
	
	public void setFlightNo(int flightNo) {
		this.flightNo = flightNo;
	}
	
	public void setLegNo(int legNo) {
		this.legNo = legNo;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
}
