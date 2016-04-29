<html>
	<head>
		<%@page language="java" %>
		<%@page import="java.util.*" %>
		<%@page import="java.io.*" %>
		<%@page import="javax.servlet.*" %>
		<%@page import="java.util.Date" %>
		<%@page import="com.mongodb.*"%>
		
		<meta http-equiv= "Content-Type" content="text/html; charset=utf-8" />
		<title>Write Review</title> 
	</head>
	<body>
			
	<%
		MongoClient mongo;
		mongo = new MongoClient("localhost", 27017);
		String doctorName = request.getParameter("doctorName");
		String doctorSpeciality =request.getParameter("doctorSpeciality");
		String doctorAddress = request.getParameter("doctorAddress");
		String doctorNumber =request.getParameter("doctorNumber");
			
			// if database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("CSP_Project");
			
			DBCollection Feeds = db.getCollection("Feeds");
			
			
			%>
				
			<h1>Write Review</h1>	
			<br>
	        
		
			<form method="get" action="SubmitReview.jsp">
			<fieldset>
			
			<legend>Doctor information:</legend>
			<table>
			<tr>
		    <td> Doctor Name: </td>
			<td> <input type="text" name="doctorName" value= "<%=doctorName%>" readonly> </td>
			</tr>
			
			<tr>
		    <td> Doctor Speciality: </td>
			<td> <input type="text" name="doctorSpeciality" value= "<%=doctorSpeciality%>" readonly> </td>
			</tr>
			
			<tr>
			<td> Doctor Address: </td>
			<td><input type="text" name="doctorAddress" value= "<%=doctorAddress%>" readonly> </td>
			</tr>
			
			<tr>
			<td> Doctor Number: </td>
			<td><input type="text" name="doctorAddress" value= "<%=doctorNumber%>" readonly> </td>
			</tr>
			
			
			
			</table>
			
			</fieldset>	
			
			<fieldset>
			<legend>Reviews:</legend>
			<table>
			
			<!--User Name-->
			<tr>
		    <td> User Name: </td>
			<td> <input type="text" name="userName"> </td>	</tr>
			
			<!--User Age-->
			<tr>
		    <td> User Age: </td>
			<td> <input type="text" name="userAge"> </td>	</tr>
			
			<!--User Gender-->
			<tr>
		    <td> User Gender: </td>
			<td> <input type="text" name="userGender"> </td></tr>
			
			<!--User Occupation-->
			<tr>
		    <td> User Occupation: </td>
			<td> <input type="text" name="userOccupation"> </td>	
			</tr>
			
			<!--Review Ratings-->
			<tr>
		    <td> Review Rating: </td>
			<td>
			<select name = "reviewRating">
			<option value="1" selected>1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			</td>
			</tr>
			
			<tr>
		    <td> Review Date: </td>
			<td> <input type="date" name="reviewDate"> </td>	</tr>
			
			<tr>
		    <td> Review Text: </td>
			<td> <textarea type name="reviewText" rows = "5" columns = "50"></textarea> </td>	</tr>
            
			</table>
			<br><br>
			<input type="submit" value="Send Review">
			</fieldset>
			
			
		    </form>
			</body>
			</html>
		 
