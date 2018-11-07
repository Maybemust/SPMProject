package entity;
/*
 * song
 */
public class Location {
	private String location;

	
	public Location(String location) {
		super();
		this.location = location;
	}

	public Location() {
		super();
	}

	/**
	 * @return the name
	 */
	public String getLocation() {
		return location;
	}


	/**
	 * @param name the name to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}


	public String toString() {
		return "Location [location=" + location + "]";
	}
	

}
