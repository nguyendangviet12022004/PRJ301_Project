/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.IConstant;
import dao.OrderDAO;
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
import model.AccountDTO;
import model.CartDTO;
import model.OrderDTO;

public class OrderController extends HttpServlet {

    private OrderDAO dao = OrderDAO.getInstance();

    private void reloadOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("orders");
    }

    private void createOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        String mode = request.getParameter("mode");
        
        if (mode.equals("cart")) {
            CartDTO cart = (CartDTO) session.getAttribute("cart");
            try {
                dao.insertOrder(account.getUserName(), cart);
                session.removeAttribute("cart");

            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                dao.insertOrder(account.getUserName(), Integer.parseInt(request.getParameter("id")));
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        reloadOrder(request, response);
        response.sendRedirect(IConstant.HOME_PAGE);
    }

    private void readOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<OrderDTO> orders = null;
        HttpSession session = request.getSession();
        AccountDTO account = (AccountDTO) session.getAttribute("account");
        try {
            if (account.getRole().equalsIgnoreCase(IConstant.ADMIN)) {
                orders = dao.selectAllOrder();
            } else {
                orders = dao.selectOrderByUser(account.getUserName());
            }
            session.setAttribute("orders", orders);
            response.sendRedirect(IConstant.ORDER_LIST);

        } catch (SQLException ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void deletOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
                readOrder(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "read";
        }
        switch (action) {
            case "create":
                createOrder(request, response);
                break;
            case "update":

                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
