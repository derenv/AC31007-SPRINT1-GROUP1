/*
 * 10 TESTS FOR VIEW EXAMS
 * BYTE STRINGS RETURN NULL - AS THERE IS NO PDF STORED FOR THAT EXAM 
 * NOT SURE HOW TO TEST FOR IS BYTE STRING NOT NULL - BUT IS WORKING.
 * 
 */
package db;

import java.util.ArrayList;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.Assert;


/**
 *
 * @author sarahsmall
 */
public class testViewExam {
    viewExams v;
    
    public testViewExam() {
    }
    
    @Before
    public void setUp() {
        //v = new viewExams("test", "Teacher");
        v = new viewExams("finn", "ExternalMod");
    }
    
    @After
    public void tearDown() {
      
    }

    @Test
    public void testConnection() {
        assertNotNull(v.c);
    }
    
   
    @Test 
    public void getModCoord() throws SQLException{
    String expected = "sarah";
    String compare = v.getModCoord("ACTEST1");
    assertEquals(expected, compare);
    }
    
    @Test 
    public void getModName() throws SQLException{
    String expected = "test1Name";
    String compare = v.getModName("ACTEST1");
    assertEquals(expected, compare);
    
    }
    @Test 
    public void getYear() throws SQLException{
    String expected = "2019";
    String compare = v.getYear("ACTEST1");
    assertEquals(expected, compare);
    
    }
    
    @Test
    public void testGetStage() throws SQLException {
        int expected = 6;
        int compare = v.getStage("ACTEST1");
        assertEquals(expected, compare);
    }
    
    @Test
    public void testGetModuleCodes() throws SQLException {
        ArrayList<String> expected = new ArrayList<String>();
        expected.add("AC21342");
        expected.add("ACTEST1");
        expected.add("ACTEST2");
        ArrayList<String> results = v.getModuleCodes("sarah");
        assertEquals(expected,results);
    }
    
    @Test 
    public void  testGetExamSolutions(){
    byte[] result = null;
    byte[] compare = null;
        try {
            compare = v.getSolution("ACTEST4");
        } catch (SQLException ex) {
            Logger.getLogger(testViewExam.class.getName()).log(Level.SEVERE, null, ex);
        }
    Assert.assertArrayEquals(compare,result);
    
    
    }
    @Test 
    public void  testGetExam(){
    byte[] result = null;
    byte[] compare = null;
        try {
            compare = v.getExam("ACTEST6");
        } catch (SQLException ex) {
            Logger.getLogger(testViewExam.class.getName()).log(Level.SEVERE, null, ex);
        }
    Assert.assertArrayEquals(compare,result);
    
    
    }

    @Test 
    public void  testGetSolution(){
    byte[] result = null;
    byte[] compare = null;
        try {
            compare = v.getSolution("ACTEST6");
        } catch (SQLException ex) {
            Logger.getLogger(testViewExam.class.getName()).log(Level.SEVERE, null, ex);
        }
    Assert.assertArrayEquals(compare,result);
    
    
    }
     @Test 
    public void  testGetResitSolution(){
    byte[] result = null;
    byte[] compare = null;
        try {
            compare = v.getResitSolution("ACTEST6");
        } catch (SQLException ex) {
            Logger.getLogger(testViewExam.class.getName()).log(Level.SEVERE, null, ex);
        }
    Assert.assertArrayEquals(compare,result);
    
    
    }
    @Test 
    public void testSetIncreaseStage() throws SQLException{
        int expected = 3;
        v.setIncreaseStage("ACTEST3");
        int compare = v.getStage("ACTEST3");
        assertEquals(expected, compare);
    
    }
    
    
}

