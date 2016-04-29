<%@page import="com.mongodb.*" %>
<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.text.*,java.util.Arrays,java.util.List,java.util.Date"%>

<html>
<head>
<title>Placed Orders</title>
</head>
<body>

<%

//	Date date = new Date();
	//SimpleDateFormat dateType = new SimpleDateFormat ("MM/dd/yyyy");
		//String orderDate = dateType.format(date).toString();
	Object uname = session.getAttribute("login_id");
	if(uname == null)
		uname = "guest";
	String login_id = uname.toString();
	
	MongoClient mongo = new MongoClient("localhost", 27017);

	DB db = mongo.getDB("CSP_Project");
		
	DBCollection placedOrders = db.getCollection("placedOrders");

	DBCursor cursor;

	BasicDBObject searchQuery = new BasicDBObject();
	searchQuery.put("login_id", uname);

	if(request.getParameter("salesmen") == null)
	{
		cursor = placedOrders.find(searchQuery);

	}
	else
	{	
		cursor = placedOrders.find();	
		out.println("<h2> All purchased items by all users : <br></h2>");
	}
	if(cursor.count() == 0){
		out.println("No products pending for delivery for "+uname+" !");
	}else{
	
		String productName = "";
		int productPrice = -1;
		String orderDate = "";
		String deliveryDate = "";
		String confirmationNo = "";
		String cancellationDate = "";
		
		while (cursor.hasNext()) {
			BasicDBObject obj = (BasicDBObject) cursor.next();				

%>
			<form method="post" action="DeleteOrderedItem.jsp">

			<fieldset>
		
			<table>
			<tr>
			<td> User Name: </td>
			<%login_id = obj.getString("login_id");%>
			<td><%=login_id%></td>
			<td> <input type="hidden" name="login_id" value= "<%=login_id%>" readonly> </td>         
			</tr>
			
			<tr>
			<td> Product Name: </td>
			<%productName = obj.getString("productName");%>
			<td><%=productName%></td>
			<td> <input type="hidden" name="productName" value= "<%=productName%>" readonly> </td>         
			</tr>
								
			<tr>
			<td> Product Price: </td>
			<%productPrice = obj.getInt("productPrice");%>
			<td><%=productPrice%></td>
			<td> <input type="hidden" name="productPrice" value= "<%=productPrice%>" readonly> </td>         
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
	
<%
		}
%>				
	<h3 align="right"><a href = "LoginSuccess.jsp">Home</a></h3>


</body>
</html>
<%
	}
%>