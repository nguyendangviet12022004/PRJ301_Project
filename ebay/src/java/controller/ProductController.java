package controller;

import dao.ProductDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ProductDTO;

public class ProductController extends HttpServlet {

    private void readProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String selectedCategoryId = request.getParameter("selectedCategoryId");
        session.setAttribute("selectedCategoryId", selectedCategoryId);

        selectedCategoryId = (String) session.getAttribute("selectedCategoryId");
        ProductDAO productDao = ProductDAO.getInstance();
        List<ProductDTO> products = null;

        // read all products 
        if (selectedCategoryId == null) {
            try {
                products = productDao.selectAllProducts();
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }

            // read require category products
        } else {
            try {
                products = productDao.selectProductsByCategoryId(Integer.parseInt(selectedCategoryId));
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        session.setAttribute("products", products);
        response.sendRedirect("product-list.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "read";
        }
        switch (action) {
            case "read" ->
                readProducts(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
