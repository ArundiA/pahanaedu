package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.itemService;

@WebServlet("/deleteItem")
public class deleteItem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteItem() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get item ID from request
            String idStr = request.getParameter("id");

            if (idStr == null || idStr.trim().isEmpty()) {
                showError(response, "Missing Item ID.");
                return;
            }

            int itemId = Integer.parseInt(idStr);

            // Call service
            itemService service = new itemService();
            boolean deleted = service.deleteItem(itemId);

            if (deleted) {
                showSuccess(response, "Item deleted successfully.", "manageitems.jsp");
            } else {
                showError(response, "Failed to delete item. Try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            showError(response, "Unexpected error occurred.");
        }
    }

    private void showError(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("window.location.href = 'manageitems.jsp';");
        response.getWriter().println("</script>");
    }

    private void showSuccess(HttpServletResponse response, String message, String redirectUrl) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("window.location.href = '" + redirectUrl + "';");
        response.getWriter().println("</script>");
    }
}
