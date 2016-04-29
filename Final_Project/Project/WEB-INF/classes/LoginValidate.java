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

public class LoginValidate extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		HttpSession session = request.getSession();
		PrintWriter output = response.getWriter();
		RequestDispatcher view ;
		Object value = session.getId();
		value = session.getAttribute("uname");

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String title = "Session Details";


		if(value != null)
		{
			output.println("Username:  "+value+" already logged in!!!");
		}
		else
		{
			// Connect to Mongo DB
			MongoClient mongo = new MongoClient("localhost", 27017);

			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP_Project");


			// If the collection does not exists, MongoDB will create it for you
			DBCollection loginDetails = db.getCollection("Physician_Login");
			// Find and display
			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("uname", userName);
			searchQuery.put("password", password);
	
			DBCursor cursor = loginDetails.find(searchQuery);
			
			if(cursor.count() == 1)
			{
	
				output.println("Login Successful of "+userName+" !!!");
				Date createTime = new Date(session.getCreationTime());
				session.setAttribute("uname", userName);
				if(userName.equals("admin"))
				{
					output.println("Login Successful of Admin !!!");
				}else
				{		
					output.println("Date : "+createTime + " ...!");
					output.println("ID : "+session.getId()+"...!");
					request.setAttribute("uname",userName);
					view = request.getRequestDispatcher("LoginSuccess.jsp");				
					view.forward(request, response);
				}
			}else
			{
				output.println("Incorrect username/password...!!!");
			}
		}
	}
}