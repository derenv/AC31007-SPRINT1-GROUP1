/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author finntorbet
 */
public class loginTest {
     login l;
        
    @Before
    public void setUp() {
         l = new login();
    
    }
    
    @Test
      public void test_check_valid_details(){
        String type = l.check_valid_details("sarah","123");
        assertEquals("Teacher", type);
      }
}
