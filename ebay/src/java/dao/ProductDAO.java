package dao;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.CategoryDTO;
import model.ProductDTO;
import util.DBHelper;

public class ProductDAO {
    private final String SELECT_ALL_PRODUCTS = "SELECT * FROM PRODUCT";
    private final String SELECT_PRODUCTS_BY_CATEGORY_ID = "SELECT * FROM PRODUCT WHERE CATEGORY_ID = ?";
    private static ProductDAO instance;
    private Connection connection;

    private ProductDAO() {
        try {
            this.connection = DBHelper.makeConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ProductDAO getInstance() {
        if (instance == null) {
            instance = new ProductDAO();
        }
        return instance;
    }
    
    public List<ProductDTO> selectAllProducts() throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(SELECT_ALL_PRODUCTS);
        ResultSet result = statement.executeQuery();
        List<ProductDTO> products = new ArrayList<>();
        while(result.next()){
            int id = result.getInt("id");
            String name = result.getString("name");
            int stock = result.getInt("stock");
            int price = result.getInt("price");
            CategoryDTO category = CategoryDAO.getInstance().selectCategoryById(result.getInt("category_id"));
            String image = result.getString("image");
            products.add(new ProductDTO(id, name, stock, price, category, image));
        }
        return products;
    }
    
    public List<ProductDTO> selectProductsByCategoryId(int categoryId) throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(SELECT_PRODUCTS_BY_CATEGORY_ID);
        statement.setInt(1, categoryId);
        ResultSet result = statement.executeQuery();
        List<ProductDTO> products = new ArrayList<>();
        while(result.next()){
            int id = result.getInt("id");
            String name = result.getString("name");
            int stock = result.getInt("stock");
            int price = result.getInt("price");
            CategoryDTO category = CategoryDAO.getInstance().selectCategoryById(result.getInt("category_id"));
            String image = result.getString("image");
            products.add(new ProductDTO(id, name, stock, price, category, image));
        }
        return products;
    }
    
    public static void main(String[] args) {
        try {
            System.out.println(ProductDAO.getInstance().selectProductsByCategoryId(6));
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
