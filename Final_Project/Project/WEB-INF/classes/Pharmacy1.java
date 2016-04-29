import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Pharmacy1 extends HttpServlet {
	
				public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		        PrintWriter out = response.getWriter();
			
				
				
				out.println("<html>");
				out.println("<head>");
				out.println("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
	            out.println("<title>Your Health - We Care!</title>");
	            out.println("<link rel='stylesheet' href='webPage.css' type='text/css' />");
				out.println("</head>");
				
				out.println("<body>");
			    out.println("<div id='container'>");
				out.println(" <header>");
				out.println(" <h2>Electronic Health Records</h2>");
				out.println(" </header>");
				out.println("<nav>");
				out.println("<ul>");
				out.println("<li class='start selected'><a href='index.jsp'>Home</a></li>");
				out.println("<li><a href='/'>Prescriptions</a></li>");
				out.println("<li><a href='/'>Support</a></li>");
				out.println("</ul>");
				out.println("</nav>");
				out.println("<img class='header-image' src='images/home.jpg' width = '100%' height = '100%' alt='Index Page Image' />");
				out.println("<div id='body'>");
				out.println("<section id='content'>");
				out.println("<article>");
				out.println("<h2>PHARMACY</h2>");
				out.println("<p>Following are the pharmacy details</p>");
				
				out.println("</article>");
				out.println("<article class='expanded'>");
				
				
				String token_new = " " ;
				BufferedReader buffer_reader = new BufferedReader(new FileReader("C:/apache-tomcat-7.0.34/webapps/Project1/itemDetails.txt"));
		
				String currentLine = "";
				while((currentLine=buffer_reader.readLine())!=null ){
			
				String temp[] = currentLine.split("-");
				String temp1[] = temp[1].split(",|\\[|\\]");
			
					
				token_new = temp[0];
			
				String str  = token_new.substring(0,4);
			
				if(str.equals("Phar")){
				
					
			    //out.println("<h4>Type :</h4>");
			    out.println("<table>");
			    out.println("<tr>");
				out.println("<td> Pharmacy Id: </td><td><input type='text' name='pharId' value ="+token_new+" readonly ></td></tr>");
				out.println("<tr><td> Pharmacy Name: </td><td><input type='text' name = 'pharName' value="+temp1[1]+" readonly></td></tr>");
				out.println("<tr><td> Pharmacy Address: </td><td><input type='text' name = 'pharAddress' value="+temp1[2]+" readonly></td></tr>");
				
				
				/*
				out.println("<form class = 'submit-button' method = 'post' action = 'Reviews'>");
				out.println("<input class = 'submit-button' type = 'submit' name = 'writeReview' value = 'Write Review'>");
				out.println("<input  type = 'hidden' name = 'productId' value = "+token_new+">");
				out.println("<input  type = 'hidden' name = 'productName' value = "+temp1[1]+">");
				out.println("<input  type = 'hidden' name = 'productPrice' value = "+temp1[2]+">");
				out.println("<input  type = 'hidden' name = 'productType' value = "+temp1[3]+">");
				out.println("</form>");
				
				out.println("<form class = 'submit-button' method = 'get' action = 'ViewReviews'>");
				out.println("<input class = 'submit-button' type = 'submit' name = 'viewReviews' value = 'View Reviews'>");
				out.println("<input  type = 'hidden' name = 'productId' value = "+token_new+">");
				out.println("<input  type = 'hidden' name = 'productName' value = "+temp1[1]+">");
				out.println("<input  type = 'hidden' name = 'productPrice' value = "+temp1[2]+">");
				out.println("</form>");
				
				out.println("<form class = 'submit-button' method = 'get' action = 'addToCart'>");
				out.println("<input class = 'submit-button' type = 'submit' name = 'addToCart' value= 'Add to Cart '>");
				out.println("<input  type = 'hidden' name = 'productId' value = "+token_new+">");
				out.println("<input  type = 'hidden' name = 'productName' value = "+temp1[1]+">");
				out.println("<input  type = 'hidden' name = 'productPrice' value = "+temp1[2]+">");
				*/
				out.println("</form>");
				out.println("</table>");
				
				
				out.println("</article>");
				
				
			}
			}
			   
			
				out.println("</div>");
				
				
				out.println("<footer>");
	           
				out.println("<div class='footer-bottom'>");
				out.println("<p>@Electronic Health Record, Inc</p>");
				out.println("</div>");
		
				out.println("</footer>");
				
				
				out.println("</body>");
				out.println("</html>");
			
			
				
				}
			}
		