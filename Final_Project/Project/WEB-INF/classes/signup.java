import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;

public class signup extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter output = response.getWriter();

		String mcRegNo = request.getParameter("medicalID");
		String mcLoc = request.getParameter("MCLoc");
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String speciality = request.getParameter("speciality");
		String uname = request.getParameter("uname");
		String phoneNo = request.getParameter("phone");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String totalEmail = request.getParameter("eMail");
		String street = request.getParameter("street");
		String aptno = request.getParameter("aptno");
		String City = request.getParameter("City");
		String State = request.getParameter("State");
		String zipcode = request.getParameter("zipcode");
		String imagePath = request.getParameter("imagePath");
			
		if(!pwd1.equals(pwd2))
		{
			output.println("Password Mis-Match");
			return;
		}else if(fName == null)
		{
			output.println("First name blank...!");
			return;
		}else if(lName == null)
		{
			output.println("Lastname is blank...!!!");
			return;
		}else if(uname == null)
		{
			output.println("username is null...!!!");
			return;
		}else if(speciality == null)
		{
			output.println("Speciality is null...!!!");
			return;
		}else if(street == null)
		{
			output.println("Address is incomplete...!!!");
			return;
		}else if(City == null)
		{
			output.println("Address is incomplete...!!!");
			return;
		}else if(State == null)
		{
			output.println("Address is incomplete...!!!");
			return;
		}else if(zipcode == null)
		{
			output.println("Address is incomplete...!!!");
			return;
		}else
		{
		// Connect to Mongo DB
			MongoClient mongo = new MongoClient("localhost", 27017);
						
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP_Project");
			
			// If the collection does not exists, MongoDB will create it for you
			DBCollection userDetails = db.getCollection("Physicians");
			DBCollection userLogin = db.getCollection("Physician_Login");

		// Find and display
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("uname", uname);

		DBCursor traverseCursor = userLogin.find(searchQuery);
		if(traverseCursor.count() == 1)
		{

			output.println("Doctor having uname as "+uname+" already exists!!!");
			return;
//			RequestDispatcher view = request.getRequestDispatcher("LoginSuccess.html");
//			view.forward(request, response);
		}
		else
		{
			
			BasicDBObject doc = new BasicDBObject("mcRegNo", mcRegNo).			
				append("mcLoc",mcLoc).
				append("fName", fName).
				append("lName", lName).
				append("speciality",speciality).
				append("uname", uname).
				append("phoneNo", phoneNo).
				append("password", pwd1).
				append("totalEmail", totalEmail).
				append("street", street).
				append("aptno", aptno).
				append("City", City).
				append("State", State).
				append("zipcode", zipcode).
				append("imagePath", imagePath);
							
			userDetails.insert(doc);
			output.println("Account successfully created for Doctor...!!!");
			BasicDBObject doc1 = new BasicDBObject("uname", uname).
				append("password", pwd1);
			
			userLogin.insert(doc1);
			
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");				
			view.forward(request, response);
		}
	}
	}
}