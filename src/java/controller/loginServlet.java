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
          PreparedStatement ps = c.prepareStatement("SELECT Username, Password FROM teachers where Username=? and Password=?");
          
          ps.setString(1, _username);
          ps.setString(2, _password);
 
          ResultSet rs = ps.executeQuery();
 
	  while (rs.next()) {
                response.sendRedirect("welcome.jsp");
              
                return;
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
