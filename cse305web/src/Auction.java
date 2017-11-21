
public class Auction {
	private int accountNo;
	private String airlineID;
	private int flightNo;
	private String rank;
	private String date;
	private double nyop;
	
	public Auction(int accountNo, String airlineID, int flightNo, String rank, String date, double nyop) {
		this.accountNo = accountNo;
		this.airlineID = airlineID;
		this.flightNo = flightNo;
		this.rank = rank;
		this.date = date;
		this.nyop = nyop;
	}
	
	public int getAccountNo(){
		return accountNo;
	}
	
	public String getAirlineID() {
		return airlineID;
	}
	
	public int getFlightNo() {
		return flightNo;
	}
	
	public String getRank(){
		return rank;
	}
	
	public String getDate() {
		return date;
	}
	
	public double getNyop(){
		return nyop;
	}
	
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	
	public void setAirlineID(String airlineID) {
		this.airlineID = airlineID;
	}
	
	public void setFlightNo(int flightNo) {
		this.flightNo = flightNo;
	}
	
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public void setNyop(double nyop) {
		this.nyop = nyop;
	}
}
