/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author finntorbet
 */
@WebServlet(name = "readPDF", urlPatterns = {"/readPDF"})
public class dbAccess {
    
    public dbAccess() {
        
    }
    
    /** Class to return all module codes
    * An overiding method should also be created with author parameters
    * 
    * Class started off returning a List/Array but using <c:forTokens, a string can
    * be given to achieve the same result
    * 
    * @finntorbet
    */
    public String getModuleCodes() {
        conn con = new conn();
        Connection c = con.connect();
        Statement stmt = null;
        String moduleCodes = "";
        
        try{
            stmt = c.createStatement();
            //WHERE statement needed here to specify which modular codes to return
            ResultSet rs = stmt.executeQuery("SELECT ModuleCode FROM exams");
            
            // yes I understand how ugly this code is, don't judge 
            boolean first = true;
            
            while(rs.next()) {
                String next = rs.getString("ModuleCode");
                if(!first) {
                    moduleCodes = moduleCodes + ", " + next; 
                } else {
                    moduleCodes = next;
                    first = false;
                }
            }
        } catch(SQLException e) {
            out.println("fail");
            e.printStackTrace();
        }
        
        return moduleCodes;
    }
    
}
