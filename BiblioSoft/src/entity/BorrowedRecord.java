/**
 * 
 */
package entity;

import java.sql.Date;

/**
 * @author ¿Ó—Û
 *
 */
public class BorrowedRecord {
	
	private int bRID;
	private String barCode;
	private String readerAccount;
	private Date borrowedDate;
	private Date returnedDate;
	private double fine;
	private String bookName;
	private Long reduceDate;
	
	
	
	
	public Long getReduceDate() {
		return reduceDate;
	}
	public void setReduceDate(Long reduceDate) {
		this.reduceDate = reduceDate;
	}
	/**
	 * 
	 */
	public BorrowedRecord() {
		super();
	}
	/**
	 * @param bRID
	 * @param barCode
	 * @param readerAccount
	 * @param fine
	 */
	public BorrowedRecord(int bRID, String barCode, String readerAccount, double fine) {
		super();
		this.bRID = bRID;
		this.barCode = barCode;
		this.readerAccount = readerAccount;
		this.fine = fine;
	}
	/**
	 * @param bRID
	 * @param barCode
	 * @param readerAccount
	 * @param borrowedDate
	 * @param returnedDate
	 * @param fine
	 */
	public BorrowedRecord(int bRID, String barCode,String bookName, String readerAccount, Date borrowedDate, Date returnedDate,
			double fine,long reduceDate) {
		super();
		this.bRID = bRID;
		this.barCode = barCode;
		this.bookName = bookName;
		this.readerAccount = readerAccount;
		this.borrowedDate = borrowedDate;
		this.returnedDate = returnedDate;
		this.fine = fine;
		this.reduceDate = reduceDate;
	}
	public BorrowedRecord(String barCode,String bookName, String readerAccount, Date borrowedDate, Date returnedDate,
			double fine,long reduceDate) {
		super();
		this.barCode = barCode;
		this.bookName = bookName;
		this.readerAccount = readerAccount;
		this.borrowedDate = borrowedDate;
		this.returnedDate = returnedDate;
		this.fine = fine;
		this.reduceDate = reduceDate;
	}
	/**
	 * @return the bRID
	 */
	public int getbRID() {
		return bRID;
	}
	/**
	 * @param bRID the bRID to set
	 */
	public void setbRID(int bRID) {
		this.bRID = bRID;
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
	 * @return the borrowedDate
	 */
	public Date getBorrowedDate() {
		return borrowedDate;
	}
	/**
	 * @param borrowedDate the borrowedDate to set
	 */
	public void setBorrowedDate(Date borrowedDate) {
		this.borrowedDate = borrowedDate;
	}
	/**
	 * @return the returnedDate
	 */
	public Date getReturnedDate() {
		return returnedDate;
	}
	/**
	 * @param returnedDate the returnedDate to set
	 */
	public void setReturnedDate(Date returnedDate) {
		this.returnedDate = returnedDate;
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "BorrowedRecord [bRID=" + bRID + ", barCode=" + barCode + ", readerAccount=" + readerAccount
				+ ", borrowedDate=" + borrowedDate + ", returnedDate=" + returnedDate + ", fine=" + fine + "]";
	}
	public String getBookName() {
		// TODO Auto-generated method stub
		return bookName;
	}
	public void setBookName(String bookName) {
		// TODO Auto-generated method stub
		this.bookName = bookName;
	}
	
	
}
