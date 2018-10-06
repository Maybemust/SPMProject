/**
 * 
 */
package entity;

import java.sql.Date;

/**
 * @author ����
 *
 */
public class ReservedRecord {

	private long rRID;
	private String bookName;
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
	 * @param bookName
	 * @param time
	 * @param readerAccount
	 * @param barCode
	 */
	public ReservedRecord(String bookName,Date time, String readerAccount, String barCode) {
		super();
		this.bookName=bookName;
		this.time = time;
		this.readerAccount = readerAccount;
		this.barCode = barCode;
	}
	/**
	 * @return the rRID
	 */
	public long getrRID() {
		return rRID;
	}
	/**
	 * @param rRID the rRID to set
	 */
	public void setrRID(long rRID) {
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
	
	/**
	 * @return the bookName
	 */
	public String getBookName() {
		return bookName;
	}
	/**
	 * @param bookName the bookName to set
	 */
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ReservedRecord [rRID=" + rRID + ", bookName=" + bookName + ", time=" + time + ", readerAccount="
				+ readerAccount + ", barCode=" + barCode + "]";
	}
	
	
	
	
}
