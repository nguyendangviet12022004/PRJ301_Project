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
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CategoryDTO;

public class CategoryController extends HttpServlet {

    private final static CategoryDAO dao = CategoryDAO.getInstance();

    private void reloadCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("categories");
    }
    
    private void readCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String src = request.getParameter("src");
        if (src == null) {
            src = IConstant.HOME_PAGE;
        }

        List<CategoryDTO> categories = null;

        try {
            categories = dao.selectAllCategories();
            session.setAttribute("categories", categories);
            response.sendRedirect(src);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void createCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");

        Part file = request.getPart("image");
        String appPath = request.getServletContext().getRealPath("");
        String imageNameFile = file.getSubmittedFileName();
        String uploadPath = appPath + "assets/image/" + imageNameFile;

        FileOutputStream fos = new FileOutputStream(uploadPath);
        InputStream is = file.getInputStream();

        byte[] data = new byte[is.available()];
        is.read(data);
        fos.write(data);
        fos.close();
        
        String image = request.getParameter("/ebay/assets/image/" + imageNameFile);
        
        try {
            dao.insertCategory(name, image);
            readCategories(request, response);
            request.setAttribute("info", "Successfull");
        } catch (SQLException ex) {
            request.setAttribute("error", "Wrong Format");
            request.getRequestDispatcher(IConstant.CATEGORY_LIST).forward(request, response);
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
            case "read" ->
                readCategories(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
