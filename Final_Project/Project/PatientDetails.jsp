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
		<h3>Details of Patient ID - <i><%= request.getAttribute("pID") %></i></h3>
		<br>
		<input type="text" align="right" name="Search" > </input>
		<input type ="submit" align="right" value="Search"> </input>
	</header>
	<form method="post" action="/Project/Logout"> 
			<input type="submit" value="Logout" align="center">
	</form>
    <nav>
    	<ul>
			<li class="start selected"><a href="LoginSuccess.jsp">Home</a></li>
            <li class=""><a href="PhyHome.html">Physicians </a></li>
            <li class=""><a href="PatientHome.jsp">Patient Portal</a></li>
            <li class="end"><a href="Lab.jsp">Labs</a></li>
			<li class="end"><a href="Pharmacy.jsp">Pharmacy's</a></li>
		</ul>
    </nav>

    <div id="body">		

	    <article>
			<ol>	
            <li>ID   : <input type = "text" value="<%= request.getAttribute("pID") %>" ></li>
            <li>Name : <input type = "text" value="<%= request.getAttribute("pName") %>" ></li>
            <li>Age  : <input type = "text" value="<%= request.getAttribute("pAge") %>" ></li>
            <li>Sex  : <input type = "text" value="<%= request.getAttribute("pSex") %>" ></li>
			<ol>

<%

			if(request.getAttribute("prescriptionDate").equals("-1"))
			{
%>
			<br><br><br>	
            <h4>
			No Past Prescriptions Available
			<input type = "text" value="<%= request.getAttribute("prescriptionCount") %>">
			</h4>
			<br>		
<%
			}else
			{	
				
%>

			<br>
			
<%
			int i=0;
			int index = (Integer)request.getAttribute("prescriptionCount");
			ArrayList<String> temp = new ArrayList<String>();
			temp = request.getAttribute("prescriptionDate");
			for(i=0;i<temp.size();i++)
			{
%>				
			<br>
			<h4>Index = <%=	index %></h4>
			<h4><%=	temp[i] %></h4>
<!--			<h4>Array = <%=	temp %></h4>
-->
<%
			}
			}
%>
		</article>
	            
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