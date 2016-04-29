<%@ page import="java.util.ArrayList" %>
<%@page import="com.mongodb.*" %>
<%@page import="java.util.*,java.text.SimpleDateFormat" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.text.*,java.util.Arrays,java.util.List,java.util.Date"%>

<!doctype html>

<!-- Doctor HomePage -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Your Health - We Care!</title>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body>
<%
	Date date = new Date();
	SimpleDateFormat dateType = new SimpleDateFormat ("MM/dd/yyyy");
	
	Calendar c = Calendar.getInstance();
	c.setTime(new Date());

	String currentDate = dateType.format(date).toString();


%>
<div id="container">
    <header>
    	<h1><a href="/">Electronic Health Records</span></a></h1>
		<h4>Prescription of Patient ID - <u><%=request.getSession().getAttribute("pID")%></u></h4>
		<br>
		<input type="text" align="right" name="Search" > </input>
		<input type ="submit" align="right" value="Search"> </input>
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
			<li class="end"><a href="Pharmacy.jsp">Pharmacys'</a></li>
		</ul>
    </nav>

    <div id="body">		
			<br>
		
			<h3>Patient Prescription:</h3>
			<form method="post" action="/Project/UpdatePatientPrescriptions">
			<table border="1">
				<tr>
					<td> Member ID: </td>
					<td><%= request.getSession().getAttribute("pID") %></td>         
				</tr>
				<tr>	
					<td> Date: </td>
					<td><%= currentDate %></td>
				</tr>

				<tr>
					<td> First Name: </td>
					<td> <%=request.getSession().getAttribute("pFirstName")%> </td>         
				</tr>
				
				<tr>
					<td> Last Name: </td>
					<td> <%=request.getSession().getAttribute("pLastName")%> </td>
				</tr>

				<tr>
					<td> Age: </td>
					<td><input type="text" name="age" value="<%=request.getSession().getAttribute("pAge")%>" maxlength = "3" size="3"> </td>
				</tr>
				<tr>
					<td> DOB: </td>
					<td><%=request.getSession().getAttribute("pDOB")%></td>
				</tr>

				<tr>
					<td> Gender: </td>
					<td><%=request.getSession().getAttribute("pGender")%></td>
				</tr>
<%
	request.getSession().setAttribute("pID",request.getSession().getAttribute("pID"));
	request.getSession().setAttribute("currentDate",currentDate);
	request.getSession().setAttribute("firstName",request.getSession().getAttribute("pFirstName"));
	request.getSession().setAttribute("lastName",request.getSession().getAttribute("pLastName"));
	request.getSession().setAttribute("dob",request.getSession().getAttribute("pDOB"));
	request.getSession().setAttribute("userGender",request.getSession().getAttribute("pGender"));
	
%>				
				<tr>
					<td> Provisional Diagnosis: </td>
					<td> <input type="text" name="diagnosis" size="100" value = "<%= request.getSession().getAttribute("provisionalDiagnosis") %>" > </td>
				</tr>
				
				<tr>
					<td> Presenting Complains: </td>
					<td> <input type="text" name="pcomplains" size="100"  value ="<%= request.getSession().getAttribute("presentingComplains") %>" > </td>
				</tr>
				
				<tr>
					<td> Vital Signs: </td>
					<td> <input type="text" name="vsigns" size="100"  value = "<%=request.getSession().getAttribute("vitalSigns")%>" > </td>
				</tr>
				
				<tr>
					<td> Treatment Advised: </td>
					<td> <input type="text" name="treatadv" size="100"  value = "<%=request.getSession().getAttribute("treatment")%>" > </td>
				</tr>
				
				<tr>
					<td> Investigations Advised: </td>
					<td> <input type="text" name="invadv" size="100"  value = "<%=request.getSession().getAttribute("investigation")%>" > </td>
				</tr>
				
				<tr>
					<td> Instruction(s): </td>
					<td> <input type="text" name="instructions" size="100"  value = "<%=request.getSession().getAttribute("instruction")%>"> </td>         
				</tr>
								
				<tr>
					<td> Follow-Up Date: </td>
					<td> <input type="date" name="fdate" value="<%=request.getSession().getAttribute("followUpDate")%>"> </td>    
				</tr>
			</table>
		<h5 align="center"><input type="submit" value="Save/Update"></h5>
		</form>
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