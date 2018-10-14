/**
 * 
 */
package servlet;

/**
 * @author ÀîÑó
 *
 */
import java.io.IOException;
import java.io.InputStream;
 
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
 
public class RetrieveDocumentByURL  {
	private TudouBookInfo book1;
  public RetrieveDocumentByURL(String url) throws ClientProtocolException, IOException{
    DefaultHttpClient client = new DefaultHttpClient();
    HttpGet get = new HttpGet(url);
    HttpResponse response = client.execute(get);
        HttpEntity entity = response.getEntity();
        InputStream is = entity.getContent();
        book1 = new BookXMLParser(is).getBook();

     /*   System.out.println("title:->" + book1.getTitle());
        System.out.println("summary:->"+ book1.getSummary());
        System.out.println("price:-->" + book1.getPrice());
        System.out.println("author:-->" + book1.getAuthor());
        System.out.println("ImagePath:-->" + book1.getImagePath());*/
  }
  public TudouBookInfo getBookInformation(){
	  return book1;
	  
	  
	  
  }
  
  
  
  
  
/*  public static void main(String[] args) throws ClientProtocolException, IOException {
	  String url="http://api.douban.com/book/subject/isbn/";
	  String isbn="9787121194276";
	  url=url+isbn;
    new RetrieveDocumentByURL(url);
  }*/
 
}
