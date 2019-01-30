/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    public void testClose() {
        try {
            da.close();
            assertTrue(da.c.isClosed());
        } catch (SQLException ex) {
            Logger.getLogger(testDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Test
    public void testRunStatement() throws SQLException {
        ResultSet rs = da.run_statement("select * from users where username = 'sarah'");
        rs.next();
        String expected = rs.getString("UserID") + ", " + rs.getString("Password");
        assertEquals(expected, "Teacher, 123");
    }
    
    @Test
    public void testRunStatementWithParam() throws SQLException{
        String[] modCodes = new String[4];
        modCodes[0] = "ACTEST1";
        modCodes[1] = "ACTEST2";
        modCodes[2] = "ACTEST3";
        modCodes[3] = "ACTEST4";
        ResultSet rs = da.run_statement("select Stage from exams where ModuleCode = ", modCodes);
        int[] compare = new int[4];
        for(int i=0; i < 3; i++) {
            rs.next();
            compare[i] = rs.getInt("Stage");
        }
        int[] expected = new int[4];
        expected[0] = 5;
        expected[1] = 2;
        expected[2] = 1;
        expected[3] = 3;
        assertArrayEquals(expected, compare);
    }
            

}
