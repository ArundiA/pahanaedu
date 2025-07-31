package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import controller.DBConnect;
import model.admin;

public class adminService {
    
    public admin validateAdmin(String email, String password) {
        admin adm = null;

        // Debug: Print received email and password
        System.out.println("Checking login for Email: " + email);
        System.out.println("Password: " + password);
        
        try (Connection con = DBConnect.getConnection()) {
            String query = "SELECT * FROM admin WHERE a_email = ? AND a_password = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email.trim());
            pst.setString(2, password.trim());

            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                // Debug: Login success
                System.out.println("Login success: admin found in DB.");
                
                adm = new admin();
                adm.setA_name(rs.getString("a_name"));
                adm.setA_email(rs.getString("a_email"));
                adm.setA_password(rs.getString("a_password"));
            } else {
                // Debug: Login failed
                System.out.println("Login failed: no admin found with matching email and password.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return adm; // Returns null if credentials are incorrect
    }
}
