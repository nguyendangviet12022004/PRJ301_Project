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
    private Connection connection;
    private static OrderDAO instance;

    private OrderDAO() {
        try {
            this.connection = DBHelper.makeConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    ;
    
    public static OrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
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

    public static void main(String[] args) throws SQLException {
        System.out.println(getInstance().selectOrderByUser("user1"));
    }

}
