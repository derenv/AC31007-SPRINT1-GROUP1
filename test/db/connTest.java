/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author finntorbet
 */
public class connTest {
    conn c;
    Connection work;
    
    @Before
    public void setUp() {
        c = new conn();
        work = c.connect();
    }

    @Test
    public void testConn() {
        assertNotNull(work);
    }
    
    @Test
    public void testCatalog() {
        String compare = "";
        String expected = "18agileteam1db";
        try {
            compare = work.getCatalog();
        } catch (SQLException ex) {
            Logger.getLogger(connTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        assertEquals(expected, compare);
    }
    
}
