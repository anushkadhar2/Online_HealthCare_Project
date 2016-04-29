<%@page import="com.mongodb.*" %>
<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.text.*,java.util.Arrays,java.util.List,java.util.Date"%>

<html>
<head>
<title>Updated List of Placed Orders (after deletion)</title>
</head>
<body>

<%

	Date date = new Date();
	SimpleDateFormat dateType = new SimpleDateFormat ("MM/dd/yyyy");
	String currentDate = dateType.format(date).toString();
		
	java.util.Date d1 = dateType.parse(currentDate); 	
		
	String pID = request.getParameter("pID");
	String medicineName = request.getParameter("medicineName");
	String medicinePrice =request.getParameter("medicinePrice");
		
	MongoClient mongo = new MongoClient("localhost", 27017);

	DB db = mongo.getDB("CSP_Project");
		
	DBCollection placedOrders = db.getCollection("placedOrders");
			
	// Find and display 
	BasicDBObject searchQuery = new BasicDBObject();
	searchQuery.put("pID", pID);
	searchQuery.put("medicineName", medicineName);

	DBCursor cursor = placedOrders.find(searchQuery);
	
	BasicDBObject obj = (BasicDBObject) cursor.next();
	java.util.Date d2 = dateType.parse(obj.getString("cancellationDate"));
	
	if((d1.getTime() - d2.getTime())<=0)
	{
		placedOrders.remove(cursor.curr());
		
	}else
	{
		out.println("Cannot remove product now. Cancellation date has passed.");
	}
	
	
	
	if(cursor.count() == 0){
		out.println("No products pending for delivery for "+pID+" !");
	}else{
	
		medicineName = "";
		medicinePrice = "";
		String orderDate = "";
		String deliveryDate = "";
		String confirmationNo = "";
		String cancellationDate = "";
		out.println("<h2> Items purchased by "+pID+" : <br></h2>");
		
		while (cursor.hasNext()) {
			obj = (BasicDBObject) cursor.next();				

%>
			<form method="post" action="DeleteOrderedItem.jsp">

			<fieldset>
		
			<table>
			<tr>
			<td> User Name: </td>
			<%pID = obj.getString("pID");%>
			<td><%=pID%></td>
			<td> <input type="hidden" name="pID" value= "<%=pID%>" readonly> </td>         
			</tr>
			
			<tr>
			<td> Medicine Name: </td>
			<%medicineName = obj.getString("medicineName");%>
			<td><%=medicineName%></td>
			<td> <input type="hidden" name="medicineName" value= "<%=medicineName%>" readonly> </td>         
			</tr>
								
			<tr>
			<td> Medicine Price: </td>
			<%medicinePrice = obj.getString("medicinePrice");%>
			<td><%=medicinePrice%></td>
			<td> <input type="hidden" name="medicinePrice" value= "<%=medicinePrice%>" readonly> </td>         
			</tr>					

			<tr>
			<td> Order Date: </td>
			<%orderDate = obj.getString("orderDate");%>
			<td><%=orderDate%></td>
			<td> <input type="hidden" name="orderDate" value= "<%=orderDate%>" readonly> </td>         
			</tr>					
			
			<tr>
			<td> Delivery Date: </td>
			<%deliveryDate = obj.getString("deliveryDate");%>
			<td><%=deliveryDate%></td>
			<td> <input type="hidden" name="deliveryDate" value= "<%=deliveryDate%>" readonly> </td>         
			</tr>					

			
			<tr>
			<td> Cancellation Date: </td>
			<%cancellationDate = obj.getString("cancellationDate");%>
			<td><%=cancellationDate%></td>
			<td> <input type="hidden" name="cancellationDate" value= "<%=cancellationDate%>" readonly> </td>         
			</tr>					

			<tr>
			<td> Confirmation No: </td>
			<%confirmationNo = obj.getString("confirmationNo");%>
			<td><%=confirmationNo%></td>
			<td> <input type="hidden" name="confirmationNo" value= "<%=confirmationNo%>" readonly> </td>         
			</tr>					

			<tr>
			<td> <input type="submit" name="deleteFromPlacedOrders" value="Remove Placed Order"> </td>         
			</tr>
	
			</table>
			</fieldset>
			</form>	
	<h3 align="right"><a href = "index.jsp">Home</a></h3>
<%
		}
%>				
	<h3 align="right"><a href = "LoginSuccess.jsp">Home</a></h3>


</body>
</html>
<%
	}
%>