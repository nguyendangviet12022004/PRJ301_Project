package controller;

import constant.IConstant;
import dao.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;

public class AccountController extends HttpServlet {
    
    private static final AccountDAO dao = AccountDAO.getInstance();
    
    private void resetAccount(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        session.removeAttribute("accounts");
    }
    
    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        if(role == null || role.isBlank()){
            role = IConstant.USER;
        }
        try {
            dao.insertAccount(userName, password, role);
            response.sendRedirect(IConstant.SIGN_IN_FORM);
        } catch (SQLException ex) {
            request.setAttribute("error", "Username is exist");
            request.getRequestDispatcher(IConstant.REGESTRATION_FORM).forward(request, response);
        }
    }
    
    private void readAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            List<AccountDTO> accounts = dao.selectAllUsers();
            HttpSession session = request.getSession();
            session.setAttribute("accounts", accounts);
            response.sendRedirect(IConstant.ACCOUNT_LIST);
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        try {
            dao.deleteAccount(userName);
            resetAccount(request, response);
            response.sendRedirect(IConstant.ACCOUNT_LIST);
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    private void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        try {
            AccountDTO account = dao.selectAccount(userName, password);
            if (account == null) {
                request.setAttribute("error", "Wrong user name or password");
                request.getRequestDispatcher(IConstant.SIGN_IN_FORM).forward(request, response);
            }
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            response.sendRedirect(IConstant.HOME_PAGE);
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void signOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect(IConstant.HOME_PAGE);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        
        if (action == null) {
            action = "read";
        }
        
        switch (action) {
            case "signOut":
                signOut(request, response);
                break;
            case "read":
                readAccount(request, response);
                break;
            case "delete":
                deleteAccount(request, response);
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
            case "signIn":
                signIn(request, response);
                break;
        }
    }
    
}
