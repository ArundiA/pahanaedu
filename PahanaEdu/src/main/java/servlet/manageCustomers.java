package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import services.customerService;

@WebServlet("/manageCustomers")
public class manageCustomers extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public manageCustomers() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        customerService service = new customerService();
        ArrayList<customer> customerList = service.getAllCustomer();

        if (customerList == null) {
            System.out.println("❌ Customer list is NULL.");
            customerList = new ArrayList<>();
        } else {
            System.out.println(" Total Customers Retrieved: " + customerList.size());
        }

        request.setAttribute("customer", customerList);
        request.setAttribute("totalCustomers", customerList.size());

        RequestDispatcher dispatcher = request.getRequestDispatcher("managecustomers.jsp");
        dispatcher.forward(request, response);
    }
}
