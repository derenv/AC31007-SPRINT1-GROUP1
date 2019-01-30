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
    
    //@Test 
   // public void  testGetExam(){
    //Blob result = null;
   // Blob compare = v.getExam("ACTEST4");
    //assertEquals(compare,result);
    
    
    //}
    
    
}
