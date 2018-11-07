package servlet;
 
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import java.io.PrintWriter;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.avalon.framework.configuration.Configuration;
import org.apache.avalon.framework.configuration.ConfigurationException;

import updateTo.ToBook;
import utils.DBhelper;
import entity.Book;
import servlet.Barcodefunction.*;


import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;

import org.krysalis.barcode4j.BarcodeException;
import org.krysalis.barcode4j.BarcodeGenerator;
import org.krysalis.barcode4j.BarcodeUtil;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.output.eps.EPSCanvasProvider;
import org.krysalis.barcode4j.output.svg.SVGCanvasProvider;
import org.krysalis.barcode4j.tools.MimeTypes;

import org.apache.avalon.framework.configuration.Configuration;
import org.apache.avalon.framework.configuration.DefaultConfiguration;
import org.apache.avalon.framework.logger.ConsoleLogger;
import org.apache.avalon.framework.logger.Logger;
import servlet.BarcodeServlet;
/**
 * Servlet implementation class RegisterServlet
 */
public class bookaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/** Parameter name for the message */
    public static final String BARCODE_MSG                 = "msg";
    /** Parameter name for the barcode type */
    public static final String BARCODE_TYPE                = "type";
    /** Parameter name for the barcode height */
    public static final String BARCODE_HEIGHT              = "height";
    /** Parameter name for the module width */
    public static final String BARCODE_MODULE_WIDTH        = "mw";
    /** Parameter name for the wide factor */
    /** Parameter name for the quiet zone */
    public static final String BARCODE_QUIET_ZONE          = "qz";
    /** Parameter name for the human-readable placement */
    public static final String BARCODE_HUMAN_READABLE_POS  = "hrp";
    /** Parameter name for the output format */
    public static final String BARCODE_FORMAT              = "fmt";
    /** Parameter name for the image resolution (for bitmaps) */
    public static final String BARCODE_IMAGE_RESOLUTION    = "res";
    /** Parameter name for the grayscale or b/w image (for bitmaps) */
    public static final String BARCODE_IMAGE_GRAYSCALE     = "gray";
    /** Parameter name for the font size of the human readable display */
    public static final String BARCODE_HUMAN_READABLE_SIZE = "hrsize";
    /** Parameter name for the font name of the human readable display */
    public static final String BARCODE_HUMAN_READABLE_FONT = "hrfont";
    /** Parameter name for the pattern to format the human readable message */
    public static final String BARCODE_HUMAN_READABLE_PATTERN = "hrpattern";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookaddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    


    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		
/*		private String barCode;
		private String bookName;
		private String ISBN;
		private String author;
		private String publishing;
		private String location;
		private Blob cover;
		private String introduction;
		private int status;
		private Date dateOfStorage;
		private String tag1;
		private String tag2;
		private double price;*/
		
		
		
		
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
		String ISBN=request.getParameter("ISBN"); 
		String bookName=request.getParameter("bookName");  
        String author=request.getParameter("author"); 
        String publishing=request.getParameter("publishing"); 
        String location=request.getParameter("location"); 
        String tag1=request.getParameter("tag1");
        String tag2=request.getParameter("tag2");
        String cover = request.getParameter("fj");
       String cover1=".\\imgs\\";
       
       String cover2 = bookaddServlet.class.getResource("").toString();
       for(int i = 0; i < 9; i++){
    	   cover2 += "../";
       }
       cover2= cover2+"SPMProject/BiblioSoft/WebContent/imgs/";
       cover2=cover2.substring(6);
       System.out.println(cover2);
        
        try {

            File afile = new File(cover);
           System.out.println(afile.getName()); 
           
           
          
            if (afile.renameTo(new File(cover2 + afile.getName()))) {
             cover1=cover1+ afile.getName();
            	System.out.println("File is moved successful!");
            } else {
                System.out.println("File is failed to move!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        
        
        
        
        
     
        System.out.println(cover);
       
        double price=Double.parseDouble(request.getParameter("price"));
		int number=Integer.parseInt(request.getParameter("number"));
		
		String [] barCodeList = new String [number];
      
		
         Book book=new Book();
         book.setISBN(ISBN);
         book.setAuthor(author);     
         book.setPublishing(publishing);           
         book.setLocation(location);
         book.setBookName(bookName);
         book.setDateOfStorage(date);
         book.setTag1(tag1);
         book.setTag2(tag2);
         book.setPrice(price);
         book.setCover(cover1);
      
       

 		if(number>0)
 		{	
 			
 	for(int cont=0; cont<number; cont++)
       { String num2,num3,barCode;
 		
 		int num1=0;
 		num3=String.valueOf(num1);
 		for(num1=1;;num1++)
 		{
 			num3=String.valueOf(num1);
 			if(num1<10)
 			{
 				num2=ISBN+"-0"+num3;
 				
 			}
 			else
 			{
 				num2=ISBN+"-"+num3;
 			}
 			Book book1=ToBook.getByBarCode(num2);
 			
 			
 			if(book1.getISBN()==null)
 				break;	
 		}
 		barCode=num2;	
 		barCodeList[cont]=barCode;
 		 book.setBarCode(barCode);
         ToBook.add(book);
     

    
}
 	
 	
 	BarcodeServlet b=new BarcodeServlet();
 	String format = b.determineFormat(request);
    int orientation = 0;

    Configuration cfg = b.buildCfg(request);

    
    
    String gray = request.getParameter(BARCODE_IMAGE_GRAYSCALE);
    String resText = request.getParameter(BARCODE_IMAGE_RESOLUTION);
    
 	for(int k=0;k<number;k++)
 	{
 		String msg = barCodeList[k];
 		if (msg == null) msg = "0123456789";
 		ByteArrayOutputStream bout=new ByteArrayOutputStream();
 		try {
			 bout=Barcodefunction.generateBarcode(format, cfg, msg, resText, gray);
		} catch (ConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BarcodeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
 		try{
        	String path="D://BarcodeStore//"+msg+".png";
            FileImageOutputStream imageOutput = new FileImageOutputStream(new File(path));//打开输入流
            imageOutput.write(bout.toByteArray(), 0, bout.toByteArray().length);//将byte写入硬盘
            imageOutput.close();
            System.out.println("Make Picture success,Please find image in " + path);
            } catch(Exception ex) {
              System.out.println("Exception: " + ex);
              ex.printStackTrace();
            }
        /*
         * 
         */
        response.setContentType(format);
        response.setContentLength(bout.size());
       // response.getOutputStream().write(bout.toByteArray());
       // response.getOutputStream().flush();
 		
 	}
 	request.setAttribute("barCodeList", barCodeList );
 
 	
    RequestDispatcher dispatcher = request.getRequestDispatcher("/Firstp.jsp?"); 
    dispatcher.forward(request, response); 
		}		
		
		else
		{
			
			response.sendRedirect("bookadd.jsp?number=no");
			
		}
 		
 		
	}

	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		HttpServletRequest rq = (HttpServletRequest) request;
		HttpServletResponse rs = (HttpServletResponse) response;
		doPost(rq, rs);
	}
 
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
 
	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}
 
	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}
 
	@Override
	public void init(ServletConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
 
}

