package com.ajax;

import java.util.HashMap;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.ServerAddress;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
/**
 *
 * @author nbuser
 */
public class ComposerData {
    
    private HashMap composers = new HashMap();
    
    public HashMap getComposers() {
        return composers;
    }
    
    public ComposerData() {
        
	int i = 1;
	String id="";
    String FirstName = " ";
	String LastName = " ";
	String Speciality = " ";
	
	MongoClient mongo = new MongoClient("localhost", 27017);
						
	DB db = mongo.getDB("CSP_Project");
			
	DBCollection searchPhysician  = db.getCollection("Physicians");
	
	DBCursor PhysicianCursor = searchPhysician.find();

	if(PhysicianCursor.count() > 0)
	{
		while(PhysicianCursor.hasNext())
		{
			BasicDBObject docdb = (BasicDBObject) PhysicianCursor.next();
			FirstName = docdb.getString("fName");
			LastName = docdb.getString("lName");
			Speciality = docdb.getString("speciality");
			id = String.valueOf(i);
			composers.put(id, new Composer(id, FirstName, LastName, Speciality));
			i++;			
		}
	}
}

}