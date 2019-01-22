/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

/**
 *
 * @author finntorbet
 */
public class login {
    Connection c;
    
    public login() {
        c = conn.connect();
    }

    public boolean login(String u, String p) throws SQLException {
        PreparedStatement pst = c.prepareStatement("Select Username,Password from teachers where Username='a' and Password='b'");
        pst.setString(1, "a");
        pst.setString(2, "b");
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            System.out.println("Valid login credentials");
        } else {
            System.out.println("Invalid login credentials");
        }
        return false;
    }
}
