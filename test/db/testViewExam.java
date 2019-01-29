/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
    public void testGetMeta() {
        String[] expected = {"sarah", "test1Name", "2019"};
        String[] compare = v.getMeta("ACTEST1");
        assertArrayEquals(expected, compare);
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
