package com.ajax;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Iterator;

/**
 *
 * @author nbuser
 */
public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    private ComposerData compData;
    private HashMap composers;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

		compData = new ComposerData();
		composers = compData.getComposers();	
        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {

            // check if user sent empty string
            if (!targetId.equals("")) {

                Iterator it = composers.keySet().iterator();

                while (it.hasNext()) {
                    String id = (String) it.next();
                    Composer composer = (Composer) composers.get(id);

                    if ( // targetId matches first name
                         composer.getFirstName().toLowerCase().startsWith(targetId) ||
                        // targetId matches last name
                         composer.getLastName().toLowerCase().startsWith(targetId) ||
						//targetID matches Speciality 
						 composer.getSpeciality().toLowerCase().startsWith(targetId) ||
						// targetId matches full name
                         composer.getFirstName().toLowerCase().concat(" in ")
							.concat(composer.getLastName().toLowerCase())
                            .concat(composer.getSpeciality().toLowerCase()).startsWith(targetId)){

                        sb.append("<composer>");
                        sb.append("<id>" + composer.getId() + "</id>");
                        sb.append("<fName>" + composer.getFirstName() + "</fName>");
                        sb.append("<lName>" + composer.getLastName() + "</lName>");
						sb.append("<speciality>" + composer.getSpeciality() + "</speciality>");
                        sb.append("</composer>");
                        namesAdded = true;
                    }
                }
            }

            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<composers>" + sb.toString() + "</composers>");
            } else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        if (action.equals("lookup")) {

            // put the target composer in the request scope to display 
            if ((targetId != null) && composers.containsKey(targetId.trim())) {
                request.setAttribute("composer", composers.get(targetId));
                Composer composer1 = (Composer) composers.get(targetId);

				System.out.println(" Check me -> "+composer1.getSpeciality()+" !");
				if(composer1.getSpeciality() != null)
				{   
					context.getRequestDispatcher("/Doctor.jsp").forward(request, response);					
				} else if (composer1.getFirstName()!=null) {
					context.getRequestDispatcher("/Doctor.jsp").forward(request, response);
				}
            }
        }
    }
}
