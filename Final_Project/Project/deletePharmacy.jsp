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
			MongoClient mongo;
			mongo = new MongoClient("localhost", 27017);

		   String searchParameter = request.getParameter("pharmacyId");	

		   DB db = mongo.getDB("CSP_Project");
			
			DBCollection Pharmacies = db.getCollection("Pharmacies");
			System.out.println("Collection registerDetails selected successfully");
			
			BasicDBObject query = new BasicDBObject();
				query.append("pharmacyId",searchParameter);
				Pharmacies.remove(query);
			
			%>
			<h1> Pharmacy Removed Successfully</h1>
			<br>
		    <h3>To remove more</h1>
			<a href = 'deletePharmacy.html'>Click here</a>
			<h3>To go back</h1>
			<a href = 'index.jsp'>Click here</a>
			</body>
			</html>
				

		
