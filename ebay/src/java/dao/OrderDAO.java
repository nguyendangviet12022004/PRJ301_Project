package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import model.CartDTO;
import model.ItemDTO;
import model.OrderDTO;
import model.ProductDTO;
import util.DBHelper;

public class OrderDAO {

    private final String INSERT_ORDER = "INSERT INTO [ORDER]([user_name]) VALUES (?)";
    private final String INSERT_ORDER_DETAIL = "INSERT INTO [ORDER_DETAIL](order_id,product_id,quantity) VALUES(?,?,?)";
    private final String SELECT_ORDER = "SELECT * FROM [ORDER]";
    private final String SELECT_ORDER_DETAIL_BY_ORDER_ID = "SELECT * FROM [ORDER_DETAIL] WHERE [order_id] = ?";
    private final String SELECT_ORDER_BY_USER = "SELECT * FROM [ORDER] WHERE [user_name] = ?";
    private final String DELETE_ORDER_BY_ID = "DELETE FROM [ORDER] WHERE [id] = ?";
    private final String DELETE_ORDER_DETAIL_BY_ORDER_ID = "DELETE FROM [ORDER_DETAIL] WHERE [ORDER_ID] = ?";
    private final String UPDATE_ORDER_STATUS = "UPDATE  [ORDER] SET STATUS = ? WHERE [id] = ?";
    private final String UPDATE_STOCK_PRODUCT = "UPDATE PRODUCT SET STOCK = STOCK - ? WHERE [ID] = ?";
    
    
    private Connection connection;
    private static OrderDAO instance;

    private OrderDAO() {
        try {
            this.connection = DBHelper.makeConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static OrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }
    private void delteOrderDetail(int orderId) throws SQLException{
        PreparedStatement statement = connection.prepareStatement(DELETE_ORDER_DETAIL_BY_ORDER_ID);
        statement.setInt(1, orderId);
        statement.executeUpdate();
    }
    public void insertOrder(String userName, CartDTO cart) throws SQLException {
        PreparedStatement statement1 = connection.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);
        statement1.setString(1, userName);

        statement1.executeUpdate();
        ResultSet rs = statement1.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            for (Map.Entry<ProductDTO, Integer> entry : cart.getCartMap().entrySet()) {
                PreparedStatement statement2 = connection.prepareStatement(INSERT_ORDER_DETAIL);
                statement2.setInt(1, id);
                statement2.setInt(2, entry.getKey().getId());
                statement2.setInt(3, entry.getValue());
                statement2.executeUpdate();
            }
        }
    }
    public void insertOrder(String userName, int productId) throws SQLException {
        PreparedStatement statement1 = connection.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);
        statement1.setString(1, userName);

        statement1.executeUpdate();
        ResultSet rs = statement1.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            PreparedStatement statement2 = connection.prepareStatement(INSERT_ORDER_DETAIL);
            statement2.setInt(1, id);
            statement2.setInt(2, productId);
            statement2.setInt(3, 1);
            statement2.executeUpdate();
        }
    }
    public void deleteOrder(int id) throws SQLException{
        delteOrderDetail(id);
        PreparedStatement statement = connection.prepareStatement(DELETE_ORDER_BY_ID);
        statement.setInt(1, id);
        statement.executeUpdate();
    }
    public List<OrderDTO> selectAllOrder() throws SQLException {
        PreparedStatement statement1 = connection.prepareStatement(SELECT_ORDER);
        ResultSet rs = statement1.executeQuery();
        List<OrderDTO> orders = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt(1);
            String userName = rs.getString(2);
            AccountDTO account = AccountDAO.getInstance().selectAccountByUserName(userName);
            Date date = rs.getDate(3);
            String status = rs.getString(4);

            CartDTO cart = new CartDTO();

            PreparedStatement statement2 = connection.prepareStatement(SELECT_ORDER_DETAIL_BY_ORDER_ID);
            statement2.setInt(1, id);
            ResultSet result = statement2.executeQuery();
            while (result.next()) {
                int productId = result.getInt(2);
                int quantity = result.getInt(3);

                ProductDTO product = ProductDAO.getInstance().selectProductById(productId);

                cart.addItem(new ItemDTO(product, quantity));
            }
            orders.add(new OrderDTO(id, account, date, cart, status));
        }
        return orders;
    }
    public List<OrderDTO> selectOrderByUser(String userName) throws SQLException {
        PreparedStatement statement1 = connection.prepareStatement(SELECT_ORDER_BY_USER);
        statement1.setString(1, userName);
        ResultSet rs = statement1.executeQuery();
        List<OrderDTO> orders = new ArrayList<>();
        while (rs.next()) {
            int id = rs.getInt(1);

            AccountDTO account = AccountDAO.getInstance().selectAccountByUserName(userName);
            Date date = rs.getDate(3);
            String status = rs.getString(4);

            CartDTO cart = new CartDTO();

            PreparedStatement statement2 = connection.prepareStatement(SELECT_ORDER_DETAIL_BY_ORDER_ID);
            statement2.setInt(1, id);
            ResultSet result = statement2.executeQuery();
            while (result.next()) {
                int productId = result.getInt(2);
                int quantity = result.getInt(3);

                ProductDTO product = ProductDAO.getInstance().selectProductById(productId);

                cart.addItem(new ItemDTO(product, quantity));
            }
            orders.add(new OrderDTO(id, account, date, cart, status));
        }
        return orders;
    }
    public void updateStatusOrder(int id, String status) throws SQLException{
        PreparedStatement statement = connection.prepareStatement(UPDATE_ORDER_STATUS);
        statement.setString(1,status);
        statement.setInt(2,id);
        statement.executeUpdate();
        
        if(status.equalsIgnoreCase("APPROVE")){
            updateStockAFterApproveOrder(id);
            
        }
    }
    public void updateStockAFterApproveOrder(int id) throws SQLException{
        PreparedStatement statement1 = connection.prepareStatement(SELECT_ORDER_DETAIL_BY_ORDER_ID);
        PreparedStatement statement2 = connection.prepareStatement(UPDATE_STOCK_PRODUCT);
        statement1.setInt(1,id);
        ResultSet rs = statement1.executeQuery();
        while(rs.next()){
            int productId = rs.getInt("product_id");
            int quantity = rs.getInt("quantity");
            statement2.setInt(1, quantity);
            statement2.setInt(2,productId);
            statement2.executeUpdate();
        }
    }
    
    public static void main(String[] args) throws SQLException {
        getInstance().updateStatusOrder(5, "APPROVE");
    }

}
