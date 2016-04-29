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
import com.mongodb.*;
import java.text.SimpleDateFormat;
import java.net.UnknownHostException;
import java.text.*;
import java.util.Arrays;
import java.util.List;
import java.util.Date;

public class UpdatePatientPrescriptions extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		HttpSession session = request.getSession();
		PrintWriter output = response.getWriter();
		RequestDispatcher view ;
		String patientID = request.getSession().getAttribute("pID").toString();
		String date =  request.getSession().getAttribute("oldDate").toString();
		String firstName =  request.getSession().getAttribute("firstName").toString();
		String lastName =  request.getSession().getAttribute("lastName").toString();
		String age = request.getParameter("age");
		String dob =  request.getSession().getAttribute("dob").toString();
		String userGender =  request.getSession().getAttribute("userGender").toString();
		String diagnosis = request.getParameter("diagnosis");
		String pcomplains = request.getParameter("pcomplains");
		String vsigns = request.getParameter("vsigns");
		String treatadv = request.getParameter("treatadv");
		String invadv = request.getParameter("invadv");
		String instructions = request.getParameter("instructions");
		String fdate = request.getParameter("fdate");
		
		Date date1 = new Date();
		SimpleDateFormat dateType = new SimpleDateFormat ("MM/dd/yyyy");
		
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());

		String currentDate = dateType.format(date1).toString();
		
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
			
			if(c1.count() == 1){
			
				BasicDBObject newDocument = new BasicDBObject();
				newDocument.append("$set", new BasicDBObject("pID", patientID).
				append("pFirstName", firstName).
				append("pLastName", lastName).
				append("pAge", age).
				append("pDOB", dob).
				append("pGender", userGender));

				BasicDBObject searchQuery1 = new BasicDBObject().append("pID", patientID);

				patientDetails.update(searchQuery1, newDocument);
				
				if(currentDate.equals(date)){
					
						
						BasicDBObject doc1 = new BasicDBObject("pID", patientID).
						append("prescriptionDate", date).
						append("provisionalDiagnosis", diagnosis).
						append("presentingComplains", pcomplains).
						append("vitalSigns", vsigns).
						append("treatment", treatadv).
						append("investigation", invadv).
						append("instruction", instructions).
						append("followUpDate", fdate);
											

						BasicDBObject searchQuery2 = new BasicDBObject().append("pID", patientID);

						patientPrescriptions.update(searchQuery2, doc1);
						output.println("Document updated successfully");

					}else{
				
						BasicDBObject doc1 = new BasicDBObject("pID", patientID).
						append("prescriptionDate", currentDate).
						append("provisionalDiagnosis", diagnosis).
						append("presentingComplains", pcomplains).
						append("vitalSigns", vsigns).
						append("treatment", treatadv).
						append("investigation", invadv).
						append("instruction", instructions).
						append("followUpDate", fdate);
											
						patientPrescriptions.insert(doc1);
						
						output.println("Document inserted successfully");
					
					
				}		
				
			//	view = request.getRequestDispatcher("index.jsp");				
		//		view.forward(request, response);
				
			}else
			{
				output.println("Patient with pID "+patientID+" does not exist!");
//				view = request.getRequestDispatcher("NP.jsp");				
	//			view.forward(request, response);

			}
				
	} catch (MongoException e) {
				e.printStackTrace();
		}

}
}