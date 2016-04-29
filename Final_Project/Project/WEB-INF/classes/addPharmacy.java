import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;
import com.mongodb.*;

import java.util.*;
import java.io.*;

public class addPharmacy extends HttpServlet {
   
	public void doGet (HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException{
		
		String pharmacyId = request.getParameter("pharmacyId");
		String pharmacyName = request.getParameter("pharmacyName");
		String pharmacyAddress = request.getParameter("pharmacyAddress");
		String pharmacyType = request.getParameter("pharmacyType");
		String imagepath = request.getParameter("imagepath");
		
		MongoClient mongo;
		mongo = new MongoClient("localhost", 27017);
									
		// If database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("CSP_Project");
		
		// If the collection does not exists, MongoDB will create it for you
			DBCollection Pharmacies = db.getCollection("Pharmacies");
			//System.out.println("Collection products selected successfully");
				
			BasicDBObject doc = new BasicDBObject("title", "Pharmacies").
				append("pharmacyId", pharmacyId).
				append("pharmacyName", pharmacyName).
				append("pharmacyAddress", pharmacyAddress).
				append("pharmacyType", pharmacyType).
				append("imagepath", imagepath);
									
			Pharmacies.insert(doc);
		
		java.io.PrintWriter out = response.getWriter();
				out.println("<html>");
				out.println("<head>");
				out.println("<title></title>");  
				out.println("<link rel='stylesheet' href='styl5.css' type='text/css' />");
				out.println("</head>");
				out.println("<body>");
				out.println("<h1>"+ "Pharmacies added Successfully !!" +"</h1>");
				out.println("<h1>"+ pharmacyId +"</h1>");
				out.println("<a href='index.jsp'>Go back</a>");
				out.println("</body>");
				out.println("</html>");
				out.close();	   	
}	    	

}