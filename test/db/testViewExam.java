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
        String[] expected = {"ACTEST1","ACTEST2","ACTEST3","ACTEST4"};
        String[] results = v.getModuleCodes();
        assertArrayEquals(expected, results);
    }
    
    
}
