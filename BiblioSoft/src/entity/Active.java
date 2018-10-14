package entity;
import java.util.Date;
/*
 * by diao
 * user for forgetpassword
 */
public class Active {
	private String ID;
	private String account;
	private String email;
	private Date affective;
	private int flag;
	
	public Active(String iD, String account, String email, Date affective, int flag) {
		super();
		ID = iD;
		this.account = account;
		this.email = email;
		this.affective = affective;
		this.flag = flag;
	}

	/**
	 * @return the iD
	 */
	public String getID() {
		return ID;
	}

	/**
	 * @param iD the iD to set
	 */
	public void setID(String iD) {
		ID = iD;
	}

	/**
	 * @return the account
	 */
	public String getAccount() {
		return account;
	}

	/**
	 * @param account the account to set
	 */
	public void setAccount(String account) {
		this.account = account;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the affective
	 */
	public Date getAffective() {
		return affective;
	}

	/**
	 * @param affective the affective to set
	 */
	public void setAffective(Date affective) {
		this.affective = affective;
	}

	/**
	 * @return the flag
	 */
	public int getFlag() {
		return flag;
	}

	/**
	 * @param flag the flag to set
	 */
	public void setFlag(int flag) {
		this.flag = flag;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Active [ID=" + ID + ", account=" + account + ", email=" + email + ", affective=" + affective + ", flag="
				+ flag + "]";
	}
	
	
}
