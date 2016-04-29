
		<html>
	<head>
		<%@page language="java" %>
		<%@page import="java.util.*" %>
		<%@page import="java.io.*" %>
		<%@page import="javax.servlet.*" %>
		<%@page import="java.util.Date" %>
		<%@page import="com.mongodb.*"%>
		
		<meta http-equiv= "Content-Type" content="text/html; charset=utf-8" />
		<title>Doctor Page</title>
		<link rel="stylesheet" href="styles.css" type="text/css" />
		
	</head>
	
	<body>
	<%
		String mcRegNo = request.getParameter("mcRegNo");
		String mcLoc = request.getParameter("mcLoc");
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String speciality = request.getParameter("speciality");
		String uname = request.getParameter("uname");
		String phoneNo = request.getParameter("phoneNo");
		String pwd1 = request.getParameter("pwd1");
		String totalEmail = request.getParameter("totalEmail");
		String street = request.getParameter("street");
		String aptno = request.getParameter("aptno");
		String City = request.getParameter("City");
		String State = request.getParameter("State");
		String zipcode = request.getParameter("zipcode");
		String imagePath = request.getParameter("imagePath");
		
		PrintWriter output = response.getWriter();
		MongoClient mongo;
		mongo = new MongoClient("localhost", 27017);
									
		DB db = mongo.getDB("CSP_Project");
		
		// If the collection does not exists, MongoDB will create it for you
			DBCollection Doctors = db.getCollection("Physicians");
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
							
			Doctors.insert(doc);
			output.println("Account successfully created for Doctor...!!!");
			BasicDBObject doc1 = new BasicDBObject("uname", uname).
				append("password", pwd1);
			
			userLogin.insert(doc1);
			
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");				
			view.forward(request, response);
		}
		%>
		
		<h1> "Doctor <%=uname%>'s Data inserted successfully !!!"</h1><br><br>"
		<a href='index.jsp'>Go back</a>
	</body>
</html>