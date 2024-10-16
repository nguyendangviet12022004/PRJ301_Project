package dao;

import constant.IConstant;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import util.DBHelper;

public class AccountDAO {
    private String SELECT_ALL_ACCOUNTS = "SELECT * FROM ACCOUNT";
    private String SELECT_ALL_USER = "SELECT * FROM ACCOUNT WHERE [role] = 'USER'";
    private String SELECT_ACCOUNT = "SELECT * FROM ACCOUNT WHERE [USER_NAME] = ? AND [PASSWORD] = ?";
    private String INSERT_ACCOUNT = "INSERT INTO ACCOUNT([USER_NAME],[PASSWORD],[ROLE]) VALUES(?,?,?)";
    private String DELETE_ACCOUNT = "DELETE FROM ACCOUNT WHERE [USER_NAME] = ?";
    private String SELECT_ACCOUNT_BY_USER_NAME = "SELECT * FROM ACCOUNT WHERE [USER_NAME] = ? ";
    private static AccountDAO instance;
    private Connection connection;
    
    private AccountDAO(){
        try {
            this.connection = DBHelper.makeConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    };
    
    public static AccountDAO getInstance(){
        if(instance == null){
            instance = new AccountDAO();
        }
        return instance;
    }  
    public List<AccountDTO> selectAllAccounts() throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(SELECT_ALL_ACCOUNTS);
        ResultSet result = statement.executeQuery();
        List<AccountDTO> accounts = new ArrayList<>();
        while(result.next()){
            String userName = result.getString("user_name");
            String password = result.getString("password");
            String role = result.getString("role");
            accounts.add(new AccountDTO(userName, password, role));
        }
        return accounts;
    }
    
    public List<AccountDTO> selectAllUsers() throws SQLException {
        PreparedStatement statement = this.connection.prepareStatement(SELECT_ALL_USER);
        ResultSet result = statement.executeQuery();
        List<AccountDTO> accounts = new ArrayList<>();
        while(result.next()){
            String userName = result.getString("user_name");
            String password = result.getString("password");
            String role = IConstant.USER;
            accounts.add(new AccountDTO(userName, password, role));
        }
        return accounts;
    }
    public AccountDTO selectAccount(String userName, String password) throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(SELECT_ACCOUNT);
        statement.setString(1, userName);
        statement.setString(2 , password);
        ResultSet result = statement.executeQuery();
        AccountDTO account = null;
        if(result.next()){
            
            String role = result.getString("role");
            account = new AccountDTO(userName, password, role);
        }
        return account;
    }
    
    public AccountDTO selectAccountByUserName(String userName) throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(SELECT_ACCOUNT_BY_USER_NAME);
        statement.setString(1, userName);
        ResultSet result = statement.executeQuery();
        AccountDTO account = null;
        if(result.next()){
            
            String role = result.getString("role");
            String password = result.getString("password");
            account = new AccountDTO(userName, password, role);
        }
        return account;
    }
    public void insertAccount(String userName,String password, String role) throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(INSERT_ACCOUNT);
        statement.setString(1, userName);       
        statement.setString(2, password);
        statement.setString(3, role);
        statement.executeUpdate();
        statement.close();
    } 
    public void deleteAccount(String userName) throws SQLException{
        PreparedStatement statement = this.connection.prepareStatement(DELETE_ACCOUNT);
        statement.setString(1, userName);   
        statement.executeUpdate();
        statement.close();
    }
    
    public static void main(String[] args) throws SQLException {
        System.out.println(getInstance().selectAllUsers());
    }
}
