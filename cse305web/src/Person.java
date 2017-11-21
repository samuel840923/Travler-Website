public class Person{
    int Id;
    String FirstName;
    String LastName;
    String Address;
    String City;
    String State;
    int ZipCode;

    public Person(int Id, String FirstName, String LastName, String Address, String City, String State, int ZipCode) {
        this.Id = Id;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Address = Address;
        this.City = City;
        this.State = State;
        this.ZipCode = ZipCode;
    }
    public String getFirstName() {
        return this.FirstName;
    }
    public int getId() {
        return this.Id;
    }
    public int getZipCode() {
        return this.ZipCode;
    }
    public String getLastName() {
        return this.LastName;
    }
    public String getAddress() {
        return this.Address;
    }
    public String getCity() {
        return this.City;
    }
    public String getState() {
        return this.State;
    }

    public void setFirstName(String s) {
        this.FirstName = s;
    }
    public void setLastName(String s) {
        this.LastName = s;
    }
    public void setAddress(String s) {
        this.Address = s;
    }
    public void setCity(String s) {
        this.City = s;
    }
    public void setState(String s) {
        this.State = s;
    }
    public void setId(int i) {
        this.Id = i;
    }
    public void setZipCode(int i) {
        this.ZipCode = i;
    }
}
