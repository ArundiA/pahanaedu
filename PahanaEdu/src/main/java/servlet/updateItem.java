package servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.item;
import services.itemService;

@WebServlet("/updateItem")
@MultipartConfig
public class updateItem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateItem() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        item itm = new item();
        itemService itmService = new itemService();

        // Get item parameters from form
        itm.setI_id(Integer.parseInt(request.getParameter("i_id")));
        itm.setI_name(request.getParameter("iname"));
        itm.setI_type(request.getParameter("itype"));
        itm.setI_qty(Integer.parseInt(request.getParameter("iqty")));
        itm.setI_price(request.getParameter("iprice"));

        // Handle image upload
        Part filePart = request.getPart("iimage");
        byte[] itemImage = null;

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                itemImage = inputStream.readAllBytes();
            }
        } else {
            itemImage = itmService.getItemImage(itm.getI_id()); // Retain existing image if not updated
        }

        itm.setI_image(itemImage);

        // Call item service to update item
        boolean success = itmService.updateItem(itm);

        if (success) {
            response.sendRedirect("manageitem.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to update item.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateitem.jsp");
            dispatcher.forward(request, response);
        }
    }
}
