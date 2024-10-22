package controller;

import constant.IConstant;
import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

@MultipartConfig
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

        String image = "/ebay/assets/image/" + imageNameFile;

        try {
            dao.insertCategory(name, image);
            reloadCategory(request, response);
            request.setAttribute("info", "Successfull");
        } catch (SQLException ex) {
            request.setAttribute("error", ex.getMessage());

        }
        request.getRequestDispatcher(IConstant.CATEGORY_FORM).forward(request, response);
    }

    private void updateCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");

            String image = dao.selectCategoryById(id).getImage();;

            Part file = request.getPart("image");
            try {
                if (file != null) {
                    String appPath = request.getServletContext().getRealPath("");
                    String imageNameFile = file.getSubmittedFileName();
                    String uploadPath = appPath + "assets/image/" + imageNameFile;

                    FileOutputStream fos = new FileOutputStream(uploadPath);
                    InputStream is = file.getInputStream();

                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
                    image = "/ebay/assets/image/" + imageNameFile;
                }
            } catch (Exception ex) {

            }

            dao.updateCategory(id, name, image);
            reloadCategory(request, response);
            request.setAttribute("info", "Successfull");
            request.getRequestDispatcher(IConstant.CATEGORY_FORM).forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("error", "Sql error");
            request.getRequestDispatcher(IConstant.CATEGORY_FORM).forward(request, response);
        }

    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            dao.deleteCategory(id);
            reloadCategory(request, response);
        } catch (SQLException ex) {

        }

        request.getRequestDispatcher(IConstant.HOME_PAGE).forward(request, response);
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
                readCategories(request, response);
                break;
            case "create":
                request.getRequestDispatcher(IConstant.CATEGORY_FORM).forward(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));

                try {
                    CategoryDTO category = dao.selectCategoryById(id);
                    request.setAttribute("category", category);
                    request.getRequestDispatcher(IConstant.CATEGORY_FORM).forward(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(CategoryController.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "delete":
                deleteCategory(request, response);
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
        PrintWriter out = response.getWriter();

        switch (action) {
            case "create":
                createCategories(request, response);
                break;
            case "update":
                updateCategories(request, response);
                break;

        }
    }

}
