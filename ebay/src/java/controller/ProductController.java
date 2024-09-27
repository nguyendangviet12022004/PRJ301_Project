package controller;

import dao.ProductDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ProductDTO;

public class ProductController extends HttpServlet {

    private void readProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String categoryId = request.getParameter("categoryId");
        ProductDAO productDao = ProductDAO.getInstance();
        List<ProductDTO> products = null;
        if(categoryId == null){
            try {
                products = productDao.selectAllProducts();
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else{
            // them chuc nang loc theo category vao day
        }
        PrintWriter out = response.getWriter();
        
        request.setAttribute("products", products);
        request.getRequestDispatcher("product-list.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) action = "read";
        switch(action){
            case "read":
                readProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
