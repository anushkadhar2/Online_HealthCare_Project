<!doctype html>

<!-- Doctor Page -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Doctors' Techno Gun</title>
	<link rel="stylesheet" type="text/css" href="styles.css"/>
</head>

<body>

<%
	String patientID = request.getParameter("patientID");
%>
<div id="container">
    <header>
    	<h1><a href="/">Online Doctors' Management Portal</a></h1>
		<input type="text" name="Search" > </input>
		<input type ="submit" value="Search"> </input>
	</header>
    <nav>
    	<ul>
  			<li class="start selected"><a href="index.jsp">Home</a></li>
            <li class=""><a href="Gaming_Consoles.html">Phycisian</a></li>
            <li class=""><a href="Speciality.jsp">Speciality</a></li>
			<li class=""><a href="preowned.html">About</a></li>
			<li class="end"><a href="Deals.html">Contact</a></li>
		</ul>
    </nav>

	<img class="header-image" src="images/img_tablets_banner.jpg" width = "100%" height = "100%" />

    <div id="body">		

	<section id="content">

	    <article>

			<h2>Description</h2>

            <p></p>

            <p></p>

		</article>
	
    </section>
        
    <aside class="sidebar">
	
            <ul>	
               <li>
                    <h4>New Patient</h4>
                    <ul>
                        <li><a href="login.jsp">Login</a></li>
                    </ul>
                </li>
				
				<li>
                    <h4>Existing Patient</h4>
                    <ul>
						<tr>
							<td> PatientID: </td>
							<td> <input type="text" name="patientID" value='<%=patientID%>'> </td>
						</tr>
                    </ul>
                </li>
				
				<li>
                    <h4>Reports</h4>
                    <ul>
                        <li><a href="login.jsp">Login</a></li>
                    </ul>
                </li>
                
                <li>
                    <h4>Help</h4>
                    <ul>
                        <li class="text">
                        	<p style="margin: 0;"> Help </p>
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
	       		<li><h4>GameSpeed</h4></li>
				<li><a href="#">Products</a></li>
                <li><a href="#">About Us</a></li>
			</ul>
           
        <div class="clear"></div>
        </div>
		
        <div class="footer-bottom">
            <p>Doctors Techno Gun Project - CSP595</p>
        </div>
		
    </footer>
</div>

</body>

</html>