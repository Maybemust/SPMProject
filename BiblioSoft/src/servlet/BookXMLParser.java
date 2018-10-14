/**
 * 
 */
package servlet;

/**
 * @author ¿Ó—Û
 *
 */
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
 
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
 
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;
 
 
public class BookXMLParser extends DefaultHandler {
 
  private TudouBookInfo book = null;
 
  private final StringBuilder buff = new StringBuilder();
  private String attname = null;
  private final List<String> tags = new ArrayList<String>();
 
  /**
   * @return the book
   */
  public TudouBookInfo getBook() {
    return book;
  }
 
  public BookXMLParser(InputStream is) {
    try {
      SAXParserFactory spfactory = SAXParserFactory.newInstance();
      spfactory.setValidating(false);
      SAXParser saxParser = spfactory.newSAXParser();
      XMLReader xmlReader = saxParser.getXMLReader();
      xmlReader.setContentHandler(this);
      xmlReader.parse(new InputSource(is));
    } catch (Exception e) {
      System.err.println(e);
      System.exit(1);
    }
  }
 
  public void startElement(String uri, String localName, String name,
      Attributes atts) throws SAXException {
    if (name.equalsIgnoreCase("entry")) {
      book = new TudouBookInfo();
    } else if (name.equalsIgnoreCase("db:attribute")) {
      attname = atts.getValue("name");
    } else if (name.equalsIgnoreCase("db:tag")) {
      tags.add(atts.getValue("name"));
    } else if (name.equalsIgnoreCase("link")) {
      if ("image".equalsIgnoreCase(atts.getValue("rel"))) {
        book.setImagePath(atts.getValue("href"));
      }
    }
    buff.setLength(0);
  }
 
  public void endElement(String uri, String localName, String name)
      throws SAXException {
    if ("entry".equalsIgnoreCase(name)) {
      StringBuilder str = new StringBuilder();
      for (String t : tags) {
        str.append(t + "/");
      }
      book.setTags(str.toString());
    } else if (name.equalsIgnoreCase("db:attribute")) {
      String value = buff.toString().trim();
      if ("isbn10".equalsIgnoreCase(attname)) {
        book.setIsbn10(value);
      } else if ("isbn13".equalsIgnoreCase(attname)) {
        book.setIsbn13(value);
      } else if ("title".equalsIgnoreCase(attname)) {
        book.setTitle(value);
      } else if ("pages".equalsIgnoreCase(attname)) {
        book.setPages(value);
      } else if ("author".equalsIgnoreCase(attname)) {
        book.setAuthor(value);
      } else if ("price".equalsIgnoreCase(attname)) {
        book.setPrice(value);
      } else if ("publisher".equalsIgnoreCase(attname)) {
        book.setPublisher(value);
      } else if ("binding".equalsIgnoreCase(attname)) {
        book.setBinding(value);
      } else if ("pubdate".equalsIgnoreCase(attname)) {
        book.setPubdate(value);
      }
    } else if ("summary".equalsIgnoreCase(name)) {
      book.setSummary(buff.toString());
    }
    buff.setLength(0);
  }
 
  public void characters(char ch[], int start, int length)
      throws SAXException {
    buff.append(ch, start, length);
  }
 
}