<%@page language="java" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="java.util.Date" %>
<%@page import="com.mongodb.*"%>

<html>
	<head>
		
		<meta http-equiv= "Content-Type" content="text/html; charset=utf-8" />
		<title>Your Health - We Care!</title>
		<script type="text/javascript" src="javascript.js"></script>
		<link rel="stylesheet" href="styles.css" type="text/css" />
 
	</head>
	<body onload="init()">
		<div id='container'>
	<header >
		<h1><span>Electronic Health Records</span></h1>
    </header>
	
		<form name="autofillform" action="autocomplete">
			<table border = "0" cellpadding="5"> 
				<tbody>
					<tr>
						<td></td>
							<td align="center">
								<input type="text" size="30" id="complete-field" onkeyup="doCompletion()" placeholder="Search">
							</td>
					</tr>
					
					<tr>
						<td id="auto-row" colspan="2">
							<table id="complete-table" class="popupBox" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>

    <nav>
    	<ul>
        	<li class='start selected'><a href='index.jsp'>Home</a></li>
            <li><a href='PhyHome.html'>Physicians </a></li>
            <li><a href='PatientHome.html'>Patient Portal</a></li>
			<li><a href='Pharmacy.jsp'>Pharmacys</a></li>
			<li><a href='medicine.html'>Medicine</a></li>
			<li><a href='admin.jsp'>Admin</a></li>
			</ul>
			</nav>
			<img class='header-image' src='images/PhyHome.jpg' width = '100%' height = '100%' alt='xbox' />
				
				<div id='body'>
				<section id='content'>
				<article>
				<h1>Doctor</h1>
				
				</article>
				
				<article class='expanded'>
				
<%		
				MongoClient mongo;
				mongo = new MongoClient("localhost", 27017);
				String address = "";
				
				DB db = mongo.getDB("CSP_Project");
			
				DBCollection Doctors = db.getCollection("Physicians");
				DBCursor cursor = Doctors.find();
				
				while(cursor.hasNext()){
				BasicDBObject obj = (BasicDBObject) cursor.next();
				if(obj.getString("street") == null && obj.getString("aptno") == null && obj.getString("city") == null && obj.getString("state") == null && obj.getString("zipcode") == null)
				{
					address = "Check me now";
				}else
				{
						if(obj.getString("aptno") != null)
						{
							address = obj.getString("street")+ " " +obj.getString("aptno")+ " " +obj.getString("City")+ " " +obj.getString("State")+ " " +obj.getString("zipcode");
						}else
						{
							address = obj.getString("street")+ " " +obj.getString("City")+ " " +obj.getString("State")+ " " +obj.getString("zipcode");									
						}		
				}	
%>				
				<table>
				
<%

%>				
				
				<img src="/Project/images/img_doctors.jpg" width="150" height="150">
				
<%


%>
				<br/>
				<br/>
				
				
			    <tr>
				<td> First Name: </td><td><%=obj.getString("fName")%></td>
				</tr>
				
				<tr>
				<td> Last Name: </td><td><%=obj.getString("lName")%></td>
				</tr>
				
				<tr>
				<td>Speciality: </td><td><%=obj.getString("speciality")%></td>
				</tr>
				
				<tr>
				<td>Address: </td><td><%=address%></td>
				</tr>
				
				<tr>
				<td>Contact: </td><td><%=obj.getString("phoneNo")%></td>
				</tr>
								
				<tr>

					<td>
					
					<form class = "submit-button" method = "post" action = "DoctorFeedBack.jsp">
						<input class = "submit-button" type = "submit" name = "writeFeedBack" value = "FeedBack">
						<input type="hidden" name="doctorName" value=<%=obj.getString("fName")%> readonly>
						<input type="hidden" name="doctorSpeciality" value=<%=obj.getString("speciality")%> readonly>
						<input type="hidden" name="doctorNumber" value=<%=obj.getString("phoneNo")%> readonly>
						<input type="hidden" name="doctorAddress" value=<%=address%> readonly>
				
					</form>
					</td>
					<td>
 						<form action="Yoo.jsp" method="get">
						  <input type="hidden" name="address" value="<%=address%>">
						  <h4 align="center"><input type="submit" value="Locate Me"></h4>
						
						</form>
					</td>
					
					
					<td>
					<form class = "submit-button" method = "post" action = "ViewFeedBack.jsp">
						<input class = "submit-button" type = "submit" name ="viewFeedBack" value = "View FeedBack">
						<input type="hidden" name="doctorName" value=<%=obj.getString("fName")%> readonly>
						<input type="hidden" name="doctorSpeciality" value=<%=obj.getString("speciality")%> readonly>
						<input type="hidden" name="doctorNumber" value=<%=obj.getString("phoneNo")%> readonly>
						<input type="hidden" name="doctorAddress" value=<%=address%> readonly>
					</form>
				</td>
				</tr>
				</table>
				<br/>
<%				
				}
%>
				</article>
				</section>
				<aside class='sidebar'>
	
            <ul>	
               <li>
                 <h4>Get Online</h4>
                    <ul>
                        <li><a href='Doctor.jsp'>Find a Doctor</a></li>
                   </ul>
                </li>
                
               <li>
                    <h4>About us</h4>
					<ul>
                       <li class='text'>
                       <p style= 'margin: 0';>We are your partner for health, helping you live well by bringing the best in healthcare to your door.</p>
                        </li>
						</ul>
						</li>
                
                   </p>
                   </form>	
				</li>
			</ul>
            </ul>
		
  </aside>
					
		
						
			
		<div class='clear'></div>
		</div>
			
		<footer>
	
        <div class='footer-content'>
            <ul>
            <li><b>Quick Links:</b></li>
            <li><a href='index.jsp' title='premium templates'>Home</a></li>
			<li><a href='About.jsp' title='premium templates'>About Us</a></li>
			</ul>
           
			 <div class='clear'></div>
			</div>
		
        <div class='footer-bottom'>
<p>Electronic Health Record, Inc</p>
 </div>
		
    </footer>
		
		
		</body>
		</html>