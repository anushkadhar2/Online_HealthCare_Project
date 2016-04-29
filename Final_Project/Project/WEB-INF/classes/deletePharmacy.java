import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;
import java.io.*;
import java.io.FileReader;

public class deletePharmacy extends HttpServlet {
   
	public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException{
	
		String pharmacyId = request.getParameter("pharID");
		String pharmacyName = request.getParameter("pharName");
		
		File old = new File("C:/apache-tomcat-7.0.34/webapps/Project1/itemDetails.txt");
		FileReader inputFile = new FileReader(old);
				
		File file1 = new File("C:/apache-tomcat-7.0.34/webapps/Project1/itemDetails1.txt");
		BufferedReader br = new BufferedReader(inputFile);

		FileWriter fw = new FileWriter(file1,true);
		BufferedWriter bw = new BufferedWriter(fw);
		String currLine = null;
		
		PrintWriter out = response.getWriter();
		
		while((currLine=br.readLine())!=null ){
			//String nextToken = input.next();
			//currLine = input.nextLine();
				
			String temp[] = currLine.split("-");	
			String nextToken = temp[0];
			if(nextToken.equals(pharmacyId)){
				
			} 
			else{
				bw.write(currLine);
				bw.write("\r\n");
		}
		
			
}
		bw.close();
		fw.close();
		br.close();
				
		old.delete();
	
	//	File newFile = new File("C:/apache-tomcat-7.0.34/webapps/Project1/itemDetails1.txt");
		file1.renameTo(new File("C:/apache-tomcat-7.0.34/webapps/Project1/itemDetails.txt")); 	
		
		//java.io.PrintWriter out = response.getWriter();
				out.println("<html>");
				out.println("<head>");
				out.println("<title></title>");  
				out.println("</head>");
				out.println("<body>");
				out.println("<h1>"+ "Item deleted Successfully !!" +"</h1>");
				out.println("<a href='index.jsp'>Go back</a>");
				out.println("</body>");
				out.println("</html>");
				
}	
	
}	  	    
	    	


