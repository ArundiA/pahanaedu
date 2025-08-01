package servlet;

import model.customer;
import services.customerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/editCustomer")
public class EditCustomer extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cid = Integer.parseInt(request.getParameter("cid"));
        customerService service = new customerService();
        customer cus = service.getCustomerById(cid);

        request.setAttribute("cus", cus); // Set customer object
        request.getRequestDispatcher("updateCustomers.jsp").forward(request, response);
    }
}
