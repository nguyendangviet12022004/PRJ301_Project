package controller;

import constant.IConstant;
import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountController extends HttpServlet {

    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        AccountDAO accountDao = AccountDAO.getInstance();
        try {
            accountDao.insertAccount(userName, password, IConstant.USER);
            // chuyen huong sang trang login
        } catch (SQLException ex) {
            PrintWriter out = response.getWriter();
            out.println(password);
            request.setAttribute("error", "Username is exist!!");
            request.getRequestDispatcher(IConstant.REGESTRATION_PAGE).forward(request, response);
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
            case "create":
                break;
            case "read":
                break;
            case "update":
                break;
            case "delete":
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
                createAccount(request, response);
                break;
            case "read":
                break;
            case "update":
                break;
            case "delete":
                break;
        }
    }

}
