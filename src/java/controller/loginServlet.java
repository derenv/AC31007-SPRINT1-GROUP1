/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author sarahsmall
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          String _username = request.getParameter("username");
          String _password = request.getParameter("password");
          
          try {
              Class.forName("com.mysql.jdbc.Driver");  //loads driver
            
          Connection c = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/18agileteam1db", "18agileteam1", "7845.at1.5487");
          
          PreparedStatement ps = c.prepareStatement("SELECT UserID FROM users where Username=? and Password=?");
          
        
          ps.setString(1, _username);
          ps.setString(2, _password);
 
          ResultSet rs = ps.executeQuery();
          
	  while (rs.next()) {
                String type=rs.getString("UserID");
                if ("Teacher".equals(type)){
                response.sendRedirect("HTML/teacherDash.html");
                return;
                }
                else if ("Admin".equals(type)){
                response.sendRedirect("HTML/adminDash.html");
                return;
                }
                else if ("ExternalMod".equals(type)){
                response.sendRedirect("HTML/externalModDash.html");
                return;
                }
                else if ("InternalMod".equals(type)){
                response.sendRedirect("HTML/internalModDash.html");
                return;
                }
                else if ("ExternalVet".equals(type)){
                response.sendRedirect("HTML/examVettingDash.html");
                return;
                }
              
              
	  }
          response.sendRedirect("error.jsp");
	  return;  
	  
	  } catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
                        out.println("fail");
			e.printStackTrace();
		}
	}

              
         
        
          
           
        
    
    
  
  


  

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
