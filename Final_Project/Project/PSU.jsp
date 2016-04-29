<!doctype html>

<!-- Physician Sign Up -->
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
            <li class="end"><a href="Lab.jsp">Labs</a></li>
			<li class="end"><a href="Pharmacy.jsp">Pharmacy's</a></li>
        </ul>
    </nav>

	<img class="header-image" src="images/psignedup.jpg" width = "100%" height = "100%" alt="Index Page Image" />

    <div id="body">		

	<section id="content">

	  
  <form method="post" action="signup">
		
		<fieldset>
			<legend>New Physician Sign Up:</legend>
		
			<table>
			
				<tr>
					<td> Medical Council Registration Number: </td>
					<td> <input type="text" name="medicalID" value=''> </td>         
				</tr>

				<tr>
					<td> Medical Council Location: </td>
					<td> <input type="text" name="MCLoc" value=''> </td>         
				</tr>

				<tr>
					<td> First Name: </td>
					<td> <input type="text" name="fName" value=''> </td>         
				</tr>
				
				<tr>
					<td> Last Name: </td>
					<td> <input type="text" name="lName" value=''> </td>         
				</tr>
				
				<tr>
					<td> Speciality: </td>
					<td> <input type="text" name="speciality" value=''> </td>         
				</tr>
				
				<tr>
					<td> UserName: </td>
					<td> <input type="text" name="uname" value=''> </td>         
				</tr>
				
				<tr>
					<td> E-Mail: </td>
					<td> <input type="text" name="eMail" value=''></td>         
				</tr>
				
				<tr>
						<td>Phone No.</td>
						<td><input type="number" name="phone" align="center"></td>
				</tr>
	
				<tr>
					<td> Address: </td>
					<td>
					Street Name,Number<input type="text" name="street" value=''> <br>
					Apartment No.<input type="text" name="aptno" value=''> <br>
					City<input type="text" name="City" value=''> <br> 
					State<input type="text" name="State" value=''> <br>
					ZipCode<input type="number" name="zipcode" value=''> <br> </td>         
				</tr>
				
				<tr>
						<td>Password</td>
						<td><input type="password" name="pwd1" value="" align="center"></td>
				</tr>

				<tr>
						<td>Confirm Password</td>
						<td><input type="password" name="pwd2" value="" align="center"></td>
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