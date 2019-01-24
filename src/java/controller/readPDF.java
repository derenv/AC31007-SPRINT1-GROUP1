/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.conn;
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
@WebServlet(name = "readPDF", urlPatterns = {"/readPDF"})
public class readPDF extends HttpServlet {

   

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
            try {
              Class.forName("com.mysql.jdbc.Driver");  //loads driver
            
         Connection c = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/18agileteam1db", "18agileteam1", "7845.at1.5487");
          
          PreparedStatement ps = c.prepareStatement("SELECT * FROM users ");
          
          

          
          ResultSet rs = ps.executeQuery();
          
          while (rs.next()) {
               
               
           String type= rs.getString("Module1");
             
            out.println(type);
                
                
              
              
	  }
          
	   
	  
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

