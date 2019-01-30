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
     * @return arrayList<string> moduleCodes, the modules that the user is assigned to
     */
    public ArrayList<String> getModuleCodes(String username) {
        // can return any amount of modules for a specific user
        
        //array list used instead of string[] - sorry finn
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
    public byte[] getExam(String ModuleCode) throws SQLException {
     
        Blob exam = null;
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select Exam from pdf where ModuleCode='" + ModuleCode + "'");
            while(rs.next()){
             System.out.print("Your blob has been created");
              exam = rs.getBlob("Exam");
             
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (exam !=    null  ) { 
        return exam.getBytes((long)1, (int)exam.length());
        }
        else
            return null;
    
    }
    
  
    
     /**
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution
     * @return 
     */
    public byte[] getSolution(String ModuleCode) throws SQLException {
     
        Blob exam = null;
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ExamSolution from pdf where ModuleCode='" + ModuleCode + "'");
            while(rs.next()){
             System.out.print("Your blob has been created");
              exam = rs.getBlob("Exam");
             
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (exam !=    null  ) { 
        return exam.getBytes((long)1, (int)exam.length());
        }
        else
            return null;
    
    }
  /**
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution
     * @return 
     */
    
    public byte[] getResit(String ModuleCode) throws SQLException {
     
        Blob exam = null;
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select Resit from pdf where ModuleCode='" + ModuleCode + "'");
            while(rs.next()){
             System.out.print("Your blob has been created");
              exam = rs.getBlob("Exam");
             
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (exam !=    null  ) { 
        return exam.getBytes((long)1, (int)exam.length());
        }
        else
            return null;
    
    }
    
    public byte[] getResitSolution(String ModuleCode) throws SQLException {
     
        Blob exam = null;
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ResitSolution from pdf where ModuleCode='" + ModuleCode + "'");
            while(rs.next()){
             System.out.print("Your blob has been created");
              exam = rs.getBlob("Exam");
             
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (exam !=    null  ) { 
        return exam.getBytes((long)1, (int)exam.length());
        }
        else
            return null;
    
    }
    

    
    /**
     * gets the module coordinator for an exam
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution 
     * @return String[] list, returns the meta data in the format
     * MODULE COORDINATOR,
     */ 
    public String getModCoord(String ModuleCode){
    String modCoord ="";
    data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ModuleCoordinator from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            modCoord = rs.getString("ModuleCoordinator");
   
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return modCoord;
    }
     /**
     * gets the module name for an exam
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution 
     * @return String
     * MODULE NAME
     */ 
      public String getModName(String ModuleCode){
    String modName ="";
    data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ModuleName from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            modName = rs.getString("ModuleName");
   
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return modName;
    }
       /**
     * gets the module name for an exam
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution 
     * @return String
     * MODULE NAME
     */ 
      public String getYear(String ModuleCode){
    String year ="";
    data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select Year from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            year = rs.getString("Year");
   
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        return year;
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
