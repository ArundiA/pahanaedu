package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import controller.DBConnect;
import model.item;

public class itemService {

    // ✅ Register new item
    public boolean registerItem(item item) {
        String insertQuery = "INSERT INTO item (i_name, i_type, i_image, i_qty, i_price) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(insertQuery)) {

            stmt.setString(1, item.getI_name());
            stmt.setString(2, item.getI_type());
            stmt.setBytes(3, item.getI_image());
            stmt.setInt(4, item.getI_qty());
            stmt.setString(5, item.getI_price());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Retrieve all items
    public ArrayList<item> getAllItems() {
        ArrayList<item> itemList = new ArrayList<>();
        String query = "SELECT i_id, i_name, i_type, i_image, i_qty, COALESCE(i_price, '0') AS i_price FROM item";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                item item = new item();
                item.setI_id(rs.getInt("i_id"));
                item.setI_name(rs.getString("i_name"));
                item.setI_type(rs.getString("i_type"));
                item.setI_image(rs.getBytes("i_image"));
                item.setI_qty(rs.getInt("i_qty"));
                item.setI_price(rs.getString("i_price"));

                itemList.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return itemList;
    }

    // ✅ Delete item
    public boolean deleteItem(int itemId) {
        String deleteQuery = "DELETE FROM item WHERE i_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(deleteQuery)) {

            stmt.setInt(1, itemId);
            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Update item (Auto-detects image presence)
    public boolean updateItem(item item) {
        boolean updateImage = (item.getI_image() != null);

        String queryWithImage = "UPDATE item SET i_name = ?, i_type = ?, i_image = ?, i_qty = ?, i_price = ? WHERE i_id = ?";
        String queryWithoutImage = "UPDATE item SET i_name = ?, i_type = ?, i_qty = ?, i_price = ? WHERE i_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(updateImage ? queryWithImage : queryWithoutImage)) {

            stmt.setString(1, item.getI_name());
            stmt.setString(2, item.getI_type());

            int idx = 3;
            if (updateImage) {
                stmt.setBytes(idx++, item.getI_image());
            }

            stmt.setInt(idx++, item.getI_qty());
            stmt.setString(idx++, item.getI_price());
            stmt.setInt(idx, item.getI_id());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Get image by item ID
    public byte[] getItemImage(int itemId) {
        byte[] imageBytes = null;
        String query = "SELECT i_image FROM item WHERE i_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, itemId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                imageBytes = rs.getBytes("i_image");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return imageBytes;
    }

    // ✅ Get full item by ID
    public item getItemById(int itemId) {
        item item = null;
        String query = "SELECT * FROM item WHERE i_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, itemId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                item = new item();
                item.setI_id(rs.getInt("i_id"));
                item.setI_name(rs.getString("i_name"));
                item.setI_type(rs.getString("i_type"));
                item.setI_image(rs.getBytes("i_image"));
                item.setI_qty(rs.getInt("i_qty"));
                item.setI_price(rs.getString("i_price"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return item;
    }
}
