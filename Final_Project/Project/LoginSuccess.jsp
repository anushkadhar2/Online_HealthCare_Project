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
	
	<%
		String display = "";
		if(request.getAttribute("uname") == null)
			display = "";
		else
			display = request.getAttribute("uname").toString();
	%>
		<h1><a href="/">Electronic Health Records</span></a></h1><br>
		<h3>Welcome <b><i><%=display%></i></b></h3>
		<br>
		<input type="text" align="right" name="Search" > </input>
		<input type ="submit" align="right" value="Search"> </input>
	</header>
	
	<form method="post" action="/Project/Logout"> 
		<input type="submit" value="Logout" align="center">
	</form>
	
	<form action="OrdersPlaced.jsp"> 
		<h4 align="right"><input type="submit" value="Placed Orders" align="right"></h4>
	</form>	

	<form action="SubmitOrder.jsp"> 
		<h4 align="right"><input type="submit" value="Shopping Cart" align="right"></h4>
	</form>	
	
    <nav>
    	<ul>
  		<li class="start selected"><a href="index.jsp">Home</a></li>
            <li class=""><a href="PhyHome.html">Physicians </a></li>
            <li class=""><a href="PatientHome.jsp">Patient Portal</a></li>
			<li class="end"><a href="Pharmacy.jsp">Pharmacys'</a></li>
		</ul>
    </nav>
	<img class="header-image" src="images/doc_log_page.jpg" width = "100%" height = "100%" />

    <div id="body">		

	<section id="content">

	    <article>

			<h2>Description</h2>

            <p>Welcome Doctor! Please enter the patient ID for the Returning Patient or Click New Patient Link</p>

            <p></p>

		</article>
	
    </section>
        
    <aside class="sidebar">
	
            <ul>	
                
                <li>
                    <h4>Patient Information</h4>
                    <ul>
						<li>
							<form method="get" action="/Project/FetchPatientDetails">
							<li><input type="text" name="pID" value='' onClick="this.value = '';"></li>
							<li><input type="submit" name="" value="Fetch Details"></li>
							</form>

							<a href="NP.jsp">New Patient</a>
							
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