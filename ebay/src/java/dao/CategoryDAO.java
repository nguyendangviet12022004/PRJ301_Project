package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CategoryDTO;
import util.DBHelper;

public class CategoryDAO {

    private final String SELECT_ALL_CATEGORIES = "SELECT * FROM CATEGORY";
    private final String SELECT_CATEGORI_BY_ID = "SELECT * FROM CATEGORY WHERE ID = ? ";
    private static CategoryDAO instance;
    private Connection connection;

    private CategoryDAO() {
        try {
            this.connection = DBHelper.makeConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static CategoryDAO getInstance() {
        if (instance == null) {
            instance = new CategoryDAO();
        }
        return instance;
    }

    public List<CategoryDTO> selectAllCategories() throws SQLException {
        PreparedStatement statement = this.connection.prepareStatement(SELECT_ALL_CATEGORIES);
        ResultSet result = statement.executeQuery();
        List<CategoryDTO> categories = new ArrayList<>();
        while(result.next()){
            int id = result.getInt("id");
            String name = result.getString("name");
            String image = result.getString("image");
            categories.add(new CategoryDTO(id, name, image));
        }
        return categories;
    }
    
    public CategoryDTO selectCategoryById(int id) throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(SELECT_CATEGORI_BY_ID);
        statement.setInt(1, id);
        ResultSet result = statement.executeQuery();
        CategoryDTO category = null;
        if(result.next()){
            String name = result.getString("name");
            String image = result.getString("image");
            category =  new CategoryDTO(id, name, image);
        }
        return category;
    }

}
