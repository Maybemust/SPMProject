/**
 * 
 */
package entity;

/**
 * @author ¿Ó—Û
 *
 */
public class Librarian {

	private long account;
	private String password;
	private int tag;
	
	
	
	/**
	 * @param account
	 * @param password
	 * @param tag
	 */
	public Librarian(long account, String password, int tag) {
		super();
		this.account = account;
		this.password = password;
		this.tag = tag;
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
		return "Librarian [account=" + account + ", password=" + password + ", tag=" + tag + "]";
	}
	
	
}
