
public class AdvPurchaseDiscount {
	String AirlineID;
	int Days;
	double DiscountRate;
	public AdvPurchaseDiscount(String AirlineID,int Days,double DiscountRate) {
		this.AirlineID = AirlineID;
		this.Days = Days;
		this.DiscountRate = DiscountRate;
	}
	public String getAirlineID() {
		return this.AirlineID;
	}
	public int getDays() {
		return this.Days;
	}
	public double getDiscountRate() {
		return this.DiscountRate;
	}
	public void setAirlineID(String s) {
		this.AirlineID = s;
	}
	public void setDays(int d) {
		this.Days = d;
	}
	public void setDiscountRate(double rate) {
		this.DiscountRate = rate;
	}
}
