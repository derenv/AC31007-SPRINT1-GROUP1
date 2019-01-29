/*
 * @author Finn Torbet
    28/01/19

    Class will create a select statement and allow the class to cycle through the result set by calling the next function 
 */
package db;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author finntorbet
 */
public class viewExams {

    Connection c;
    String username;
    String role;

    /**
     * Constructor
     *
     * @author finn torbet and lewis christie
     */
    public viewExams(String username, String role) {
        conn conn1 = new conn();
        c = conn1.connect();
        this.username = username;
        this.role = role;
    }

    /**
     * @author finn torbet and lewis christie
     *
     * @param username, username of specified user
     * @param role, role of specified user (Teacher, InternalModerator, ExternalModerator, ExamVet)
     * @return String[] moduleCodes, the modules that the user is assigned to
     */
    public ArrayList<String> getModuleCodes(String username) {
        // Maximum set to 20 as this is the maximum number of modules a school will have a semester
        ArrayList<String> moduleCodes = new ArrayList<String>();
        
        data_access da = new data_access();
        
        try {
            //ResultSet rs = da.run_statement("select * from exams where " + role + "='" + username + "'");
            Object[] params = {username};
            ResultSet rs = da.run_statement("select ModuleCode from exams where Teacher=?",params);
            while (rs.next()) {
                moduleCodes.add(rs.getString("ModuleCode"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return moduleCodes;
    }
    
    /**
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution
     * @return 
     */
    public String getExam(String ModuleCode) {
        String examPath = "";
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select pdf_path from pdf where Mod_code='" + ModuleCode + "' and type = 'Main'");
            rs.next();
            examPath = rs.getString("pdf_path");
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return examPath;
    }
    
    public String getExamSolution(String ModuleCode) {
        String examPath = "";
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select pdf_path from pdf where Mod_code='" + ModuleCode + "' and type = 'MainSolution'");
            rs.next();
            examPath = rs.getString("pdf_path");
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return examPath;
    }
    
    public String getResit(String ModuleCode) {
        String examPath = "";
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select pdf_path from pdf where Mod_code='" + ModuleCode + "' and type = 'Resit'");
            rs.next();
            examPath = rs.getString("pdf_path");
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return examPath;
    }
    
    public String getResitSolution(String ModuleCode) {
        String examPath = "";
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select pdf_path from pdf where Mod_code='" + ModuleCode + "' and type = 'ResitSolution'");
            rs.next();
            examPath = rs.getString("pdf_path");
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return examPath;
    }
    
    /**
     * Additional get methods for returning method data, functions identical to above set of methods
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution 
     * @return String[] list, returns the meta data in the format
     * MODULE COORDINATOR, MODULE NAME, YEAR
     */
    public String[] getMeta(String ModuleCode) {
        String[] meta = new String[3];
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ModuleCoordinator, ModuleName, Year from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            meta[0] = rs.getString("ModuleCoordinator");
            meta[1] = rs.getString("ModuleName");
            meta[2] = rs.getString("Year");
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return meta;
    }
    
    /**
     * Method to return current stage for a specified module
     * 
     * @param
     * @return
     * @author
     */
    public int getStage(String ModuleCode) {
        int stage = 0;
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select Stage from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            stage = rs.getInt("stage");
            System.out.println("stage has been found");
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return stage;
    }

}
