<%@ page import="java.util.ArrayList" %>
<%@page language="java" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="java.util.Date" %>
<%@page import="com.mongodb.*"%>
<!doctype html>

<!-- Doctor HomePage -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Your Health - We Care!</title>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body>
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
			<%
				if(request.getSession().getAttribute("flagForPatient").toString().equals("3"))
				{
			%>
			<h5 align="right"><a href="EditPatientPrescriptions.jsp" >Edit Details</a></h5>
			<%
				}else{}
			%>
			
			<table border="1">
				<tr>
					<td > Member ID :</td>
					
					<td><%= request.getSession().getAttribute("pID") %> </td>         
				</tr>
			<tr>	
					<td > Date :     </td>
					<td><%= request.getAttribute("prescriptionDate") %> </td>
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
					<td><%=request.getSession().getAttribute("pAge")%> </td>
				</tr>
					<tr>
					
					<td> DOB: </td>
					<td><%=request.getSession().getAttribute("pDOB")%> </td>
				</tr>

				<tr>
					<td> Gender: </td>
					<td><%=request.getSession().getAttribute("pGender")%> </td>
				</tr>
				
				<tr>
					<td> Provisional Diagnosis: </td>
					<td> <%= request.getAttribute("provisionalDiagnosis") %></td>
				</tr>
				
				<tr>
					<td> Presenting Complains: </td>
					<td><%= request.getAttribute("presentingComplains") %> </td>
				</tr>
				
				<tr>
					<td> Vital Signs: </td>
					<td> <%=request.getAttribute("vitalSigns")%></td>
				</tr>
				
				<tr>
					<td> Treatment Advised: </td>
					<td><%=request.getAttribute("treatment")%></td>
				</tr>
				
				<tr>
					<td> Investigations Advised: </td>
					<td> <%=request.getAttribute("investigation")%> </td>
				</tr>
				
				<tr>
					<td> Instruction(s): </td>
					<td><%=request.getAttribute("instruction")%> </td>         
				</tr>
								
				<tr>
					<td> Follow-Up Date: </td>
					<td><%=request.getAttribute("followUpDate")%> </td>    
				</tr>

			</table>
<%
request.getSession().setAttribute("followUpDate",request.getAttribute("followUpDate"));
request.getSession().setAttribute("investigation",request.getAttribute("investigation"));
request.getSession().setAttribute("treatment",request.getAttribute("treatment"));
request.getSession().setAttribute("vitalSigns",request.getAttribute("vitalSigns"));
request.getSession().setAttribute("presentingComplains",request.getAttribute("presentingComplains"));
request.getSession().setAttribute("provisionalDiagnosis",request.getAttribute("provisionalDiagnosis"));
request.getSession().setAttribute("instruction",request.getAttribute("instruction"));


%>			
<!--
			<table>
				<tr>
					<td> Member ID: <input type="text" name="memberID" readonly="true" value="<%= request.getSession().getAttribute("pID") %>"> </td>         
					
					<td> Date: <input type="text" name="date" value="<%= request.getAttribute("prescriptionDate") %>"> </td>
				</tr>

				<tr>
					<td> First Name: </td>
					<td> <input type="text" name="firstName" value="<%=request.getSession().getAttribute("pFirstName")%>"> </td>         
				</tr>
				
				<tr>
					<td> Last Name: </td>
					<td> <input type="text" name="lastName" value="<%=request.getSession().getAttribute("pLastName")%>"> </td>
				</tr>

				<tr>
					<td> Age: <input type="text" name="age" value="<%=request.getSession().getAttribute("pAge")%>" maxlength = "3" size="3"> </td>
					
					<td> DOB: <input type="text" name="dob" value="<%=request.getSession().getAttribute("pDOB")%>"> </td>
				</tr>

				<tr>
					<td> Gender: <input type="text" name="userGender" value="<%=request.getSession().getAttribute("pGender")%>"> </td>
				</tr>
				
				<tr>
					<td> Provisional Diagnosis: </td>
					<td> <input type="text" name="diagnosis" size="30" value = "<%= request.getAttribute("provisionalDiagnosis") %>" > <td>
				</tr>
				
				<tr>
					<td> Presenting Complains: </td>
					<td> <input type="text" name="pcomplains" size="30"  value ="<%= request.getAttribute("provisionalDiagnosis") %>" > <td>
				</tr>
				
				<tr>
					<td> Vital Signs: </td>
					<td> <input type="text" name="vsigns" size="30"  value = "<%=request.getAttribute("vitalSigns")%>" > <td>
				</tr>
				
				<tr>
					<td> Treatment Advised: </td>
					<td> <input type="text" name="treatadv" size="30"  value = "<%=request.getAttribute("treatment")%>" > <td>
				</tr>
				
				<tr>
					<td> Investigations Advised: </td>
					<td> <input type="text" name="invadv" size="30"  value = "<%=request.getAttribute("investigation")%>" > <td>
				</tr>
				
				<tr>
					<td> Instruction(s): </td>
					<td> <input type="text" name="instructions" size="30"  value = "<%=request.getAttribute("instruction")%>"> </td>         
				</tr>
								
				<tr>
					<td> Follow-Up Date: </td>
					<td> <input type="text" name="fdate" value="<%=request.getAttribute("followUpDate")%>"> </td>    
				</tr>
				
			</table>
-->			
      
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