import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;
import com.mongodb.*;

import java.util.*;
import java.io.*;

public class addMedicine extends HttpServlet {
   
	public void doGet (HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException{
		
		String medicineId = request.getParameter("medicineId");
		String medicineName = request.getParameter("medicineName");
		String medicinePrice = request.getParameter("medicinePrice");
		String medicineType = request.getParameter("medicineType");
		String imagepath = request.getParameter("imagePath");
		
		MongoClient mongo;
		mongo = new MongoClient("localhost", 27017);
									
		// If database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("CSP_Project");
		
		// If the collection does not exists, MongoDB will create it for you
			DBCollection Medicines = db.getCollection("Medicines");
			//System.out.println("Collection products selected successfully");
				
			BasicDBObject doc = new BasicDBObject("title", "Medicines").
				append("medicineId", medicineId).
				append("medicineName", medicineName).
				append("medicinePrice", medicinePrice).
				append("medicineType", medicineType).
				append("imagepath", imagepath);
									
			Medicines.insert(doc);
		
		java.io.PrintWriter out = response.getWriter();
				out.println("<html>");
				out.println("<head>");
				out.println("<title></title>");  
				out.println("<link rel='stylesheet' href='styl5.css' type='text/css' />");
				out.println("</head>");
				out.println("<body>");
				out.println("<h1>"+ "Medicines added Successfully !!" +"</h1>");
				out.println("<h1>"+ medicineId +"</h1>");
				out.println("<a href='index.jsp'>Go back</a>");
				out.println("</body>");
				out.println("</html>");
				out.close();	   	
}	    	

}