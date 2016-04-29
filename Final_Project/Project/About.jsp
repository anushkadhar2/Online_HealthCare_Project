
<!-- About Us -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Your Health - We Care!</title>
	<link rel="stylesheet" href="styles.css" type="text/css" />
	<script type="text/javascript" language="JavaScript">
function HidePart(d) { document.getElementById(d).style.display = "none";  }
function ShowPart(d) { document.getElementById(d).style.display = "block"; }
function CheckboxChecked(b,d)
{
   if(b) { ShowPart(d); }
   else  { HidePart(d); }
}
</script>
<script type="text/javascript">
CheckboxChecked(document.myform.mycheckbox.checked,'checkboxdiv');
</script>
</head>

<body>
<div id="container">
    <header>
    	<h1><a href="/">Get to Know Us More</span></a></h1>
 
    </header>
    <nav>
    	<ul>
        	<li class=""><a href="index.jsp">Home</a></li>
        </ul>
    </nav>
	
   <marquee onmouseover="this.stop()" onmouseout="this.start()">
	<img class="header-image" src="images/psignedup.jpg" width = "100%" height = "100%" alt="Index Page Image" />
    <img class="header-image" src="images/newp.jpg" width = "100%" height = "100%" alt="Index Page Image" />	
	<img class="header-image" src="images/plogin.jpg" width = "100%" height = "100%" alt="Index Page Image" />
	<img class="header-image" src="images/pharmacy.jpg" width = "100%" height = "100%" alt="Index Page Image" />
	<img class="header-image" src="images/home.jpg" width = "100%" height = "100%" alt="Index Page Image" />
	<img class="header-image" src="images/reports.png" width = "100%" height = "100%" alt="Index Page Image" />
	
	
	
     </marquee>
	 <div id="body">		

	<section id="content">

	
<fieldset>

			<h2>Our Mission</h2>
		    <p>The mission of Electonic Health Record,Inc is to provide quality health services and facilities for the community, to promote wellness, to relieve suffering, and to restore health as swiftly, safely, and humanely as it can be done, consistent with the best service we can give at the highest value for all concerned.We are your partner for health, helping you live well by bringing the best in healthcare to your door.</p>


<p> <input type="checkbox" name="mycheckbox" value="yes" onclick="CheckboxChecked(this.checked,'checkboxdiv')">
check in to give your valuable suggestions.
</p>

<form name="myform" method="post" action="submitReview">
<div id="checkboxdiv" style="display:none">
<table>
			
				<tr>
					<td> Name: </td>
					<td> <input type="text" name="name" value="" > </td>         
				</tr>
				
                <tr>
				<td>I'm a:</td>
				<td>
                <select name='typeofcustomer'>
			    <option value='Patient' selected>Patient</option>
			     <option value='Doctor'>Doctor</option>
				 <option value='Other'>Other</option>
                  </td>
				</tr>
				<tr>
			   <td> Gender: </td>
					<td>
                <select name='gender'>
			    <option value='F' selected>Female</option>
			     <option value='M'>Male</option>
				 
                  </td>       
				</tr>
				<tr>
					<td> Age: </td>
					<td> <input type="text" name="age" value=""> </td>         
				</tr>
				             <tr>
			<td>Date: </td>
			<td> <input type='date' name='reviewDate'> </td>
			</tr>
                        
			  <tr>
				<td>Review On :</td>
				<td>
                <select name='Service'>
			    <option value='OverallServices' selected>Overall Services</option>
			     <option value='Lab'>Lab</option>
				 <option value='DoctorAppointment'>Doctor Appointment</option>
				 <option value='Pharmacy'>Pharmacy</option>
				 <option value='PatientRecords'>Patient Record's</option>
				 <option value='Appointment'>Appointment</option>
				
                  </td>
				</tr>
				<tr>
			<td>Review: </td>
			<td> <input type=\"textarea\" rows='4' cols="4" name='review'> </td>
			</tr>
                        <tr>
			<td>Rating: </td>
			<td>
                        <select name='rating'>
			<option value='0' selected>0</option>
			<option value='1'>1</option>
			<option value='2'>2</option>
                        <option value='3'>3</option>
                        <option value='4'>4</option>
                        <option value='5'>5</option>
			</tr>
			          <tr>
			<td> <input type='Submit' name='Submit' value= 'Submit Review'> </td>
			</tr>
				</table>
             </fieldset>
			 <fieldset>
	</fieldset>
				
	</div>	
	</form>
	
	  </section>
	      <aside class="sidebar">
	

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