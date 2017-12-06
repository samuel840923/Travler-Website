public class Employee extends Person{
    int Id;
    int SSN;
    boolean IsManager;
    String StartDate;
    double HourlyRate;

    public Employee(int Id, String FirstName, String LastName, String Address, String City, String State, int ZipCode, int SSN, boolean IsManager, String StartDate, double HourlyRate) {
    	super(Id, FirstName, LastName, Address, City, State, ZipCode);
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
