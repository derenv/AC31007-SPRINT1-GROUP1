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
public class loginTest {
     login l;
     Connection c;
        
    @Before
    public void setUp() {
         l = new login();
         c = conn.connect();
    
    }
    
    @Test
      public void testLogin() {
          
       
         
        boolean successfulLogin = l.login("a", "b");
        assertTrue("Successful login as teacher", successfulLogin);
      }
}
