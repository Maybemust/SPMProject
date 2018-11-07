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
	private String question;
	private String answer;
	
	
	
	/**
	 * 
	 */
	public Librarian() {
		super();
	}
	/**
	 * @param account
	 * @param password
	 * @param tag
	 */
	public Librarian(long account, String password, int tag, String question, String answer) {
		super();
		this.account = account;
		this.password = password;
		this.tag = tag;
		this.question = question;
		this.answer = answer;
	}
	
	public Librarian(long account, String password, int tag){
		this.account = account;
		this.password = password;
		this.tag = tag;
		this.question = "NO SECURE QUESTION";
		this.answer = null;
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
	
	/**
	 * @return the question
	 */
	public String getQuestion() {
		return question;
	}
	/**
	 * @param question the question to set
	 */
	public void setQuestion(String question) {
		this.question = question;
	}
	/**
	 * @return the answer
	 */
	public String getAnswer() {
		return answer;
	}
	/**
	 * @param answer the answer to set
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Librarian [account=" + account + ", password=" + password + ", tag=" + tag + ", question=" + question
				+ ", answer=" + answer + "]";
	}
	
	
	
}
