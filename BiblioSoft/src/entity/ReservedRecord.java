/**
 * 
 */
package entity;

import java.sql.Date;

/**
 * @author ¿Ó—Û
 *
 */
public class ReservedRecord {

	private String rRID;
	private Date time;
	private String readerAccount;
	private String barCode;
	
	
	
	
	/**
	 * 
	 */
	public ReservedRecord() {
		super();
	}
	/**
	 * @param time
	 * @param readerAccount
	 * @param barCode
	 */
	public ReservedRecord(Date time, String readerAccount, String barCode) {
		super();
		this.time = time;
		this.readerAccount = readerAccount;
		this.barCode = barCode;
	}
	/**
	 * @return the rRID
	 */
	public String getrRID() {
		return rRID;
	}
	/**
	 * @param rRID the rRID to set
	 */
	public void setrRID(String rRID) {
		this.rRID = rRID;
	}
	/**
	 * @return the time
	 */
	public Date getTime() {
		return time;
	}
	/**
	 * @param time the time to set
	 */
	public void setTime(Date time) {
		this.time = time;
	}
	/**
	 * @return the readerAccount
	 */
	public String getReaderAccount() {
		return readerAccount;
	}
	/**
	 * @param readerAccount the readerAccount to set
	 */
	public void setReaderAccount(String readerAccount) {
		this.readerAccount = readerAccount;
	}
	/**
	 * @return the barCode
	 */
	public String getBarCode() {
		return barCode;
	}
	/**
	 * @param barCode the barCode to set
	 */
	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ReservedRecord [rRID=" + rRID + ", time=" + time + ", readerAccount=" + readerAccount + ", barCode="
				+ barCode + "]";
	}
	
	
	
}
