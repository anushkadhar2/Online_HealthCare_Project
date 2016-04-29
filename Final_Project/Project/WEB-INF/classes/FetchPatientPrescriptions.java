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

public class FetchPatientPrescriptions extends HttpServlet {
	
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
		String pID = (String)session.getAttribute("pID");
		String prescriptionDate = request.getParameter("PrescriptionDate");
		flag_pharmacy = request.getParameter("flag_pharmacy");
		
		if(flag_pharmacy == null)
			flag_pharmacy = "0";
		
		try{

			DB db = mongo.getDB("CSP_Project");
			
			DBCollection patientPrescriptions = db.getCollection("patientPrescriptions");

			BasicDBObject query = new BasicDBObject();
			query.put("pID", pID);
			query.put("prescriptionDate", prescriptionDate);
			DBCursor c1 = patientPrescriptions.find(query);		
			
			if(c1.count() == 0){
				out.println("No existing details for this date.");
			}else{
					
				String provisionalDiagnosis = "";
				String presentingComplains = "";
				String vitalSigns = "";
				String treatment = "";
				String investigation = "";
				String instruction = "";
				String followUpDate = "";
					
				BasicDBObject obj1 = (BasicDBObject) c1.next();				
				request.setAttribute("prescriptionDate",obj1.getString("prescriptionDate"));
				request.setAttribute("provisionalDiagnosis",obj1.getString("provisionalDiagnosis"));
				request.setAttribute("presentingComplains",obj1.getString("presentingComplains"));
				request.setAttribute("vitalSigns",obj1.getString("vitalSigns"));
				request.setAttribute("treatment",obj1.getString("treatment"));
				request.setAttribute("investigation",obj1.getString("investigation"));
				request.setAttribute("instruction",obj1.getString("instruction"));
				request.setAttribute("followUpDate",obj1.getString("followUpDate"));
				request.getSession().setAttribute("oldDate",obj1.getString("prescriptionDate"));
				if(request.getSession().getAttribute("flagForPatient") == null)
					request.getSession().setAttribute("flagForPatient","3");

			}
			if(flag_pharmacy.equals("0"))
			{
				view = request.getRequestDispatcher("DisplayPatientPrescriptions.jsp");				
				view.forward(request, response);
			}
			else
			{
				view = request.getRequestDispatcher("DisplayPatientPrescriptionsToPharmacy.jsp");				
				view.forward(request, response);				
			}
			
		} catch (MongoException e) {
				e.printStackTrace();
		}
		
	}

	
	public void destroy(){
      // do nothing.
	}
}