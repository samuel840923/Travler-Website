public class Leg{
    String AirlineID ;
    int FlightNo;
    String DepAirportID;
    String ArrAirportID;
    String ArrTime;
    String DepTime;

    public Leg(String AirlineID, int FlightNo, String DepAirportID, String ArrAirportID, String ArrTime, String DepTime) {
        this.AirlineID = AirlineID;
        this.FlightNo = FlightNo;
        this.DepAirportID = DepAirportID;
        this.ArrAirportID = ArrAirportID;
        this.ArrTime = ArrTime;
        this.DepTime = DepTime;
    }
    public String getAirlineID() {
        return this.AirlineID;
    }
    public int getFlightNo() {
        return this.FlightNo;
    }
    public String getDepAirportID() {
        return this.DepAirportID;
    }
    public String getArrAirportID() {
        return this.ArrAirportID;
    }
    public String getArrTime() {
        return this.ArrTime;
    }
    public String getDepTime() {
        return this.DepTime;
    }
    public void setAirlineID(String s) {
        this.AirlineID = s;
    }
    public void setFlightNo(int i) {
        this.FlightNo = i;
    }
    public void setDepAirportID(String s) {
        this.DepAirportID = s;
    }
    public void setArrAirportID(String s) {
        this.ArrAirportID = s;
    }
    public void setArrTime(String s) {
        this.ArrTime = s;
    }
    public void setDepTime(String s) {
        this.DepTime = s;
    }
}
