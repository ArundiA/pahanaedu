package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import controller.DBConnect;
import model.customer;

public class customerService {

    //  Add a new customer
	public void regCustomer(customer cus) {
			
			try {
				
				String query = "insert into customer values('"  +cus.getC_id()+"','"
						                                        +cus.getC_name()+"','"
																+cus.getC_address()+"','"  
											                    +cus.getC_phone()+"','"        
											                    +cus.getC_email()+"','"
											                    +cus.getC_unit()+"')";
										                    
				Statement statement = DBConnect.getConnection().createStatement();
				statement.executeUpdate(query);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

    // ✅ Get all customers
    public ArrayList<customer> getAllCustomer() {
        ArrayList<customer> customerList = new ArrayList<>();
        String query = "SELECT * FROM customer";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                customer cus = new customer();
                cus.setC_id(rs.getInt("c_id"));
                cus.setC_name(rs.getString("c_name"));
                cus.setC_address(rs.getString("c_address"));
                cus.setC_phone(rs.getString("c_phone"));      
                cus.setC_email(rs.getString("c_email"));
                cus.setC_unit(rs.getInt("c_unit"));           

                customerList.add(cus);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customerList;
    }

    // ✅ Delete customer by email
    public void deleteCustomer(customer cus) {
    	try {
            String query = "DELETE FROM customer WHERE c_id = ?";
            PreparedStatement stmt = DBConnect.getConnection().prepareStatement(query);
            stmt.setInt(1, cus.getC_id());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

 // ✅ Update customer by ID
    public void updateCustomer(customer cus) {
        String query = "UPDATE customer SET c_name = ?, c_address = ?, c_phone = ?, c_email = ? WHERE c_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, cus.getC_name());
            stmt.setString(2, cus.getC_address());
            stmt.setString(3, cus.getC_phone());
            stmt.setString(4, cus.getC_email());
            stmt.setInt(6, cus.getC_id());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                System.out.println("✅ Customer updated successfully. ID: " + cus.getC_id());
            } else {
                System.out.println("⚠️ Update failed. No customer found with ID: " + cus.getC_id());
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Error updating customer: " + e.getMessage());
        }
    }


}
