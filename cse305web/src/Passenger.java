
public class Passenger extends Person{
	private int accountNo;
	
	public Passenger(int Id, String FirstName, String LastName, String Address, String City, String State, int ZipCode, int accountNo) {
		super(Id, FirstName, LastName, Address, City, State, ZipCode);
		this.accountNo = accountNo;
	}
	
	public int getAccountNo() {
		return accountNo;
	}
	
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
}
