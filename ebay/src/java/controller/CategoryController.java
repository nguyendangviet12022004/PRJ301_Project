package controller;

import dao.CategoryDAO;
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
import model.CategoryDTO;

public class CategoryController extends HttpServlet {
    
    private void readCategories(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CategoryDAO categoryDao = CategoryDAO.getInstance();
        List<CategoryDTO> categories = null;
        try {
            categories = categoryDao.selectAllCategories();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("categories", categories);
        PrintWriter out = response.getWriter();
        out.println(categories);
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
