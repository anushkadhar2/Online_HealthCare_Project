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

public class NewPatient extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		HttpSession session = request.getSession();
		PrintWriter output = response.getWriter();
		RequestDispatcher view ;
		String patientID = request.getParameter("patientID");
		String date = request.getParameter("date");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String age = request.getParameter("age");
		String dob = request.getParameter("dob");
		String userGender = request.getParameter("userGender");
		String diagnosis = request.getParameter("diagnosis");
		String pcomplains = request.getParameter("pcomplains");
		String vsigns = request.getParameter("vsigns");
		String treatadv = request.getParameter("treatadv");
		String invadv = request.getParameter("invadv");
		String instructions = request.getParameter("instructions");
		String fdate = request.getParameter("fdate");
//		output.println("patientID : "+patientID+" date : "+date+" firstName : "+firstName+" userGender : "+userGender);


		try{
			// Connect to Mongo DB
			MongoClient mongo = new MongoClient("localhost", 27017);

			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP_Project");


			// If the collection does not exists, MongoDB will create it for you
			DBCollection patientDetails = db.getCollection("patientDetails");
			DBCollection patientPrescriptions = db.getCollection("patientPrescriptions");
			// Find and display
			BasicDBObject query = new BasicDBObject();

			query.put("pID", patientID);
			DBCursor c1 = patientDetails.find(query);		
			DBCursor c2 = patientPrescriptions.find(query);		
			
			if(c1.count() == 0){
			
				BasicDBObject doc = new BasicDBObject("pID", patientID).
				append("pFirstName", firstName).
				append("pLastName", lastName).
				append("pAge", age).
				append("pDOB", dob).
				append("pGender", userGender);
									
				patientDetails.insert(doc);
				
				BasicDBObject doc1 = new BasicDBObject("pID", patientID).
				append("prescriptionDate", date).
				append("provisionalDiagnosis", diagnosis).
				append("presentingComplains", pcomplains).
				append("vitalSigns", vsigns).
				append("treatment", treatadv).
				append("investigation", invadv).
				append("instruction", instructions).
				append("followUpDate", fdate);
									
				patientPrescriptions.insert(doc1);
				
				output.println("Document inserted successfully");
				Object value = session.getId();
				value = session.getAttribute("uname");
				request.setAttribute("uname",value);

				view = request.getRequestDispatcher("LoginSuccess.jsp");				
				view.forward(request, response);
				
			}else
			{
				output.println("Patient with pID "+patientID+" already exists!");
				view = request.getRequestDispatcher("NP.jsp");				
				view.forward(request, response);

			}
				
	} catch (MongoException e) {
				e.printStackTrace();
		}

}
}