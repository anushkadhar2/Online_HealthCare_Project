<%@page import="com.mongodb.*" %>
<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.net.UnknownHostException"%>

<html>
<head>
<title>Buy</title>
</head>
<body>

<%

    

	String medicineName = " ";
	String medicinePrice = " ";
	
	
	int flag = 0;

	MongoClient mongo = new MongoClient("localhost", 27017);
						
	DB db = mongo.getDB("CSP_Project");
			
	DBCollection Medicines = db.getCollection("Medicines");

	BasicDBObject searchQuery = new BasicDBObject();

	DBCursor cursor = Medicines.find();

	if(cursor.count() > 0)
	{
			while(cursor.hasNext())
			{
					BasicDBObject obj = (BasicDBObject) cursor.next();
					medicineName = obj.getString("medicineName");
					medicinePrice = obj.getString("medicinePrice");
					
					
			}
	
	}else{
		
%>

	<div id="container">
    <header>
    	<h1><a href="Home">Home</a></h1>
		<br>
        <h2>No medicines added in database.</h2>
	</header>

<%
		
		
		
	}
	
%>

<h1>Place Order</h1>							
 <h3><%=medicineName%></h3> 

<form method="get" action="SubmitOrder.jsp">
<fieldset>
<legend>Product information:</legend>

<table>
<tr>
<td>Medicine Name:</td>
<td><input type="text" name="medicineName" value="<%=medicineName%>" readonly></td>
</tr>				
<tr>
<td> Price: </td>
<td> <input type="text" name="medicinePrice" value="<%=medicinePrice%>" readonly> </td>
</tr>


</table>
<br><br>
<input type="submit" value="Add To Cart">			
</fieldset>		

</form>	
</body>
</html>
