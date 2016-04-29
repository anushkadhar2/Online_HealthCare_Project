<!doctype html>

<!-- Doctor HomePage -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Doctors' Techno Gun</title>
	<link rel="stylesheet" type="text/css" href="styles.css"/>
</head>

<body>
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
                    <h4>Login</h4>
                    <ul>
						<form method="post" action="/Project/LoginValidate">
                        <li><input type="text" name="userName" value="Username" onClick="this.value = '';"></li>
                        <li><input type="password" name="password" value="Password" onClick="this.value = '';"></li>
						<li><input type="reset"><input type="submit" name="loginValidate" value="Login"></li>
						</form>
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