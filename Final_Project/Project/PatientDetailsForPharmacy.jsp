<%@ page import="java.util.ArrayList" %>
<!doctype html>

<!-- Returning Patient -->
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
		<h4>Details of Patient ID - <u><%=request.getAttribute("pID")%></u></h4>
		<br>
		<input type="text" align="right" name="Search" > </input>
		<input type ="submit" align="right" value="Search"> </input>
    </header>
    <nav>
    	<ul>
        	<li class="start selected"><a href="index.jsp">Home</a></li>
            <li class=""><a href="PhyHome.html">Physicians </a></li>
            <li class=""><a href="PatientHome.html">Patient Portal</a></li>
            <li class="end"><a href="Lab.jsp">Labs</a></li>
			<li class="end"><a href="Pharmacy.jsp">Pharmacy's</a></li>
        </ul>
    </nav>

	<img class="header-image" src="images/returningp.jpg" width = "100%" height = "100%" alt="Index Page Image" />

    <div id="body">	
<!--	<section id="content"> -->

<fieldset>
			<table border="1">
<tr>			
            <td>ID   : <%= request.getSession().getAttribute("pID") %></td>
            <td>First Name : <%= request.getSession().getAttribute("pFirstName") %></td>
            <td>Last Name : <%= request.getSession().getAttribute("pLastName") %></td>
</tr>
<tr>     
			<td>Age : <%= request.getSession().getAttribute("pAge") %></td>
            <td>DOB  : <%= request.getSession().getAttribute("pDOB") %></td>
            <td>Gender  : <%= request.getSession().getAttribute("pGender") %></td>
</tr>
			<table>
	
<%
			if(request.getAttribute("prescriptionDate").equals("-1"))
			{
%>
			<br><br><br>	
 <h4> No Past Prescriptions Available </h4>
			<br>		
<%
			}else
			{				
%>

			<br>
<ol>			
<h3>Past Precriptions : </h3>
<%
			int i=0;
			ArrayList<String> temp = new ArrayList<String>();
			temp = (ArrayList)request.getAttribute("prescriptionDate");
			for(i=0;i<temp.size();i++)
			{
%>				
			<br>
			<li><u><a href="FetchPatientPrescriptions?flag_pharmacy=<%=1%>&PrescriptionDate=<%= temp.get(i) %>"><%= temp.get(i) %></a></u></li>
<%
			}
%>
</ol>			
<%			
			}
%>
		</fieldset>
		</section>	
	    <aside class="sidebar">
	
            <ul>	
               <li>
                    <h4>Get Online</h4>
                    <ul>
                        <li><a href="#">Find a doctor</a></li>
                        <li><a href="#">Pay your bills</a></li>
                        <li><a href="#">Make an appointment (New Patients)</a></li>
						<li><a href="#">Make an appointment (Exsisting Patients)</a></li>
                    </ul>
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