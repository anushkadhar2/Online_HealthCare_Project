
1) Steps to start MongoDB 
   - Go to Program Files>MongoDB> Server> 3.0>bin>
   - Open cmd
   - exceute the command mongod
   -This will start the mongodb database
   -execute command mongo(optional)
2) Start Apache Tomcat Server  
	- Set environment variables
	- Then Go to C: drive>apache...>bin
        - execute the command startup
	- this will start the tomcat server
3) Open browser -> Browse to localhost/Project
4) Welcome to the main page

AJAX Implementation is dynamic wherein with every physician's account creation, patient would be able to search 
that physician using ajax live search. It is implemented on all the required pages.

ADMIN PORTAL [WITHOUT ADDING VALUES FROM ADMIN FOR DOCTOR,MEDICINE AND PHARMACY NOTHING WILL WORK]
5) To view all the functionalities, data should be added to the database and Doctor should be created first as he will be the one generating patient Id.
6) To add data to the database from scratch, browse to Admin option in the Navigation Bar and click on it.
7) Log in with user ID: admin and Password: admin
8) Click on Add Doctor to add the doctor into the database
9) You will be directed to the sign up page. Fill the form and click on Sign Up.
   You can also sign up for doctor by clicking on Physician tab.
   It will redirect to you to the Hello Doctor Page.
   From there you can SignUp.
10) The data will be directly stored into the mongodb
11) You can check it in mongodb by executing following command in mongodb cmd
12)  show  dbs
     use CSP_Project
     show collections
     db.Physicians.find().pretty()
Admin can add and delete the pharmacy

DOCTOR PORTAL
13) To log into the Physician account
    Click on the Physician tab on the navigation bar
    You will directed to the Hello Doctor Page
    Enter your user name and password
    Click Log in you will be directed to the doctor's portal

14) Doctor will be the only person who will create the patient account. When the doctor will register the patient, a new Id will be generated automatically which
    will remain the same throughout.
    
	- To register the new patient
	- Go to the Doctor's Portal
	- Select "New Patient" option shown on sidebar
	- You will be directed to patient registration page. In this you will provide the details about the patients and the prescriptions you will
          provide to the patient
	- Click on Submit Details
	- All the details regarding the patient and prescription will be stored in patientDetails collection.

15) To view the past prescription and the recently given prescriptions go to Hello Doctor Page.
    - Inside the Patient Information side bar type the Patient Id that will be created and click on Fetch details.
    - You will be directed to te Fetch Detail Patient Page were you will be able to check all the prescriptions and details related to patient.
    - Prescriptions will be searched on the basis on date.
    - Once physician creates a prescription for new patient, he can use that prescription to modify the patient when he revisits him/her.  

PATIENT PORTAL
16) The patient can fetch details regarding about him by following way :
    -Click on Patient Portal
    -You will be directed to the Patient Management Portal
   - In the login side type the Patient id Given By Doctor
   - Click on fetch details
   - Patient will be able to see its prescriptions and details.

17)  The patient can also search for a doctor
    - Click on Find a Doctor in GetOnline sidebar
    - You will be directed to find doctor page
   -There the patient can see the different doctor and can write feedback and view feedback
   - The patient can check the location of the doctor by clicking on LOcate Me . The patient will be directed to the Google  Maps.
18) The patient can purchase the medicines. Medicine can only be bought by patients who have logged into the system
    -Click on Medicine present in Get Online Sidebar.
    - Patient will be directed to the Medicine Page.
    - Patient can check and order the required medicine.
19) To order the medicine click on Buy 
    - You will be directed to Place Order Place
    -Click on Add To Cart
    -From there you can delete the medicine by clicking on Remove button
   - To pay for the order click on CHECKOUT.
 20) Patient will be directed to the payment Form
     -Enter your personal details.
     -Click on Place order
    - The order will be successfully generated and you will be provided with the Delivery date,Cancellation date and Confirmation Number.

Pharmacy
-Pharmacies can see the patients prescription by typing the patient Id. So the patient doesn't need to carry prescription with him.
-Patient can search for the pharmacy by clicking on View All Pharmacies option in the side.
    
Customer ID is like SSN - Unique

Total Lines of Code : 6717.