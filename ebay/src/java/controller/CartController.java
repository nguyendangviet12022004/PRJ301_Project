/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import constant.IConstant;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CartDTO;
import model.ItemDTO;
import model.ProductDTO;

/**
 *
 * @author ACER
 */
public class CartController extends HttpServlet {
   
    private void createItem(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        CartDTO cart = (CartDTO) session.getAttribute("cart");
        if(cart == null){
            cart = new CartDTO();
        }
        try {
            ProductDTO product = ProductDAO.getInstance().selectProductById(id);
            ItemDTO item = new ItemDTO(product, quantity);
            cart.addItem(item);
            session.setAttribute("cart", cart);
            response.sendRedirect(IConstant.HOME_PAGE);
        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) action = "read";
        switch(action){
            case "read":
                break;
            case "create":
                int id = Integer.parseInt(request.getParameter("id"));
            
                try {
                    ProductDTO product = ProductDAO.getInstance().selectProductById(id);
                    request.setAttribute("product", product);
                    request.setAttribute("btn", "Add To Cart");
                    request.getRequestDispatcher(IConstant.ORDER_FORM).forward(request, response);
                    
                } catch (SQLException ex) {
                    Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
                }
            
                break;

        }
    } 

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String action = request.getParameter("action");
        if(action == null) action = "read";
        switch(action){
            case "create":
                createItem(request, response);
                break;
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
