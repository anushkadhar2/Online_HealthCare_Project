package com.ajax;

public class Composer {

    private String id;
    private String FirstName;
    private String LastName;
	private String Speciality;
    
    
    public Composer (String id, String FirstName, String LastName, String Speciality) {
        this.id = id;
        this.FirstName = FirstName;
        this.LastName = LastName;
		this.Speciality = Speciality;
    }

    public String getId() {
        return id;
    }
    
    public String getFirstName() {
        return FirstName;
    }
    
    public String getLastName() {
        return LastName;
    }
	
	public String getSpeciality() {
		return Speciality;
	}
}