public class CustomerPreferences{
    int AccountNo;
    String Preference;


    public CustomerPreferences(int AccountNo, String Preference) {
        this.AccountNo = AccountNo;
        this.Preference = Preference;

    }

    public int getAccountNo() {
        return this.AccountNo;
    }
    public String getPreference() {
        return this.Preference;
    }


    public void setPreference(String s) {
        this.Preference = s;
    }
    public void setAccountNo(int i) {
        this.AccountNo = i;
    }
}
