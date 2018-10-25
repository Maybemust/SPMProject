/**
 * 
 */
package servlet;
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
import javax.xml.transform.TransformerConfigurationException;
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
import org.apache.avalon.framework.configuration.ConfigurationException;
import org.apache.avalon.framework.configuration.DefaultConfiguration;
import org.apache.avalon.framework.logger.ConsoleLogger;
import org.apache.avalon.framework.logger.Logger;
/**
 * @author hasee
 *
 */
public class Barcodefunction {

	public static ByteArrayOutputStream generateBarcode(String format, Configuration cfg, String msg, String resTEXT, String Stringgray) throws IOException, ConfigurationException, BarcodeException, TransformerException
	{
		BarcodeUtil util = BarcodeUtil.getInstance();
        BarcodeGenerator gen = util.createBarcodeGenerator(cfg);

        ByteArrayOutputStream bout = new ByteArrayOutputStream(4096);
        int orientation = 0;
        try {
            if (format.equals(MimeTypes.MIME_SVG)) {
                //Create Barcode and render it to SVG
                SVGCanvasProvider svg = new SVGCanvasProvider(false, orientation);
                gen.generateBarcode(svg, msg);
                org.w3c.dom.DocumentFragment frag = svg.getDOMFragment();

                //Serialize SVG barcode
                TransformerFactory factory = TransformerFactory.newInstance();
                Transformer trans = factory.newTransformer();
                Source src = new javax.xml.transform.dom.DOMSource(frag);
                Result res = new javax.xml.transform.stream.StreamResult(bout);
                trans.transform(src, res);
            } else if (format.equals(MimeTypes.MIME_EPS)) {
                EPSCanvasProvider eps = new EPSCanvasProvider(bout, orientation);
                gen.generateBarcode(eps, msg);
                eps.finish();
            } else {
                String resText = resTEXT;
                int resolution = 300; //dpi
                if (resText != null) {
                    resolution = Integer.parseInt(resText);
                }
                if (resolution > 2400) {
                    throw new IllegalArgumentException(
                        "Resolutions above 2400dpi are not allowed");
                }
                if (resolution < 10) {
                    throw new IllegalArgumentException(
                        "Minimum resolution must be 10dpi");
                }
                String gray =Stringgray;
                //String gray = request.getParameter(BARCODE_IMAGE_GRAYSCALE);
                BitmapCanvasProvider bitmap = ("true".equalsIgnoreCase(gray)
                    ? new BitmapCanvasProvider(
                            bout, format, resolution,
                            BufferedImage.TYPE_BYTE_GRAY, true, orientation)
                    : new BitmapCanvasProvider(
                            bout, format, resolution,
                            BufferedImage.TYPE_BYTE_BINARY, false, orientation));
                gen.generateBarcode(bitmap, msg);
                bitmap.finish();
            }
        } finally {
            bout.close();
        }
        return bout;
	}
	
}
