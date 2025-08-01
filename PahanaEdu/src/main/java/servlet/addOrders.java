package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.order;
import services.orderService;

@WebServlet("/addOrders")
public class addOrders extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addOrders() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // ✅ Correct field names matching addorders.jsp
            String customerName = request.getParameter("cname");
            String customerEmail = request.getParameter("cemail");
            String itemName = request.getParameter("iname");
            int itemQty = Integer.parseInt(request.getParameter("quantity"));  // ✅ MATCHED
            String itemPrice = request.getParameter("price");                  // ✅ MATCHED
            String total = request.getParameter("total");

            // ✅ Create Order Object
            order newOrder = new order();
            newOrder.setC_name(customerName);
            newOrder.setC_email(customerEmail);
            newOrder.setI_name(itemName);
            newOrder.setI_qty(itemQty);
            newOrder.setI_price(itemPrice);
            newOrder.setO_total(total);

            // ✅ Call Service to Save Order
            orderService service = new orderService();
            boolean success = service.addOrder(newOrder);

            if (success) {
                response.sendRedirect("manageorders.jsp");
            } else {
                request.setAttribute("errorMessage", "Order submission failed. Please try again.");
                request.getRequestDispatcher("addorders.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error processing order: " + e.getMessage());
            request.getRequestDispatcher("addorders.jsp").forward(request, response);
        }
    }
}
