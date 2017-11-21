public class Person{
    int Id;
    int AccountNo;
    String CreditCardNo;
    String Email;
    String CreationDate;
    int Rating;

    public Fare(int Id, String CreditCardNo, String Email, String CreationDate, int AccountNo, int Rating) {
        this.Id = Id;
        this.CreditCardNo = CreditCardNo;
        this.Email = Email;
        this.CreationDate = CreationDate;
        this.AccountNo = AccountNo;
        this.Rating = Rating;
    }
    public String getCreditCardNo() {
        return this.CreditCardNo;
    }
    public int getId() {
        return this.Id;
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
    public void setId(int i) {
        this.Id = i;
    }
    public void setAccountNo(int i) {
        this.AccountNo = i;
    }
    public void setRating(int i) {
        this.Rating = i;
    }
}
