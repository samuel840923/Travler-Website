public class Employee{
    int Id;
    int SSN;
    boolean IsManager;
    String StartDate;
    double HourlyRate;

    public Fare(int Id, int SSN, boolean IsManager, String StartDate, double HourlyRate) {
        this.Id = Id;
        this.SSN = SSN;
        this.IsManager = IsManager;
        this.StartDate = StartDate;
        this.HourlyRate = HourlyRate;
    }
    public int getId() {return this.Id;}
    public int getSSN() {return this.SSN;}
    public boolean getIsManager() {return this.IsManager;}
    public String getStartDate() {return this.StartDate;}
    public double getHourlyRate() {return this.HourlyRate;}

    public void setId(int i) {this.Id = i;}
    public void setSSN(int i) {this.SSN = i;}
    public void setIsManager(boolean i) {this.IsManager = i;}
    public void setStartDate(String s) {this.StartDate = s;}
    public void setHourlyRate(double d) {this.HourlyRate = d;}
}
