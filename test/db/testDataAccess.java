/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
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
public class testDataAccess {
    data_access da;
    
    public testDataAccess() {
    }
    
    @Before
    public void setUp() {
        da = new data_access();
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testConnection() {
        assertNotNull(da.c);
    }
    
    @Test
    public void testRunStatement() throws SQLException {
        ResultSet rs = da.run_statement("select * from users where username = 'sarah'");
        rs.next();
        String expected = rs.getString("UserID") + ", " + rs.getString("Password");
        assertEquals(expected, "Teacher, 123");
    }
}
