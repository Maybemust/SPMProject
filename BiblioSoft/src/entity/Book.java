/**
 * 
 */
package entity;

import java.sql.Blob;
import java.sql.Date;

/**
 * @author ¿Ó—Û
 *
 */

public class Book {

	
	private String barCode;
	private String bookName;
	private String ISBN;
	private String author;
	private String publishing;
	private String location;
	private String cover;
	private String introduction;
	private int status;
	private Date dateOfStorage;
	private String tag1;
	private String tag2;
	private double price;
	private int isdelete;
	private String deleteman;
	
	
	
	/**
	 * 
	 */
	public Book() {
		super();
	}
	/**
	 * @param barCode
	 * @param iSBN
	 * @param author
	 * @param publishing
	 */
	public Book(String barCode, String iSBN, String author, String publishing) {
		super();
		this.barCode = barCode;
		ISBN = iSBN;
		this.author = author;
		this.publishing = publishing;
	}
	/**
	 * @param barCode
	 * @param iSBN
	 * @param bookName
	 * @param author
	 * @param publishing
	 */
	public Book(String barCode,String bookname, String iSBN, String author, String publishing) {
		super();
		this.barCode = barCode;
		this.bookName=bookname;
		ISBN = iSBN;
		this.author = author;
		this.publishing = publishing;
	}
	/**
	 * @param barCode
	 * @param bookName
	 * @param iSBN
	 * @param author
	 * @param publishing
	 * @param location
	 * @param cover
	 * @param introduction
	 * @param status
	 * @param dateOfStorage
	 * @param tag1
	 * @param tag2
	 * @param price
	 */
	public Book(String barCode, String bookName,String iSBN, String author, String publishing, String location, String cover,
			String introduction, int status, Date dateOfStorage, String tag1, String tag2,double price) {
		super();
		this.barCode = barCode;
		this.bookName=bookName;
		ISBN = iSBN;
		this.author = author;
		this.publishing = publishing;
		this.location = location;
		this.cover = cover;
		this.introduction = introduction;
		this.status = status;
		this.dateOfStorage = dateOfStorage;
		this.tag1 = tag1;
		this.tag2 = tag2;
		this.price=price;
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
	 * @return the iSBN
	 */
	public String getISBN() {
		return ISBN;
	}
	/**
	 * @param iSBN the iSBN to set
	 */
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * @return the publishing
	 */
	public String getPublishing() {
		return publishing;
	}
	/**
	 * @param publishing the publishing to set
	 */
	public void setPublishing(String publishing) {
		this.publishing = publishing;
	}
	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}
	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}
	/**
	 * @return the cover
	 */
	public String getCover() {
		return cover;
	}
	/**
	 * @param cover the cover to set
	 */
	public void setCover(String cover) {
		this.cover = cover;
	}
	/**
	 * @return the introduction
	 */
	public String getIntroduction() {
		return introduction;
	}
	/**
	 * @param introduction the introduction to set
	 */
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	public int getIsdelete() {
		return isdelete;
	}
	/**
	 * @param status the status to set
	 */
	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}
	
	public String getDeleteman() {
		return deleteman;
	}
	/**
	 * @param iSBN the iSBN to set
	 */
	public void setDeleteman(String deleteman) {
		this.deleteman = deleteman;
	}
	
	
	/**
	 * @return the dateOfStorage
	 */
	public Date getDateOfStorage() {
		return dateOfStorage;
	}
	/**
	 * @param dateOfStorage the dateOfStorage to set
	 */
	public void setDateOfStorage(Date dateOfStorage) {
		this.dateOfStorage = dateOfStorage;
	}
	/**
	 * @return the tag1
	 */
	public String getTag1() {
		return tag1;
	}
	/**
	 * @param tag1 the tag1 to set
	 */
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	/**
	 * @return the tag2
	 */
	public String getTag2() {
		return tag2;
	}
	/**
	 * @param tag2 the tag2 to set
	 */
	public void setTag2(String tag2) {
		this.tag2 = tag2;
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
	
	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Book [barCode=" + barCode + ", bookName=" + bookName + ", ISBN=" + ISBN + ", author=" + author
				+ ", publishing=" + publishing + ", location=" + location + ", cover=" + cover + ", introduction="
				+ introduction + ", status=" + status + ", dateOfStorage=" + dateOfStorage + ", tag1=" + tag1
				+ ", tag2=" + tag2 + ", price=" + price + "]";
	}
	
	
	
	
	
}
