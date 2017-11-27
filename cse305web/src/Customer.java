public class Customer extends Person{
    int AccountNo;
    String CreditCardNo;
    String Email;
    String CreationDate;
    int Rating;

    public Customer(int Id, String FirstName, String LastName, String Address, String City, String State, int ZipCode, String CreditCardNo, String Email, String CreationDate, int AccountNo, int Rating) {
    	super(Id, FirstName, LastName, Address, City, State, ZipCode);
        this.CreditCardNo = CreditCardNo;
        this.Email = Email;
        this.CreationDate = CreationDate;
        this.AccountNo = AccountNo;
        this.Rating = Rating;
    }
    public String getCreditCardNo() {
        return this.CreditCardNo;
    }

    public int getAccountNo() {
        return this.AccountNo;
    }
    public int getRating() {
        return this.Rating;
    }
    public String getEmail() {
        return this.Email;
    }
    public String getCreationDate() {
        return this.CreationDate;
    }

    public void setCreditCardNo(String s) {
        this.CreditCardNo = s;
    }
    public void setEmail(String s) {
        this.Email = s;
    }
    public void setCreationDate(String s) {
        this.CreationDate = s;
    }

    public void setAccountNo(int i) {
        this.AccountNo = i;
    }
    public void setRating(int i) {
        this.Rating = i;
    }
}
