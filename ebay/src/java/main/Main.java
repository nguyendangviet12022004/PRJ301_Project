
package main;

import dao.CategoryDAO;
import java.sql.SQLException;


public class Main {

        public static void main(String[] args) throws SQLException {
        CategoryDAO dao = CategoryDAO.getInstance();
        System.out.println(dao.selectAllCategories());
    }
    
}
