package in.ac.dei.edrp.pms.initlog4j;

import java.io.File;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.BasicConfigurator;
//import org.apache.log4j.PropertyConfigurator;
import org.apache.log4j.xml.DOMConfigurator;

/**
 * This class is used for initializing log4j
 * @author <a href="http://aniltiwaripms.blogspot.com" target="_blank">Anil Kumar Tiwari</a> 
 *
 */
public class Log4JInitServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		System.out.println("Log4JInitServlet is initializing log4j");
		String log4jLocation = config.getInitParameter("log4j-properties-location");

		ServletContext sc = config.getServletContext();

		if (log4jLocation == null) {
			System.err.println("*** No log4j-properties-location init param, so initializing log4j with BasicConfigurator");
			BasicConfigurator.configure();
		} else {
			String webAppPath = sc.getRealPath("/");
			String log4jProp = webAppPath + log4jLocation;
			File myfile = new File(log4jProp);
			if (myfile.exists()) {
				System.out.println("Initializing log4j with: " + log4jProp);
				//PropertyConfigurator.configure(log4jProp);for log4j.properties file
				DOMConfigurator.configure(log4jProp);//for log4j.xml file
			} else {
				System.err.println("*** " + log4jProp + " file not found, so initializing log4j with BasicConfigurator");
				BasicConfigurator.configure();
			}
		}
		super.init(config);
	}
}