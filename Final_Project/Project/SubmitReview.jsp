<html>
	<head>
		<%@page language="java" %>
		<%@page import="java.util.*" %>
		<%@page import="java.io.*" %>
		<%@page import="javax.servlet.*" %>
		<%@page import="java.util.Date" %>
		<%@page import="com.mongodb.*"%>
		
		<meta http-equiv= "Content-Type" content="text/html; charset=utf-8" />
		<title>Submit Review</title> 
	</head>
	<body>

<%
	
	MongoClient mongo;

		mongo = new MongoClient("localhost", 27017);

			String doctorName = request.getParameter("doctorName");
			String doctorSpeciality = request.getParameter("doctorSpeciality");
			String userName = request.getParameter("userName");
			String reviewRating = request.getParameter("reviewRating");	
			String reviewDate = request.getParameter("reviewDate");
			String reviewText = request.getParameter("reviewText");
										
			// If database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP_Project");
				
			// If the collection does not exists, MongoDB will create it for you
			DBCollection Feeds = db.getCollection("Feeds");
			System.out.println("Collection feeds selected successfully");
				
			BasicDBObject doc = new BasicDBObject("title", "Feeds").
				append("doctorName", doctorName).
				append("doctorSpeciality", doctorSpeciality).
				append("userName", userName).
				append("reviewRating", reviewRating).
				append("reviewDate", reviewDate).
				append("reviewText", reviewText);
									
			Feeds.insert(doc);
				
			System.out.println("Document inserted successfully");
			%>
			<html>
			<head> </head>
			<body>
			<h2> Review submitted for <%=doctorName%>.</h2>
			
			<table>
			
			<tr>
			<td>
			<a href="Doctor.jsp"> Doctors </a>
			</td>
			</tr>
			<br/>
			<tr>
			<td>
			<a href="index.jsp"> Home </a>
			</td>
			</tr>
			
			
			
			</table>
			
		    </body>
			</html>

	
