
public class Reservation {
	private int resrNo;
	private String resrDate;
	private double bookingFee;
	private double totalFare;
	private int repSSN;
	private int accountNo;
	
	public Reservation(int resrNo, String resrDate, double bookingFee, double totalFare, int repSSN, int accountNo) {
		this.resrNo = resrNo;
		this.resrDate = resrDate;
		this.bookingFee = bookingFee;
		this.totalFare = totalFare;
		this.repSSN = repSSN;
		this.accountNo = accountNo;
	}
	
	public int getResrNo() {
		return resrNo;
	}
	
	public String getResrDate() {
		return resrDate;
	}
	
	public double getBookingFee() {
		return bookingFee;
	}
	
	public double getTotalFare() {
		return totalFare;
	}
	
	public int getRepSSN() {
		return repSSN;
	}
	
	public int getAccountNo() {
		return accountNo;
	}
	
	public void setResrNo(int resrNo) {
		this.resrNo = resrNo;
	}
	
	public void setResrDate(String resrDate) {
		this.resrDate = resrDate;
	}
	
	public void setBookingFee(double bookingFee) {
		this.bookingFee = bookingFee;
	}
	
	public void setTotalFare(double totalFare) {
		this.totalFare = totalFare;
	}
	
	public void setRepSSN(int repSSN) {
		this.repSSN = repSSN;
	}
	
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
}
