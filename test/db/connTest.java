/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
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
    
    @Before
    public void setUp() {
    }

    @Test
    public void testConn() {
        Connection work = c.connect();
        assertNotNull(work);
    }
    
}