package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import controller.DBConnect;
import model.order;

public class orderService {

	public boolean addOrder(order ord) {
	    String insertOrder = "INSERT INTO `order` (c_name, c_email, i_name, i_qty, i_price, o_total) VALUES (?, ?, ?, ?, ?, ?)";
	    String updateCustomerUnit = "UPDATE customer SET c_unit = c_unit + 1 WHERE c_email = ?";
	    String updateItemQty = "UPDATE item SET i_qty = i_qty - 1 WHERE i_name = ? AND i_qty > 0";

	    try (Connection conn = DBConnect.getConnection()) {

	        // Insert the new order
	        try (PreparedStatement stmt = conn.prepareStatement(insertOrder)) {
	            stmt.setString(1, ord.getC_name());
	            stmt.setString(2, ord.getC_email());
	            stmt.setString(3, ord.getI_name());
	            stmt.setInt(4, ord.getI_qty());
	            stmt.setString(5, ord.getI_price());
	            stmt.setString(6, ord.getO_total());

	            stmt.executeUpdate();
	        }

	        // Increment customer's unit by 1
	        try (PreparedStatement custStmt = conn.prepareStatement(updateCustomerUnit)) {
	            custStmt.setString(1, ord.getC_email());
	            custStmt.executeUpdate();
	        }

	        // Decrease item stock by 1
	        try (PreparedStatement itemStmt = conn.prepareStatement(updateItemQty)) {
	            itemStmt.setString(1, ord.getI_name());
	            itemStmt.executeUpdate();
	        }

	        return true;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}



	public ArrayList<order> getAllOrders() {
	    ArrayList<order> orderList = new ArrayList<>();
	    String query = "SELECT * FROM `order` ORDER BY o_id DESC";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query);
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            order ord = new order();
	            ord.setO_id(rs.getInt("o_id"));
	            ord.setC_name(rs.getString("c_name"));
	            ord.setC_email(rs.getString("c_email"));
	            ord.setI_name(rs.getString("i_name"));
	            ord.setI_qty(rs.getInt("i_qty"));
	            ord.setI_price(rs.getString("i_price"));
	            ord.setO_total(rs.getString("o_total"));

	            orderList.add(ord);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return orderList;
	}


    // ✅ Delete order
    public boolean deleteOrder(int o_id) {
        String query = "DELETE FROM order WHERE o_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, o_id);
            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public order getOrderById(int o_id) {
        order ord = null;
        String query = "SELECT * FROM `order` WHERE o_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, o_id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                ord = new order();
                ord.setO_id(rs.getInt("o_id"));
                ord.setC_name(rs.getString("c_name"));
                ord.setC_email(rs.getString("c_email"));
                ord.setI_name(rs.getString("i_name"));
                ord.setI_qty(rs.getInt("i_qty"));
                ord.setI_price(rs.getString("i_price"));
                ord.setO_total(rs.getString("o_total"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ord;
    }

}
