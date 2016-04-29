
		<html>
	<head>
		<%@page language="java" %>
		<%@page import="java.util.*" %>
		<%@page import="java.io.*" %>
		<%@page import="javax.servlet.*" %>
		<%@page import="java.util.Date" %>
		<%@page import="com.mongodb.*"%>
		
		<meta http-equiv= "Content-Type" content="text/html; charset=utf-8" />
		<title>Medicine Page</title>
		<link rel="stylesheet" href="styles.css" type="text/css" />
 
	</head>
		<body>
		<div id='container'>
		<header >
		<h1><span>Electronic Health Records</span></h1>
		
		
    </header>
    <nav>
    	<ul>
        	<li class='start selected'><a href='index.jsp'>Home</a></li>
            <li><a href='PhyHome.html'>Physicians </a></li>
            <li><a href='PatientHome.html'>Patient Portal</a></li>
            <li><a href='Lab.jsp'>Labs</a></li>
			<li><a href='Pharmacy.jsp'>Pharmacys</a></li>
			<li><a href='medicine.html'>Medicine</a></li>
			<li><a href='admin.jsp'>Admin</a></li>
			</ul>
			</nav>
			<img class='header-image' src='images/img_medicine.jpg' width = '100%' height = '100%' alt='xbox' />
				
				<div id='body'>
				<section id='content'>
				<article>
				<h1>Medicine</h1>
				
				</article>
				
				<article class='expanded'>
				
<%		
				String searchParameter = "Medicine";
				String searchField = "medicineType";
				
				MongoClient mongo;
				mongo = new MongoClient("localhost", 27017);
				
				DB db = mongo.getDB("CSP_Project");
			
				DBCollection Medicines = db.getCollection("Medicines");
				BasicDBObject searchQuery = new BasicDBObject();
				searchQuery.put(searchField, searchParameter);
			
				DBCursor cursor = Medicines.find(searchQuery);
				
				while(cursor.hasNext()){
				BasicDBObject obj = (BasicDBObject) cursor.next();
%>				
				<table>
				<img src="/Project/images/<%=obj.getString("imagepath")%>.jpg" width="100" height="150">
				

				<br/>
				<br/>
				
				
			    <tr>
				<td>Medicine Name: </td><td><%=obj.getString("medicineName")%></td>
				</tr>
				
				<tr>
				<td>Medicine Price: </td><td><%=obj.getString("medicinePrice")%></td>
				</tr>
				
				

					<td></td>
					</tr>
					<tr>
					
					
					
					<td>
					
					<form class = "submit-button" method = "post" action = "Buy.jsp">
						<input class = "submit-button" type = "submit" name = "Buy" value = "Buy">
						<input type="hidden" name="medicineName" value=<%=obj.getString("medicineName")%> readonly>
						<input type="hidden" name="medicinePrice" value=<%=obj.getString("medicinePrice")%> readonly>
						
				
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
                        <li><a href='#'>Find a Doctor</a></li>
                       <li><a href='#'>Make an appointment (New Patients)</a></li>
						<li><a href='#'>Make an appointment (Existing Patients)</a></li>
						<li><a href='#'>Pay your bills</a></li>
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
                
					<li>
                	<h4>Search site</h4>
                    <ul>
                    <li class='text'>
                    <form method='get' class='searchform' action='#' >
                    <p>
                   <input type='text' size='25' value='' name='s' class='s' />
                                    
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
			<li><a href='BillingAndInsurance.html' title='premium templates'>Billing and Insurance</a></li>
			<li><a href='HealthSystem.html' title='premium templates'>Our Health System</a></li>
			</ul>
           
			 <div class='clear'></div>
			</div>
		
        <div class='footer-bottom'>
<p>Electronic Health Record, Inc</p>
 </div>
		
    </footer>
		
		
		</body>
		</html>