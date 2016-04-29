<%@page import="com.mongodb.*" %>
<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.net.UnknownHostException"%>

<html>
<head>
<title>Submit Order</title>
</head>
<body>

<%

	String medicineName = request.getParameter("medicineName");
	String pID = " ";	
	
	
	String medicinePrice = request.getParameter("medicinePrice");
	int flag = 0;
		
	MongoClient mongo = new MongoClient("localhost", 27017);
	DB db = mongo.getDB("CSP_Project");
		
	DBCollection cartDetails = db.getCollection("cartDetails");

	Object username = session.getAttribute("pID");
	if(username == null)
		username = "guest";
	pID = username.toString();

	BasicDBObject doc = new BasicDBObject("pID", username).
		append("medicineName", medicineName).
		append("medicinePrice", medicinePrice);
			
	cartDetails.insert(doc);

	System.out.println("Document inserted successfully");
	
	DBCursor cursor;
	BasicDBObject searchQuery = new BasicDBObject();
		
		searchQuery.put("pID", username);

		cursor = cartDetails.find(searchQuery);
	
	if(cursor.count() == 0){
		out.println("No products added to cart for "+username+"!");
	}else{
	
		medicineName = "";
		
%>		
		<h3 align="right"><a href = "Payment.jsp">Checkout</a></h3>
		<h2> Cart Details for <i><%=username%></i> <br></h2>

<%		
		while (cursor.hasNext()) {
			BasicDBObject obj = (BasicDBObject) cursor.next();				
%>
			<form method="get" action="RemoveFromCart.jsp">

			<fieldset>
		
			<table>
			<tr>
			<td> User Name: </td>
			<%pID = obj.getString("pID");%>
			<td><%= pID%></td>
			<td> <input type="hidden" name="pID" value="<%=pID%>" readonly> </td>         
			</tr>
			
			<tr>
			<td> Medicine Name: </td>
			<%medicineName = obj.getString("medicineName");%>
			<td><%=medicineName%></td>
			<td> <input type="hidden" name="medicineName" value="<%=medicineName%>" readonly> </td>         
			</tr>
								
			<tr>
			<td> Medicine Price: </td>
			<%medicinePrice = obj.getString("medicinePrice");%>
			<td><%=medicinePrice%></td>
			<td> <input type="hidden" name="medicinePrice" value="<%=medicinePrice%>" readonly> </td>         
			</tr>					
			
			<tr>
			<td> <input type="submit" name="deleteFromCart" value="Remove"> </td>         
			</tr>
	
			</table>
			</fieldset>
			</form>	

<%	
		}
	
%>
			<h3 align="right"><a href = "LoginSuccess.jsp">Home Page</a></h3>

</body>
</html>
<%
	}
%>