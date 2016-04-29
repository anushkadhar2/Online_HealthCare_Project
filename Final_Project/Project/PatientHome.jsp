<!doctype html>

<!-- INDEX -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Doctors' Techno Gun</title>
	<script type="text/javascript" src="javascript.js"></script>
	<link rel="stylesheet" type="text/css" href="styles.css"/>
</head>

<body onload="init()">
<div id="container">
    <header>
    	<h1><a href="/">Online Patient Management Portal</a></h1>
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
  			<li class="start selected"><a href="index.jsp">Home</a></li>
            <li class=""><a href="PhyHome.html">Find Doctor</a></li>
			<li class=""><a href="About.jsp">About</a></li>
		</ul>
    </nav>

	<img class="header-image" src="images/img_patient_portal.jpg" width = "100%" height = "100%" />

    <div id="body">		

	<section id="content">

	    <article>

			<h2>Description</h2>

            <p>Welcome to the Patient Portal - To view the list of all the available doctors please select from the available options and explore.</p>

            <p>We are here to serve you better...!!</p>

		</article>
	
    </section>
        
    <aside class="sidebar">
	
            <ul>	
               <li>
                    <h4>Login</h4>
                    <ul>
						<form method="get" action="/Project/FetchPatientDetails">
							<li><input type="text" name="pID" value='' onClick="this.value = '';"></li>
							<li><input type="hidden" name="flagForPatient" value="1"></li>
							<li><input type="submit" name="" value="Fetch Details"></li>
						</form>
					</ul>
					
					<ul>
						<li class=""><a href="Doctor.jsp">Find a Doctor</a></li>
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