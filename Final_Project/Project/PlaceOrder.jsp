<%@page import="com.mongodb.*" %>
<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.text.*,java.util.Arrays,java.util.List,java.util.Date"%>

<html>
<head>
<title>Place Order</title>
</head>
<body>

<%
	int i = 0;
	int days = 5;
	Date date = new Date();
	Date date1 = new Date();
	SimpleDateFormat dateType = new SimpleDateFormat ("MM/dd/yyyy");
	SimpleDateFormat dateTypeForConfirmationNo = new SimpleDateFormat ("MMddyy");
	
	Calendar c = Calendar.getInstance();
	Calendar c1 = Calendar.getInstance();
	c.setTime(new Date());
	c1.setTime(new Date());
	c.add(Calendar.DATE,14);
	c1.add(Calendar.DATE,14);

	//	out.println("Date after 2 weeks is : "+dateType.format(c.getTime()));

	String orderDate = dateType.format(date).toString();
	String deliveryDate = dateType.format(c.getTime());

	
	for(int j=0;j<days;)
    {
        c1.add(Calendar.DAY_OF_MONTH, -1);
        if(c1.get(Calendar.DAY_OF_WEEK)<=5)
        {
            j++;
        }

    }
    date1=c1.getTime(); 
  //  out.println("Prior date is "+dateType.format(date1));
	String cancellationDate = dateType.format(date1).toString();

	String confirmationNoDate = dateTypeForConfirmationNo.format(date).toString();
	String confirmationNo = "";
	String medicinePrice = request.getParameter("medicinePrice");
	Object username = session.getAttribute("pID");
	if(username == null)
		username = "guest";
	
	String pID = username.toString();
	
	MongoClient mongo = new MongoClient("localhost", 27017);

	DB db = mongo.getDB("CSP_Project");
		
	DBCollection cartDetails = db.getCollection("cartDetails");
	DBCollection placedOrders = db.getCollection("placedOrders");
			
	BasicDBObject searchQuery = new BasicDBObject();
	searchQuery.put("pID", username);

	DBCursor cursor = cartDetails.find(searchQuery);

	confirmationNo = pID + "_" + confirmationNoDate + "_" + i;
	i++;

	BasicDBObject searchQuery1 = new BasicDBObject();
	searchQuery1.put("confirmationNo", confirmationNo);
	
	DBCursor cursor1 = placedOrders.find(searchQuery1);
	
	while(cursor1.count() != 0)
	{
		confirmationNo = "";
		confirmationNo = pID + "_" + confirmationNoDate + "_" + i;
		i++;
//		out.println("Looped for confirmationNo... Trying for "+confirmationNo);
		searchQuery1 = new BasicDBObject();
		searchQuery1.put("confirmationNo",confirmationNo);
		cursor1 = placedOrders.find(searchQuery1);
	}
	
	if(cursor.count() == 0){
		out.println("No products pending for delivery for "+username+" !");
	}else{
	
		String medicineName = "";

		
		out.println("<h2> Order placed successfully for "+username+" : <br></h2>");
		
		while (cursor.hasNext()) {
			BasicDBObject obj = (BasicDBObject) cursor.next();				

%>
			<form method="get" action="DeleteOrderedItem.jsp">

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
			<td><%=orderDate%></td>
			<td> <input type="hidden" name="orderDate" value= "<%=orderDate%>" readonly> </td>         
			</tr>					
			
			<tr>
			<td> Delivery Date: </td>
			<td><%=deliveryDate%></td>
			<td> <input type="hidden" name="deliveryDate" value= "<%=deliveryDate%>" readonly> </td>         
			</tr>					

			
			<tr>
			<td> Cancellation Date: </td>
			<td><%=cancellationDate%></td>
			<td> <input type="hidden" name="cancellationDate" value= "<%=cancellationDate%>" readonly> </td>         
			</tr>					

			<tr>
			<td> Confirmation No: </td>
			<td><%=confirmationNo%></td>
			<td> <input type="hidden" name="confirmationNo" value= "<%=confirmationNo%>" readonly> </td>         
			</tr>					

			<tr>
			<td> <input type="submit" name="deleteFromPlacedOrders" value="Remove Placed Order"> </td>         
			</tr>
	
			</table>
<%			
			BasicDBObject doc = new BasicDBObject("pID", pID).
			append("medicineName", medicineName).
			append("medicinePrice", medicinePrice).
			append("orderDate",orderDate).
			append("deliveryDate",deliveryDate).
			append("cancellationDate",cancellationDate).
			append("confirmationNo",confirmationNo);
			placedOrders.insert(doc);
%>	
			</fieldset>
			</form>	
	
<%
		}
%>				
	<h3 align="right"><a href = "LoginSuccess.jsp">Home</a></h3>

<%
		
	cursor = cartDetails.find(searchQuery);
	while(cursor.hasNext())
	{
		cartDetails.remove(cursor.next());
	}
%>

</body>
</html>
<%
	}
%>