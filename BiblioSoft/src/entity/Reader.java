/**
 * 
 */
package entity;

/**
 * @author ¿Ó—Û
 *
 */
public class Reader {
	
	private String account;
	private String password;
	private String email;
	private long phone;
	private double fine;
	private int borrowedNum;
	private double cashPledge;
	private int tag;
	
	
	/**
	 * 
	 */
	public Reader() {
		super();
	}
	/**
	 * @param account
	 * @param password
	 */
	public Reader(String account, String password) {
		super();
		this.account = account;
		this.password = password;
	}
	/**
	 * @param account
	 * @param password
	 * @param email
	 * @param phone
	 * @param fine
	 * @param borrowedNum
	 * @param cashPledge
	 * @param tag
	 */
	public Reader(String account, String password, String email, long phone, double fine, int borrowedNum,
			double cashPledge, int tag) {
		super();
		this.account = account;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.fine = fine;
		this.borrowedNum = borrowedNum;
		this.cashPledge = cashPledge;
		this.tag = tag;
	}
	public Reader(String account2) {
		super();
		this.account = account2;
		this.password = "-1*254*jk^&*";
		this.email = "0";
		this.phone = 0;
		this.fine = 0.0;
		this.borrowedNum = 0;
		this.cashPledge = 0.0;
		this.tag = 0;	}
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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
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
	 * @return the phone
	 */
	public long getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(long phone) {
		this.phone = phone;
	}
	/**
	 * @return the fine
	 */
	public double getFine() {
		return fine;
	}
	/**
	 * @param fine the fine to set
	 */
	public void setFine(double fine) {
		this.fine = fine;
	}
	/**
	 * @return the borrowedNum
	 */
	public int getBorrowedNum() {
		return borrowedNum;
	}
	/**
	 * @param borrowedNum the borrowedNum to set
	 */
	public void setBorrowedNum(int borrowedNum) {
		this.borrowedNum = borrowedNum;
	}
	/**
	 * @return the cashPledge
	 */
	public double getCashPledge() {
		return cashPledge;
	}
	/**
	 * @param cashPledge the cashPledge to set
	 */
	public void setCashPledge(double cashPledge) {
		this.cashPledge = cashPledge;
	}
	/**
	 * @return the tag
	 */
	public int getTag() {
		return tag;
	}
	/**
	 * @param tag the tag to set
	 */
	public void setTag(int tag) {
		this.tag = tag;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Reader [account=" + account + ", password=" + password + ", email=" + email + ", phone=" + phone
				+ ", fine=" + fine + ", borrowedNum=" + borrowedNum + ", cashPledge=" + cashPledge + ", tag=" + tag
				+ "]";
	}
	
	
}
