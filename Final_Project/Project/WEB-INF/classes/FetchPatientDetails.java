import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;

public class FetchPatientDetails extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	MongoClient mongo;
	
	public void init() throws ServletException{
		mongo = new MongoClient("localhost", 27017);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		RequestDispatcher view ;
		int index, i=0;
		int j=0;
		int next_index=0;
		String flag_pharmacy = "0";
		flag_pharmacy = request.getParameter("flag_pharmacy");
		if(flag_pharmacy == null)
			flag_pharmacy = "0";
		String pID = request.getParameter("pID");
		session.setAttribute("pID",pID);
		if(request.getParameter("flagForPatient") != null)
		{
			session.setAttribute("flagForPatient",request.getParameter("flagForPatient"));
		}
//		out.println(request.getParameter("pID"));

		try{

			DB db = mongo.getDB("CSP_Project");
			
			DBCollection patientDetails = db.getCollection("patientDetails");
			DBCollection patientPrescriptions = db.getCollection("patientPrescriptions");

			BasicDBObject query = new BasicDBObject();
			query.put("pID", pID);
			DBCursor c1 = patientDetails.find(query);
			DBCursor c2 = patientPrescriptions.find(query);		
			
			ArrayList<String> temp = new ArrayList<String>();

			if(c1.count() == 0){
				out.println("No existing details for this patient.");
			}else{
			
				
				String pFirstName = "";
				String pLastName = "";
				String pAge = "";
				String pDOB = "";
				String pGender = "";
				String prescriptionDate = "";
				int prescriptionCount = 0;

				
				BasicDBObject obj1 = (BasicDBObject) c1.next();				
				pFirstName = obj1.getString("pFirstName");
				pLastName = obj1.getString("pLastName");
				pAge = obj1.getString("pAge");
				pDOB = obj1.getString("pDOB");
				pGender = obj1.getString("pGender");
				request.setAttribute("pID",pID);
				request.setAttribute("pFirstName",pFirstName);
				request.setAttribute("pLastName",pLastName);
				request.setAttribute("pAge",pAge);
				request.setAttribute("pDOB",pDOB);
				request.setAttribute("pGender",pGender);
			
		session.setAttribute("pFirstName",pFirstName);
		session.setAttribute("pLastName",pLastName);
		session.setAttribute("pAge",pAge);
		session.setAttribute("pDOB",pDOB);
		session.setAttribute("pGender",pGender);

				
				if(c2.count() > 0)
				{


					while(c2.hasNext())
					{
						i = next_index;
						BasicDBObject obj2 = (BasicDBObject) c2.next();		

						prescriptionCount = c2.size();			
						String[] dateArray = new String[prescriptionCount];
						dateArray[i] = obj2.getString("prescriptionDate");
						i++;
						next_index = i;
						prescriptionDate = obj2.getString("prescriptionDate");		
						temp.add(obj2.getString("prescriptionDate"));						

					}						
					for(j=0;j<temp.size();j++)
					{							
							out.println("ArrayList["+j+"] = "+temp.get(j));
					}
						
			}else
				{
					prescriptionDate = "-1";
					request.setAttribute("prescriptionDate",prescriptionDate);
				}
				
				request.setAttribute("prescriptionDate",temp);

				if(flag_pharmacy.equals("0"))
				{
					view = request.getRequestDispatcher("ReturningPatient.jsp");				
					view.forward(request, response);
				}else
				{
					view = request.getRequestDispatcher("PatientDetailsForPharmacy.jsp");				
					view.forward(request, response);
						
				}
			}	

			
		} catch (MongoException e) {
				e.printStackTrace();
		}
	}

	
	public void destroy(){
      // do nothing.
	}
}