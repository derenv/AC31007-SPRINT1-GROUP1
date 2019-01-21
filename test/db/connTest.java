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
 * @author finntorbet
 */
public class connTest {
    conn c;
    
    public connTest() {
    }
    
    @Before
    public void setUp() {
        c = new conn();
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testConn() {
        boolean work = c.connect();
        assertTrue(work);
    }
    
    
}
