package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.item;
import services.itemService;

@WebServlet("/viewUpdateItem")
public class viewUpdateItem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public viewUpdateItem() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the item ID from request parameter
            int itemId = Integer.parseInt(request.getParameter("id"));

            // Retrieve item from service layer
            itemService service = new itemService();
            item itemData = service.getItemById(itemId);

            if (itemData != null) {
                // Pass item object to JSP
                request.setAttribute("item", itemData);
                RequestDispatcher dispatcher = request.getRequestDispatcher("updateitem.jsp");
                dispatcher.forward(request, response);
            } else {
                // Redirect if item not found
                response.sendRedirect("manageitems.jsp?error=ItemNotFound");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("manageitems.jsp?error=InvalidID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageitems.jsp?error=ServerError");
        }
    }
}
