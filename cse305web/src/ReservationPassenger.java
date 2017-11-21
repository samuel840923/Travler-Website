
public class ReservationPassenger {
	private int resrNo;
	private int id;
	private int accountNo;
	private String seatNumber;
	private String rank; //class
	private String meal;
	
	public ReservationPassenger(int resrNo, int id, int accountNo, String seatNumber, String rank, String meal) {
		this.resrNo = resrNo;
		this.id = id;
		this.accountNo = accountNo;
		this.seatNumber = seatNumber;
		this.rank = rank;
		this.meal = meal;
	}
	
	public int getResrNo() {
		return resrNo;
	}
	
	public int getId() {
		return id;
	}
	
	public int getAccountNo() {
		return accountNo;
	}
	
	public String getSeatNumber() {
		return seatNumber;
	}
	
	public String getRank() {
		return rank;
	}
	
	public String getMeal() {
		return meal;
	}
	
	public void setResrNo(int resrNo) {
		this.resrNo = resrNo;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	
	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}
	
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	public void setMeal(String meal) {
		this.meal = meal;
	}
}
