package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.item;
import services.itemService;

@WebServlet("/manageItems")
public class manageItems extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public manageItems() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        itemService itemService = new itemService();
        ArrayList<item> itemList = itemService.getAllItems(); // Fetch all items

        System.out.println("Total Items Retrieved: " + itemList.size()); // Debug log

        // Store in request scope
        request.setAttribute("itemList", itemList);

        // Forward to JSP
        request.getRequestDispatcher("manageitem.jsp").forward(request, response);
    }
}
