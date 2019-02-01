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
    public ArrayList<String> getModuleCodes(String username) throws SQLException {
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
         c.close();      
        System.out.print("connection closed");
        
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
             c.close();      
        System.out.print("connection closed");
        return exam.getBytes((long)1, (int)exam.length());
        }
        else
             c.close();      
        System.out.print("connection closed");
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
             System.out.print("Your blob solutions has been created");
              exam = rs.getBlob("ExamSolution");
             
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (exam !=    null  ) { 
             c.close();      
        System.out.print("connection closed");
        return exam.getBytes((long)1, (int)exam.length());
        }
        else
             c.close();      
        System.out.print("connection closed");
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
              exam = rs.getBlob("Resit");
             
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (exam !=    null  ) { 
             c.close();      
        System.out.print("connection closed");
        return exam.getBytes((long)1, (int)exam.length());
        }
        else
            c.close();
            System.out.print("connection closed");
            return null;
    
    }
    
    public byte[] getResitSolution(String ModuleCode) throws SQLException {
     
        Blob exam = null;
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ResitSolution from pdf where ModuleCode='" + ModuleCode + "'");
            while(rs.next()){
             System.out.print("Your blob has been created");
              exam = rs.getBlob("ResitSolution");
             
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (exam !=    null  ) { 
             c.close();      
        System.out.print("connection closed");
        return exam.getBytes((long)1, (int)exam.length());
        }
        else
             c.close();      
        System.out.print("connection closed");
            return null;
    
    }
    

    
    /**
     * gets the module coordinator for an exam
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution 
     * @return String[] list, returns the meta data in the format
     * MODULE COORDINATOR,
     */ 
    public String getModCoord(String ModuleCode) throws SQLException{
    String modCoord ="";
    data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ModuleCoordinator from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            modCoord = rs.getString("ModuleCoordinator");
   
        } catch(Exception e) {
            e.printStackTrace();
        }
        c.close();      
        System.out.print("connection closed");       
        return modCoord;
    }
     /**
     * gets the module name for an exam
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution 
     * @return String
     * MODULE NAME
     */ 
      public String getModName(String ModuleCode) throws SQLException{
    String modName ="";
    data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ModuleName from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            modName = rs.getString("ModuleName");
   
        } catch(Exception e) {
            e.printStackTrace();
        }
        c.close();      
        System.out.print("connection closed");
        return modName;
    }
       /**
     * gets the module name for an exam
     * 
     * @param ModuleCode, the module that the user wants the relevant file path for, for either exam, exam solution, resit or resist solution 
     * @return String
     * MODULE NAME
     * @throws java.sql.SQLException
     */ 
    public String getYear(String ModuleCode) throws SQLException{
    String year ="";
    data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select Year from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            year = rs.getString("Year"); 
            c.close();
   
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
    public int getStage(String ModuleCode) throws SQLException {
        int stage = 0;
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select Stage from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            stage = rs.getInt("Stage");
        } catch(Exception e) {
            e.printStackTrace();
        }
          c.close();       
          System.out.print("connection closed");
        return stage;
    }
    
    //DOES work now
    
      public void setIncreaseStage(String ModuleCode) {
        
       
        try{
            Connection c;
            conn conn1 = new conn();
            c = conn1.connect();
            Statement stmt = c.createStatement();
            String sql = ("update exams set Stage = Stage+1 where ModuleCode='"+ModuleCode+"' ");
            stmt.executeUpdate(sql);

    c.close();
           
            
        } catch(Exception e) {
            e.printStackTrace();
        }
                
        
    }
      
        public boolean addComments(String Comments, String ModuleCode) {
        
       
        try{
            Connection c;
            conn conn1 = new conn();
            c = conn1.connect();
            Statement stmt = c.createStatement();
            String sql = ("update exams set Comments = '"+Comments+"' where ModuleCode='"+ModuleCode+"' ");
            stmt.executeUpdate(sql);
            

    c.close();
    return true;       
            
        } catch(Exception e) {
            e.printStackTrace();
             return false;    
            
        }
                
        
    }
      
    
    /**
     * Method to return access privileges for the user
     * 
     * @author finntorbet and mikhailpolishchouk
     */
    public boolean getAccessPrivileges(String ModuleCode) throws SQLException {
        
        //returns true if admin or teacher has override rights
        if("Teacher".equals(role) || "Admin".equals(role)) {
            return true;
        }
        
        int stage = 0;
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select Stage from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            stage = rs.getInt("stage");
            
        } catch(Exception e){
            e.printStackTrace();
        }
        
        switch(stage){
            case 2:
                if ("InternalModerator".equals(role)){
                    return true;
                }
                return false;
            case 4:
                if ("ExternalVet".equals(role)){
                    return true;
                }
                return false;
            case 6:
                if ("ExternalModerator".equals(role)){
                    return true;
                }
                return false;
            default: 
                return false;
        }      
         
    }
    
    public String getRole(){return this.role;}
        
     /**
     * @author finn torbet and lewis christie
     *
     * @param username, username of specified user
     * @param role, role of specified user (Teacher, InternalModerator, ExternalModerator, ExamVet)
     * @return arrayList<string> moduleCodes, the modules that the user is assigned to
     */
    public ArrayList<String> getModuleCodesInternal(String username) throws SQLException {
        // can return any amount of modules for a specific user
        
        //array list used instead of string[] - sorry finn
        ArrayList<String> moduleCodes = new ArrayList<String>();
        
        data_access da = new data_access();
        
        try {
            //ResultSet rs = da.run_statement("select * from exams where " + role + "='" + username + "'");
            Object[] params = {username};
            
            ResultSet rs = da.run_statement("select ModuleCode, Stage from exams where InternalModerator=?",params);
            while (rs.next()) {
                String moduleCode = rs.getString("ModuleCode");
                int stage = rs.getInt("Stage");
                if( stage == 1){        
                moduleCodes.add(moduleCode);}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
         c.close();      
        System.out.print("connection closed");
        
        return moduleCodes;
    }
    
     public String getInternalModComs(String ModuleCode) throws SQLException{
     String InternalModComs ="";
     data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select InternalModComs from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            InternalModComs = rs.getString("InternalModComs"); 
            c.close();
   
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (InternalModComs == null){InternalModComs ="No Comments yet";}        
        return InternalModComs;
    }
     
     public String getExternalModComs(String ModuleCode) throws SQLException{
     String ExternalModComs ="";
     data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ExternalModComs from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            ExternalModComs = rs.getString("ExternalModComs"); 
            c.close();
   
        } catch(Exception e) {
            e.printStackTrace();
        }
        if (ExternalModComs == null){ExternalModComs ="No Comments yet";}        
        return ExternalModComs;
    }
     
     
    public String getInternalModerator(String ModuleCode) throws SQLException{
    String InternalModerator ="";
    data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select InternalModerator from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            InternalModerator = rs.getString("InternalModerator"); 
            c.close();
   
        } catch(Exception e) {
            e.printStackTrace();
        }
         if (InternalModerator == null){InternalModerator ="No internal moderator selected";}           
        return InternalModerator;
    }
    
    public String getExternalModerator(String ModuleCode) throws SQLException{
    String externalModerator ="";
    data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select externalModerator from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            externalModerator = rs.getString("ExternalModerator"); 
            c.close();
   
        } catch(Exception e) {
            e.printStackTrace();
        }
         if (externalModerator == null){externalModerator ="no external moderator selected";}          
        return externalModerator;
    }
    
      public String getExamVetting (String ModuleCode) throws SQLException{
        String externalModerator ="";
        data_access da = new data_access();
        try{
            ResultSet rs = da.run_statement("select ExamVetting from exams where ModuleCode='" + ModuleCode + "'");
            rs.next();
            externalModerator = rs.getString("ExamVetting"); 
            c.close();
   
        } catch(Exception e) {
            e.printStackTrace();
        }
         if (externalModerator == null){externalModerator ="no Exam vetter selected";}          
        return externalModerator;
    }

}
