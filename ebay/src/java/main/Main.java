
package main;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.sql.SQLException;
import java.util.List;
import model.ProductDTO;


public class Main {

        public static void main(String[] args) throws SQLException {
        
        List<ProductDTO> list = ProductDAO.getInstance().selectAllProducts();
        for(ProductDTO product : list){
            System.out.println(product);
        }
    }
    
}
