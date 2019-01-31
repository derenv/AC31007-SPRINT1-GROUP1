/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.SQLException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author mikhailpolishchouk
 */
public class TestAccessPrivilege {
    
viewExams v;


    @Before
    public void setUp() {
        
        v = new viewExams("finn","ExternalMod");
    }
    
    
    @Test
    public void testGetAccessPrivileges() throws SQLException{
        
        boolean compare = v.getAccessPrivileges("ACTEST1");
        assertTrue(compare);
        
    }

}
