<!doctype html>

<!-- INDEX -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Your Health - We Care!</title>
	<script type="text/javascript" src="javascript.js"></script>
	<link rel="stylesheet" href="styles.css" type="text/css" />
</head>

<body onload="init()">
<div id="container">
    <header>
    	<h1><a href="/">Electronic Health Records</span></a></h1>
	</header>
	<form name="autofillform" action="autocomplete">
			<table border = "0" cellpadding="5"> 
				<tbody>
					<tr>
						<td></td>
							<td align="center">
								<input type="search" size="40" id="complete-field" onkeyup="doCompletion()" placeholder="Search">
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
            <li class=""><a href="PhyHome.html">Physicians </a></li>
            <li class=""><a href="PatientHome.jsp">Patient Portal</a></li>
			<li class="end"><a href="Pharmacy.jsp">Pharmacys'</a></li>
			<li class="end"><a href="admin.jsp">Admin</a></li>
        </ul>
    </nav>

	<img class="header-image" src="images/home.jpg" width = "100%" height = "100%" alt="Index Page Image" />

    <div id="body">		

	<section id="content">

	    <article>
			
			 <h2>Welcome to EHR</h2>
             <p>We are a people centered environment, which means you are at the center of everything we do, and every decision we make. Here, patients are first, and we are transforming the delivery of healthcare across the nation, helping our communities live well. Every day, we are hard at work finding ways to enrich the patient experience, in service and treatment options.</p>	</article> <article class="expanded">
             <h3>A Hospital Management System, Deciding to make a difference!</h3>
			<br>
			
		</article>
    </section>
        
    <aside class="sidebar">
	
            <ul>	
               <li>
                    <h4>Get Online</h4>
                    <ul>
                        <li><a href="Doctor.jsp">Find a Doctor</a></li>
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