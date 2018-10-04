/**
 * 
 */
package entity;

/**
 * @author ¿Ó—Û
 *
 */
public class Admin {

	private long account;
	private String password;
	private double fine;
	private int borrowedMaxinum;
	private int reservedMaxinum;
	private int resercedTime;
	private int fineTime;
	private double cash;
	
	
	/**
	 * 
	 */
	public Admin() {
		super();
	}
	/**
	 * @param account
	 * @param password
	 * @param fine
	 * @param borrowedMaxinum
	 * @param reservedMaxinum
	 * @param resercedTime
	 * @param fineTime
	 */
	public Admin(long account, String password, double fine, int borrowedMaxinum, int reservedMaxinum,
			int resercedTime, int fineTime, double cash) {
		super();
		this.account = account;
		this.password = password;
		this.fine = fine;
		this.borrowedMaxinum = borrowedMaxinum;
		this.reservedMaxinum = reservedMaxinum;
		this.resercedTime = resercedTime;
		this.fineTime = fineTime;
		this.cash = cash;
	}
	/**
	 * @return the account
	 */
	public long getAccount() {
		return account;
	}
	/**
	 * @param account the account to set
	 */
	public void setAccount(long account) {
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
	 * @return the borrowedMaxinum
	 */
	public int getBorrowedMaxinum() {
		return borrowedMaxinum;
	}
	public double getCash(){
		return cash;
	}
	public void setCash(double c){
		this.cash = c;
	}
	/**
	 * @param borrowedMaxinum the borrowedMaxinum to set
	 */
	public void setBorrowedMaxinum(int borrowedMaxinum) {
		this.borrowedMaxinum = borrowedMaxinum;
	}
	/**
	 * @return the reservedMaxinum
	 */
	public int getReservedMaxinum() {
		return reservedMaxinum;
	}
	/**
	 * @param reservedMaxinum the reservedMaxinum to set
	 */
	public void setReservedMaxinum(int reservedMaxinum) {
		this.reservedMaxinum = reservedMaxinum;
	}
	/**
	 * @return the resercedTime
	 */
	public int getResercedTime() {
		return resercedTime;
	}
	/**
	 * @param resercedTime the resercedTime to set
	 */
	public void setResercedTime(int resercedTime) {
		this.resercedTime = resercedTime;
	}
	/**
	 * @return the fineTime
	 */
	public int getFineTime() {
		return fineTime;
	}
	/**
	 * @param fineTime the fineTime to set
	 */
	public void setFineTime(int fineTime) {
		this.fineTime = fineTime;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "System [account=" + account + ", password=" + password + ", fine=" + fine + ", borrowedMaxinum="
				+ borrowedMaxinum + ", reservedMaxinum=" + reservedMaxinum + ", resercedTime=" + resercedTime
				+ ", fineTime=" + fineTime + "]";
	}
	
	
}
