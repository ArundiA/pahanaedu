package servlet;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Element;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPCell;

import model.order;
import services.orderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DownloadBillPDF")
public class DownloadBillPDF extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int o_id = Integer.parseInt(request.getParameter("o_id"));
        orderService service = new orderService();
        order ord = service.getOrderById(o_id);

        if (ord == null) {
            response.getWriter().println("Order not found.");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Order_Bill_" + o_id + ".pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20);
            Paragraph title = new Paragraph("Order Bill", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            document.add(new Paragraph("\n"));

            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);

            addRow(table, "Order ID", String.valueOf(ord.getO_id()));
            addRow(table, "Customer Name", ord.getC_name());
            addRow(table, "Email", ord.getC_email());
            addRow(table, "Item Name", ord.getI_name());
            addRow(table, "Quantity", String.valueOf(ord.getI_qty()));
            addRow(table, "Item Price", ord.getI_price());
            addRow(table, "Total", ord.getO_total());

            document.add(table);
            document.close();

        } catch (DocumentException e) {
            e.printStackTrace();
            response.getWriter().write("Error generating PDF.");
        }
    }

    private void addRow(PdfPTable table, String label, String value) {
        PdfPCell cell1 = new PdfPCell(new Paragraph(label));
        PdfPCell cell2 = new PdfPCell(new Paragraph(value));
        table.addCell(cell1);
        table.addCell(cell2);
    }
}
