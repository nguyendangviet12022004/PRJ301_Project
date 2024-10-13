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
    private final String SELECT_PRODUCT_BY_ID = "SELECT * FROM PRODUCT WHERE ID = ?";
    private final String SELECT_PRODUCTS_BY_CATEGORY_ID = "SELECT * FROM PRODUCT WHERE CATEGORY_ID = ?";
    private final String SELECT_PRODUCTS_BY_SEARCH_KEY = "SELECT * FROM PRODUCT WHERE [name] LIKE ?";
    private final String INSERT_PRODUCT = "INSERT INTO PRODUCT (NAME,STOCK,PRICE,CATEGORY_ID,IMAGE) VALUES(?,?,?,?,?)";
    private final String UPDATE_PRODUCT = "UPDATE PRODUCT SET name = ?, stock = ?, price = ? , category_id = ? , image = ? WHERE id = ?";
    private final String DELETE_PRODUCT = "DELETE FROM PRODUCT WHERE ID = ?";
    
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

    public List<ProductDTO> selectAllProducts() throws SQLException {
        PreparedStatement statement = this.connection.prepareStatement(SELECT_ALL_PRODUCTS);
        ResultSet result = statement.executeQuery();
        List<ProductDTO> products = new ArrayList<>();
        while (result.next()) {
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

    public ProductDTO selectProductById(int id) throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(SELECT_PRODUCT_BY_ID);
        statement.setInt(1, id);
        ResultSet result = statement.executeQuery();
        ProductDTO product = null;
        if (result.next()) {
            String name = result.getString("name");
            int stock = result.getInt("stock");
            int price = result.getInt("price");
            CategoryDTO category = CategoryDAO.getInstance().selectCategoryById(result.getInt("category_id"));
            String image = result.getString("image");
            product = new ProductDTO(id, name, stock, price, category, image);
        }
        return product;
    }
    
    public List<ProductDTO> selectProductsByCategoryId(int categoryId) throws SQLException {
        PreparedStatement statement = this.connection.prepareStatement(SELECT_PRODUCTS_BY_CATEGORY_ID);
        statement.setInt(1, categoryId);
        ResultSet result = statement.executeQuery();
        List<ProductDTO> products = new ArrayList<>();
        while (result.next()) {
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

    public List<ProductDTO> selectProductsBySearchKey(String searchKey) throws SQLException {
        if (searchKey == null || searchKey.isEmpty() || searchKey.isBlank()) {
            return selectAllProducts();
        }
        PreparedStatement statement = this.connection.prepareStatement(SELECT_PRODUCTS_BY_SEARCH_KEY);
        String queryKey = "%" + searchKey + "%";
        statement.setString(1, queryKey);
        ResultSet result = statement.executeQuery();
        List<ProductDTO> products = new ArrayList<>();
        while (result.next()) {
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

    public void updateProduct(int id, String name, int stock, int price, int categoryId, String image) throws SQLException {
        PreparedStatement statement = this.connection.prepareStatement(UPDATE_PRODUCT);
        statement.setString(1, name);       
        statement.setInt(2, stock);         
        statement.setInt(3, price);         
        statement.setInt(4, categoryId);    
        statement.setString(5, image);      
        statement.setInt(6, id);            

        statement.executeUpdate();

        statement.close();
    }

    public void deleteProduct(int id) throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(DELETE_PRODUCT);
        statement.setInt(1, id);            

        statement.executeUpdate();

        statement.close();
    }
    
    public void insertProduct(String name, int stock, int price, int categoryId, String image) throws SQLException {
        PreparedStatement statement = this.connection.prepareStatement(INSERT_PRODUCT);
        statement.setString(1, name);       
        statement.setInt(2, stock);         
        statement.setInt(3, price);         
        statement.setInt(4, categoryId);    
        statement.setString(5, image);
        statement.executeUpdate();

        statement.close();
    }
    
    public static void main(String[] args) {
        ProductDAO productDao = ProductDAO.getInstance();
        try {
            System.out.println(productDao.selectProductById(2));
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
