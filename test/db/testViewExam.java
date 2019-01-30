/**
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor
 * 
 * @author finntorbet
 */
package db;

import java.util.ArrayList;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import java.sql.Blob;
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
        v = new viewExams("test", "Teacher");
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testConnection() {
        assertNotNull(v.c);
    }
    
   
    @Test 
    public void getModCoord(){
    String expected = "sarah";
    String compare = v.getModCoord("ACTEST1");
    assertEquals(expected, compare);
    }
    
    @Test 
    public void getModName(){
    String expected = "test1Name";
    String compare = v.getModName("ACTEST1");
    assertEquals(expected, compare);
    
    }
    @Test 
    public void getYear(){
    String expected = "2019";
    String compare = v.getYear("ACTEST1");
    assertEquals(expected, compare);
    
    }
    
    @Test
    public void testGetStage() {
        int expected = 5;
        int compare = v.getStage("ACTEST1");
        assertEquals(expected, compare);
    }
    
    @Test
    public void testGetModuleCodes() {
        ArrayList<String> expected = new ArrayList<String>();
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
}
   
    

