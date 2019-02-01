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
        //
    }

    @Test
    public void testConnection() {
        assertNotNull(v.c);
    }
    
    @Test 
    public void getModCoord() throws SQLException{
    String expected = "Sarah Smith";
    String compare = v.getModCoord("AC21007");
    assertEquals(expected, compare);
    }
    
    @Test 
    public void getModName() throws SQLException{
    String expected = "Introduction to Java";
    String compare = v.getModName("AC31005");
    assertEquals(expected, compare);
    
    }
    @Test 
    public void getYear() throws SQLException{
    String expected = "2019";
    String compare = v.getYear("AC31005");
    assertEquals(expected, compare);
    
    }
    
    @Test
    public void testGetStage() throws SQLException {
        int expected = 5;
        int compare = v.getStage("AC21007");
        assertEquals(expected, compare);
    }
    
    @Test
    public void testGetModuleCodes() throws SQLException {
        ArrayList<String> expected = new ArrayList<String>();
        expected.add("AC21007");
        expected.add("AC22009");
        expected.add("AC31005");
        ArrayList<String> results = v.getModuleCodes("sarah");
        assertEquals(expected,results);
    }
    
    @Test 
    public void testSetIncreaseStage() throws SQLException{
        int expected = 6;
        v.setIncreaseStage("AC21007");
        int compare = v.getStage("AC21007");
        assertEquals(expected, compare);
    }
    
    @Test 
    public void testAddComments(){
        boolean expected = true;
        boolean compare = v.addComments("comments","AC21007");
        assertEquals(expected, compare);
    }
    
    @Test 
    public void testGetInternalModerator() throws SQLException{
        String expected = "Lesley";
        String compare = v.getInternalModerator("AC21007");
        assertEquals(expected, compare);
    }
        
    @Test 
    public void testGetExamVetting() throws SQLException{
        String expected = "lewis";
        String  compare = v.getExamVetting("AC21007");
        assertEquals(expected, compare);
    }
        
    @Test 
    public void testExternalModerator() throws SQLException{
        String expected = "finn";
        String compare = v.getExternalModerator("AC21007");
        assertEquals(expected, compare);
    }
}