<!DOCTYPE html>
<html>
    <head>
    </head>
     
    <body>
        <h2>Payment Form</h2>
     
        <form id="buy-form" method="post" action="PlaceOrder.jsp">
           
			<fieldset>
            <p class="form-label">First Name:</p>
            <input class="text" id="first-name" name="firstName" required></input>
             
            <p class="form-label">Last Name:</p>
            <input class="text" id="last-name" name="lastName" required></input>
             
            <p class="form-label">Email Address:</p>
            <input class="text" id="email" name="email" required></input>
             
            <p class="form-label">Credit Card Number:</p>
            <input type="number" id="card-number" autocomplete="off" required></input>
             
            <p class="form-label">Expiration Date:</p>
            <form>
				<input type="date" name="creditcardyear" min="2015-10-30" required><br>
			</form>

            <p class="form-label">CVV:</p>
            <input class="text" size=3 id="card-security-code" autocomplete="off" required></input>
             
			<br><br>	
            <input class="submit-button" type="submit" name="placedOrder" value="Place Order"></input>
			</form>
			</fieldset>
        </form>
    </body>
</html>