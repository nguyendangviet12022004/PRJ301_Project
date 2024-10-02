package controller;

import constant.IConstant;
import dao.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;


public class AccountController extends HttpServlet {

    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        
        AccountDAO accountDao = AccountDAO.getInstance();
        try {
            accountDao.insertAccount(userName, password, IConstant.USER);
            // chuyen huong sang trang login
        } catch (SQLException ex) {
            
            request.setAttribute("error", "Username is exist!!");
            request.getRequestDispatcher(IConstant.REGESTRATION_PAGE).forward(request, response);
        }
        
    }

    private void readAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        AccountDAO accountDao = AccountDAO.getInstance();
        try {
            List<AccountDTO> accounts = accountDao.selectAllAccounts();
            request.setAttribute("accounts", accounts);
            request.getRequestDispatcher(IConstant.ACCOUNT_LIST_PAGE).forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
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
                readAccount(request, response);
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
            case "update":
                break;
        }
    }

}
