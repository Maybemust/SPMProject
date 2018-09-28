/**
 * 
 */
package entity;

import java.sql.Date;

/**
 * @author ¿Ó—Û
 *
 */
public class Post {

	private String postID;
	private String author;
	private Date time;
	private String text;
	
	
	
	/**
	 * 
	 */
	public Post() {
		super();
	}
	/**
	 * @param author
	 * @param time
	 * @param text
	 */
	public Post(String author, Date time, String text) {
		super();
		this.author = author;
		this.time = time;
		this.text = text;
	}
	/**
	 * @param postID
	 * @param author
	 * @param time
	 * @param text
	 */
	public Post(String postID, String author, Date time, String text) {
		super();
		this.postID = postID;
		this.author = author;
		this.time = time;
		this.text = text;
	}
	/**
	 * @return the postID
	 */
	public String getPostID() {
		return postID;
	}
	/**
	 * @param postID the postID to set
	 */
	public void setPostID(String postID) {
		this.postID = postID;
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
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Post [postID=" + postID + ", author=" + author + ", time=" + time + ", text=" + text + "]";
	}
	
	
	
}
