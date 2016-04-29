<html>
	<head>
		<%@page language="java"%>
		<%@page import = "java.util.*"%>
		<%@page import = "java.io.*"%>
		<%@page import = "java.text.*"%>
		<%@page import = "java.util.Date"%>
		<%@page import = "java.io.IOException"%>
		<%@page import = "com.mongodb.*"%>
		
		
	</head>
	<body>


<%
   
 
   
   String email = request.getParameter("email");
   String password = request.getParameter("password");
   
   MongoClient mongo;
   mongo = new MongoClient("localhost", 27017);
   DB db = mongo.getDB("CSP_Project");
   DBCollection myRegistration = db.getCollection("myRegistration");
   
   
   String adminEmail = "admin";
   String adminPassword = "admin";
   
  
		if((email.equals(adminEmail))&&(password.equals(adminPassword)))
		{   
	        response.sendRedirect("welcomeAdmin.html");
			
		}
		else
			{
			response.setContentType("text/html");
			out.println("<html>");
			out.println("<head> </head>");
			out.println("<body>");
			out.println("<h1> Login Failed</h1>");
			out.println("</body>");
			out.println("</html>");
			}
		
			
		
			%>	
		</body>
		</html>
    
   