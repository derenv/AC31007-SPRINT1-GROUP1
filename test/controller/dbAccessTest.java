/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.dbAccess;
import java.util.*;
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
public class dbAccessTest {
    dbAccess a;
    
    @Before
    public void setUp() {
        a = new dbAccess();
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testGetModuleCodes() {
        String moduleCodes = a.getModuleCodes();
        String compare = "AC31002, AC31008, AC32000, TEST";
        assertEquals(compare, moduleCodes);
    }
}
