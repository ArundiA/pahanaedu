package servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.item;
import services.itemService;

@WebServlet("/addItem")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB max file size for item image
public class addItem extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    public addItem() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        try {
            // Create item object
            item item = new item();

            // Get form data
            item.setI_name(request.getParameter("iname"));
            item.setI_type(request.getParameter("itype"));

            try {
                item.setI_qty(Integer.parseInt(request.getParameter("iqty")));
            } catch (NumberFormatException e) {
                showError(response, "Invalid quantity. Please enter a valid number.");
                return;
            }

            item.setI_price(request.getParameter("iprice"));

            // Handle image upload
            Part filePart = request.getPart("iimage");
            byte[] itemImage = null;

            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream inputStream = filePart.getInputStream()) {
                    itemImage = inputStream.readAllBytes();
                }
            }
            item.setI_image(itemImage);

            // Pass item object to service layer
            itemService itemService = new itemService();
            boolean isRegistered = itemService.registerItem(item);

            // Redirect based on result
            if (isRegistered) {
                showSuccess(response, "Item added successfully.", "manageitem.jsp");
            } else {
                showError(response, "Failed to add item. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            showError(response, "An unexpected error occurred. Please try again.");
        }
    }

    // Helper method to show error message and redirect
    private void showError(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("window.location.href = 'additem.jsp';");
        response.getWriter().println("</script>");
    }

    // Helper method to show success message and redirect
    private void showSuccess(HttpServletResponse response, String message, String redirectUrl) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("window.location.href = '" + redirectUrl + "';");
        response.getWriter().println("</script>");
    }
}
