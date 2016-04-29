<html>
	<head>
		<%@page language="java" %>
		<%@page import="java.util.*" %>
		<%@page import="java.io.*" %>
		<%@page import="javax.servlet.*" %>
		<%@page import="java.util.Date" %>
		<%@page import="com.mongodb.*"%>
		
		<meta http-equiv= "Content-Type" content="text/html; charset=utf-8" />
		<title>View Review</title> 
	</head>
	<body>
	
	<%
		int i = 1;
		MongoClient mongo;
	    mongo = new MongoClient("localhost", 27017);
	    String searchField = "doctorName";
	    String searchParameter = request.getParameter("doctorName");
			
			
		DB db = mongo.getDB("CSP_Project");
			
		DBCollection Feeds = db.getCollection("Feeds");
			
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put(searchField, searchParameter);

			
		DBCursor cursor = Feeds.find(searchQuery);
			
				%>		
			
			<h1><u> Feedback for Dr. <%=searchParameter%> </u></h1>
			<br><br>
			
			<%
			if(cursor.count() == 0){
				out.println("There are no feedbacks/reviews for the Doctor.");
			}else
			{
			%>
				
				<%
				String doctorName = "";
			
				String reviewRating = "";
				String reviewDate =  "";
				String reviewText = "";
				
				while (cursor.hasNext()) {
					//out.println(cursor.next());
					BasicDBObject obj = (BasicDBObject) cursor.next();				
					
					%>
				<table>
					<tr>
					<td>User: <%=i%></td>
					<% i++; %>
					</tr>	
										
					<tr>
					<td>Date:</td>
					
					<td><%=obj.getString("reviewDate")%></td>
					</tr>
					
					<tr>
					<td>Rating:</td>
					
					<td><%=obj.getString("reviewRating")%></td>
					</tr>

					<tr>
					<td> Feedback: </td>
					
					<td> <%=obj.getString("reviewText")%></td>
					</tr>

					<hr>	
				</table>

				<%} %>
			<%}	
			%>
			<hr>
			<h4 align="right"><a href="Doctor.jsp"> Home </a></h4>

			</body>
			    </html>
		
