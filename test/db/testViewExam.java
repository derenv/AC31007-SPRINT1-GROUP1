/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author sarahsmall
 */
public class testViewExam {
    
    
    public testViewExam() {
    }
    
    @Before
    public void setUp() {
        
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testConnection() {
        viewExams v = new viewExams("test", "test");
        assertNotNull(v.c);
    }
    
    @Test
    public void testReturnExamsTeacher() {
        viewExams v = new viewExams("test", "Teacher");
        String[] compare = v.getModuleCodes();
        String[] expected = new String[20];
        expected[0] = "Test1";
        expected[1] = "Test2";
        expected[2] = "Test3";
        assertArrayEquals(expected, compare);
    }

    @Test
    public void testReturnExamsModerator() {
        viewExams v = new viewExams("testIMod@dundee.ac.uk", "InternalModerator");
        String[] compare = v.getModuleCodes();
        String[] expected = new String[20];
        expected[0] = "Test1";
        expected[1] = "Test2";
        expected[2] = "Test3";
        assertArrayEquals(expected, compare);
    }
    
    @Test
    public void testGetExamPath() {
        viewExams v = new viewExams("test", "Teacher");
        String compare = v.getExam("Test1");
        String expected = "testFilePath";
        assertEquals(expected, compare);
    }
    
    @Test
    public void testGetExamSolutionPath() {
        viewExams v = new viewExams("test", "Teacher");
        String compare = v.getExamSolution("Test1");
        String expected = "testFilePathSolution";
        assertEquals(expected, compare);
    }
    
    @Test
    public void testGetResitPath() {
        viewExams v = new viewExams("test", "Teacher");
        String compare = v.getResit("Test1");
        String expected = "testFilePathResit";
        assertEquals(expected, compare);
    }
    
    @Test
    public void testGetResitSolutionPath() {
        viewExams v = new viewExams("test", "Teacher");
        String compare = v.getResitSolution("Test1");
        String expected = "testFilePathResitSolution";
        assertEquals(expected, compare);
    }
    
    @Test
    public void testGetMeta() {
        viewExams v = new viewExams("test", "test");
        String[] expected = {"testName", "TestModule1", "testYear"};
        String[] compare = v.getMeta("Test1");
        assertArrayEquals(expected, compare);
    }
}
