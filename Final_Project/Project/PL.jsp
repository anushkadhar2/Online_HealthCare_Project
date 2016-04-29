<!doctype html>

<!-- INDEX -->
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
 
    </header>
    <nav>
    	<ul>
        	<li class="start selected"><a href="index.jsp">Home</a></li>
            <li class=""><a href="PhyHome.html">Physicians </a></li>
            <li class=""><a href="PatientHome.jsp">Patient Portal</a></li>
			<li class="end"><a href="Pharmacy.jsp">Pharmacy's</a></li>
        </ul>
    </nav>

	<img class="header-image" src="images/plogin.jpg" width = "100%" height = "100%" alt="Index Page Image" />

    <div id="body">		

	<section id="content">

	  
  <form method="post" action="/Project/LoginValidate">
		
		<fieldset>
			<legend>Medical Member ID Information Required:</legend>
		
			<table>
				<tr>
					<td> UserName: </td>
					<td> <input type="text" name="userName" value=''> </td>         
				</tr>
				
				<tr>
					<td> Password: </td>
					<td> <input type="password" name="password" value=''> </td>         
				</tr>
				
			</table>
		</fieldset>
		
		<fieldset>
			<br><br>
			<input type="reset"><input type="submit" name="loginValidate" value="Login">
<!--			<input type="submit" value="Submit Details"> -->
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