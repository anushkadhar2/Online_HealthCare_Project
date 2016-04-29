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
    
		   	String pharmacyId = request.getParameter("pharmacyId");
			
			DB db = mongo.getDB("CSP_Project");
			DBCollection Pharmacies = db.getCollection("Pharmacies");
			System.out.println("Collection registerDetails selected successfully");
			
			BasicDBObject query = new BasicDBObject();
			query.append("pharmacyId",pharmacyId);
			Pharmacies.remove(query);
			
			String pharmacyName = request.getParameter("pharmacyName");	
			String pharmacyAddress = request.getParameter("updateAddress");
			String pharmacyType = request.getParameter("pharmacyType");
			
			
			BasicDBObject doc = new BasicDBObject("title", "Pharmacies").
				append("pharmacyId", pharmacyId).
				append("pharmacyType", pharmacyType).
				append("pharmacyName", pharmacyName).
				append("pharmacyAddress", pharmacyAddress);
				
				
				Pharmacies.insert(doc);
			
			%>
			<h1> Product Update Successfully</h1>
			<br>
		    <h3>To update more products</h1>
			<a href = 'updatePharmacy.html'>Click here</a>
			<h3>To go back</h1>
			<a href = 'index.jsp'>Click here</a>
			</body>
			</html>
				

		
