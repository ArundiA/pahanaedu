package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.order;
import services.orderService;

@WebServlet("/manageOrders")
public class manageOrders extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public manageOrders() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        orderService service = new orderService();
        List<order> orderList = service.getAllOrders();

        if (orderList.isEmpty()) {
            System.out.println("⚠️ No orders found in the database.");
        } else {
            System.out.println("✅ Total Orders Retrieved: " + orderList.size());
        }

        request.setAttribute("orders", orderList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageorders.jsp");
        dispatcher.forward(request, response);
    }
}
