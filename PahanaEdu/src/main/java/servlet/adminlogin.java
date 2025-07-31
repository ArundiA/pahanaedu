package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.admin;
import services.adminService;

@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public adminlogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve login form parameters
        String email = request.getParameter("aemail");
        String password = request.getParameter("apassword");

        // Create admin service instance to validate credentials
        adminService service = new adminService();
        admin adm = service.validateAdmin(email, password); // Validate admin

        if (adm != null) { // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("loggedInAdmin", adm.getA_name());  // store admin name
            session.setAttribute("adminEmail", adm.getA_email());    // store admin email

            // Redirect to admin home page after successful login
            response.sendRedirect("adminhome.jsp");
        } else { // Login failed
            // Set error message attribute to display on login page
            request.setAttribute("errorMessage", "Invalid email or password!");

            // Forward request back to login page to show error
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
