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

	private long postID;
	private String author;
	private Date time;
	private String text;
	private String postImage;
	private String postTitle;
	
	
	
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
	public Post(long postID, String author, Date time, String text) {
		super();
		this.postID = postID;
		this.author = author;
		this.time = time;
		this.text = text;
	}
	
	/**
	 * @param postID
	 * @param author
	 * @param time
	 * @param text
	 * @param postImage
	 * @param postTitle
	 */
	public Post(long postID, String author, Date time, String text,String postImage,String postTitle) {
		super();
		this.postID = postID;
		this.author = author;
		this.time = time;
		this.text = text;
		this.postImage = postImage;
		this.postTitle = postTitle;
	}
	
	/**
	 * @author ZoeX
	 *
	 */	
	public Post(String author, Date time, String text, String postImage, String postTitle) {
		super();
	//	this.postID = postID;
		this.author = author;
		this.time = time;
		this.text = text;
		this.postImage = postImage;
		this.postTitle = postTitle;
	}
	/**
	 * @return the postID
	 */
	public long getPostID() {
		return postID;
	}
	/**
	 * @param postID the postID to set
	 */
	public void setPostID(long postID) {
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


	/**
	 * @author ZoeX
	 *
	 *
	 */	
	
	public void setPostImage(String postImage) {
		this.postImage = postImage;
	}
	/**
	 * @author ZoeX
	 *
	 *
	 */	
	public String getPostImage() {
		return postImage;
	}
	/**
	 * @author ZoeX
	 *
	 */	
	public String getPostTitle() {
		return postTitle;
	}

	/**
	 * @author ZoeX
	 *
	 */	
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	/**
	 * @author ZoeX
	 *
	 */	
	public String toString() {
		return "Post [postID=" + postID + ", author=" + author + ", time=" + time + ", text=" + text + ", postImage="
				+ postImage + ", postTitle=" + postTitle + "]";
	}
}