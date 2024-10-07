package controller;

import constant.IConstant;
import dao.CategoryDAO;
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
import model.CategoryDTO;

public class CategoryController extends HttpServlet {
    private final static CategoryDAO dao = CategoryDAO.getInstance();
    private void readCategories(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        CategoryDAO categoryDao = CategoryDAO.getInstance();
        List<CategoryDTO> categories = null;
        try {
            categories = categoryDao.selectAllCategories();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.setAttribute("categories", categories);
        response.sendRedirect("home.jsp");
    } 
    
    private void createCategories(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        try {
            dao.insertCategory(name, image);
        } catch (SQLException ex) {
            request.setAttribute("error", "Wrong Format");
            request.getRequestDispatcher(IConstant.CATEGORY_FORM_PAGE).forward(request, response);
        }
        
        
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) action = "read";
        switch(action){
            case "read" -> readCategories(request, response);
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
