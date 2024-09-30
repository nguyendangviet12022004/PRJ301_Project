package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountDTO;
import util.DBHelper;

public class AccountDAO {
    private String SELECT_ALL_ACCOUNTS = "SELECT * FROM ACCOUNT";
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
    
    public static void main(String[] args) throws SQLException {
        System.out.println(getInstance().selectAllAccounts());
    }
}
