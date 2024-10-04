package controller;

import constant.IConstant;
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

    private final static ProductDAO dao = ProductDAO.getInstance();

    private void reloadProducts(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("products");
    }
    
    private void readProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String src = request.getParameter("src");
        HttpSession session = request.getSession();
        String selectedCategoryId = request.getParameter("selectedCategoryId");
        
        if(src == null){
            src = IConstant.HOME_PAGE;
        }
        
        List<ProductDTO> products = null;
        try {
            if(selectedCategoryId == null){
                products = dao.selectAllProducts();
            }
            else{
                products = dao.selectProductsByCategoryId(Integer.parseInt(selectedCategoryId));
            }
            session.setAttribute("products", products);
            response.sendRedirect(src);
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            int stock = Integer.parseInt(request.getParameter("stock"));
            int price = Integer.parseInt(request.getParameter("price"));
            int category_id = Integer.parseInt(request.getParameter("categoryId"));
            String image = request.getParameter("image");
            
            dao.insertProduct(name, stock, price, category_id, image);
            request.setAttribute("info", "Create Product Successfullly");
            reloadProducts(request, response);
            request.getRequestDispatcher(IConstant.PRODUCT_FORM_PAGE).forward(request, response);
        } catch (NumberFormatException ex) {
            request.setAttribute("error", "Wrong Format");
            request.getRequestDispatcher(IConstant.PRODUCT_FORM_PAGE).forward(request, response);
        } catch (SQLException ex) {
            request.setAttribute("error", "Sql error");
            request.getRequestDispatcher(IConstant.PRODUCT_FORM_PAGE).forward(request, response);
        }

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            int stock = Integer.parseInt(request.getParameter("stock"));
            int price = Integer.parseInt(request.getParameter("price"));
            int category_id = Integer.parseInt(request.getParameter("categoryId"));
            String image = request.getParameter("image");
            
            dao.updateProduct(Integer.parseInt(id), name, stock, price, category_id, image);
            request.setAttribute("info", "Update Product Successfullly");
            reloadProducts(request, response);
            request.getRequestDispatcher(IConstant.PRODUCT_FORM_PAGE).forward(request, response);
        } catch (NumberFormatException ex) {
            request.setAttribute("error", "Wrong Format");
            request.getRequestDispatcher(IConstant.PRODUCT_FORM_PAGE).forward(request, response);
        } catch (SQLException ex) {
            request.setAttribute("error", "Sql error");
            request.getRequestDispatcher(IConstant.PRODUCT_FORM_PAGE).forward(request, response);
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
        try {
            String id = request.getParameter("id");
            dao.deleteProduct(Integer.parseInt(id));
            readProducts(request, response);
            request.getRequestDispatcher(IConstant.PRODUCT_LIST_PAGE).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "read";
        }
        
        switch (action) {
            case "read":
                readProducts(request, response);
                break;
            case "delete":
                PrintWriter out = response.getWriter();
                deleteProduct(request, response);
                break;
            case "create":
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
            case "create":
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
        }
    }

}
