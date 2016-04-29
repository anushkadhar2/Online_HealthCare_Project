<%@ page import="java.util.ArrayList" %>
<%@page import="com.mongodb.*" %>
<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.text.*,java.util.Arrays,java.util.List,java.util.Date"%>
<!doctype html>

<!-- New Patient -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Your Health - We Care!</title>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body>
<%
	int i = 0;
	Date date = new Date();
	SimpleDateFormat dateType = new SimpleDateFormat ("MM/dd/yyyy");
	
	Calendar c = Calendar.getInstance();
	c.setTime(new Date());

	String currentDate = dateType.format(date).toString();

	String patientIDNo = "";
	String medicinePrice = request.getParameter("medicinePrice");

	MongoClient mongo = new MongoClient("localhost", 27017);

	DB db = mongo.getDB("CSP_Project");
		
	DBCollection patientDetails = db.getCollection("patientDetails");
			
	patientIDNo = "P_" + i;
	i++;

	BasicDBObject searchQuery = new BasicDBObject();
	searchQuery.put("pID", patientIDNo);
	
	DBCursor cursor = patientDetails.find(searchQuery);
	
	while(cursor.count() != 0)
	{
		patientIDNo = "";
		patientIDNo = "P_" + i;
		i++;
//		out.println("Looped for patientIDNo... Trying for "+patientIDNo);
		searchQuery = new BasicDBObject();
		searchQuery.put("pID",patientIDNo);
		cursor = patientDetails.find(searchQuery);
	}
	
	

%>
<div id="container">
    <header>
    	<h1><a href="/">Electronic Health Records</span></a></h1>
 
    </header>
	<form method="post" action="/Project/Logout"> 
			<input type="submit" value="Logout" align="center">
	</form>
    <nav>
    	<ul>
        	<li class="start selected"><a href="index.jsp">Home</a></li>
            <li class=""><a href="PhyHome.html">Physicians </a></li>
            <li class=""><a href="PatientHome.jsp">Patient Portal</a></li>
            <li class="end"><a href="Lab.jsp">Labs</a></li>
			<li class="end"><a href="Pharmacy.jsp">Pharmacy's</a></li>
        </ul>
    </nav>

	<img class="header-image" src="images/newp.jpg" width = "100%" height = "100%" alt="New Patient Page Image" />

    <div id="body">		

	<section id="content">

	  
  <form method="post" action="/Project/NewPatient">
		
		<fieldset>
			<legend>New Patient Prescription:</legend>
			<table>
				<tr>
					<td> Patient ID: </td>
					<td><input type="text" name="patientID" value="<%= patientIDNo%>" onClick="this.value = '';"> </td>         
				</tr>
				<tr>	
					<td> Date: </td>
					<td><%= currentDate%><input type="hidden" name="date" value="<%= currentDate%>"> </td>
				</tr>

				<tr>
					<td> First Name: </td>
					<td> <input type="text" name="firstName" value=''> </td>         
				</tr>
				
				<tr>
					<td> Last Name: </td>
					<td> <input type="text" name="lastName" value=''> </td>
				</tr>

				<tr>
					<td> Age: </td>
					<td><input type="text" name="age" value='' maxlength = "3" size="3"> </td>
				</tr>
				<tr>	
					<td> DOB: </td>
					<td><input type="date" name="dob" value=''> </td>
				</tr>

				<tr>
					<td> Gender: </td>
					<td>
                        <input type="radio" name="userGender" value="Male" /> Male
                        <input type="radio" name="userGender" value="Female" /> Female
					</td>
					
				</tr>
				
				<tr>
					<td> Provisional Diagnosis: </td>
					<td> <textarea rows = "10" cols = "40" name="diagnosis" value = '' > </textarea> <td>
				</tr>
				
				<tr>
					<td> Presenting Complains: </td>
					<td> <textarea rows = "10" cols = "40" name="pcomplains" value = '' > </textarea> <td>
				</tr>
				
				<tr>
					<td> Vital Signs: </td>
					<td> <textarea rows = "10" cols = "40" name="vsigns" value = '' > </textarea> <td>
				</tr>
				
				<tr>
					<td> Treatment Advised: </td>
					<td> <textarea rows = "10" cols = "40" name="treatadv" value = '' > </textarea> <td>
				</tr>
				
				<tr>
					<td> Investigations Advised: </td>
					<td> <textarea rows = "10" cols = "40" name="invadv" value = '' > </textarea> <td>
				</tr>
				
				<tr>
					<td> Instruction(s): </td>
					<td> <textarea rows = "10" cols = "40" name="instructions" value = ''> </textarea> </td>         
				</tr>
								
				<tr>
					<td> Follow-Up Date: </td>
					<td> <input type="date" name="fdate" value=''> </td>    
				</tr>
				
			</table>
		</fieldset>
		
		<fieldset>
			
			<br><br>
			<input type="submit" value="Submit Details">
			
		</fieldset>
		
	</form>
    </section>
        
		<aside class="sidebar">
	
            <ul>	
               <li>
              
                </li>
                
                <li>
                    <h4>About us</h4>
                    <ul>
                        <li class="text">
                        	<p style="margin: 0;">We are your partner for health, helping you live well by bringing the best in healthcare to your door.</p>
                        </li>
                    </ul>
                </li>
                
                <li>
                	<h4>Search site</h4>
                    <ul>
                    	<li class="text">
                            <form method="get" class="searchform" action="#" >
                                <p>
                                    <input type="text" size="25" value="" name="s" class="s" />
                                    
                                </p>
                            </form>	
						</li>
					</ul>
				</li>
            </ul>
		
    </aside>
    
	<div class="clear"></div>
	</div>
    
	<footer>
	
        <div class="footer-content">
            <ul>
            	<li type="disk"><b>Quick Links:</b></li>
                <li type="circle"><a href="index.jsp" title="premium templates">Home</a></li>
				<li type="circle"><a href="About.jsp" title="premium templates">About Us</a></li>
				<li type="circle"><a href="BillingAndInsurance.html" title="premium templates">Billing and Insurance</a></li>
				<li type="circle"><a href="HealthSystem.html" title="premium templates">Our Health System</a></li>
			</ul>
           
        <div class="clear"></div>
        </div>
		
        <div class="footer-bottom">
            <p>Electronic Health Record, Inc</p>
        </div>
		
    </footer>
</div>

</body>

</html>