package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.customer;
import services.customerService;

@WebServlet("/updateCustomer")
public class updateCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateCustomer() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        customer cus = new customer();

        // Get updated values from form
        cus.setC_id(Integer.parseInt(request.getParameter("cid"))); // Hidden input
        cus.setC_name(request.getParameter("cname"));
        cus.setC_address(request.getParameter("caddress"));
        cus.setC_phone(request.getParameter("cphone"));
        cus.setC_email(request.getParameter("cemail"));

        // Call service method to update
        customerService service = new customerService();
        service.updateCustomer(cus);

        // Forward to manage customers page
        RequestDispatcher dispatcher = request.getRequestDispatcher("managecustomers.jsp");
        dispatcher.forward(request, response);
    }
}
