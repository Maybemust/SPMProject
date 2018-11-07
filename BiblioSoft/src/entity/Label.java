package entity;
/*
 * diao
 */
public class Label {
	private String name;

	
	public Label(String name) {
		super();
		this.name = name;
	}

	public Label() {
		super();
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}


	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}


	public String toString() {
		return "Label [name=" + name + "]";
	}
	

}
