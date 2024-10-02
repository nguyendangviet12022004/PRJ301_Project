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
        ProductDAO productDao = ProductDAO.getInstance();
        List<ProductDTO> products = null;

        if (selectedCategoryId == null) {
            try {
                products = productDao.selectAllProducts();
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                products = productDao.selectProductsByCategoryId(Integer.parseInt(selectedCategoryId));
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        session.setAttribute("selectedCategoryId", selectedCategoryId);
        session.setAttribute("products", products);
        response.sendRedirect("home.jsp");
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // co the phai kiem tra quyen truy cap
        
    }
    
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
    }
    
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");// co the la attribute
        if (action == null) {
            action = "read";
        }
        switch (action) {
            case "read":
                readProducts(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "create" :
                // chuyen huong trang 
                break;
            case "update":
                // them du lieu, chuyen huong trang
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");// co the la attribute
        if (action == null) {
            action = "read";
        }
        switch (action) {
            case "create" :
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
        }
    }

}
