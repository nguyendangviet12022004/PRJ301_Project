package model;

import java.util.HashMap;
import java.util.Map;


public class CartDTO{
    private Map<ProductDTO,Integer> cartMap;

    public CartDTO() {
        this.cartMap = new HashMap<>();
    }
    
    public CartDTO(Map<ProductDTO, Integer> cartMap) {
        this.cartMap = cartMap;
    }

    public Map<ProductDTO, Integer> getCartMap() {
        return cartMap;
    }

    public void setCartMap(Map<ProductDTO, Integer> cartMap) {
        this.cartMap = cartMap;
    }
    
    public void addItem(ItemDTO item){
        ProductDTO product = item.getProduct();
        int quantity = item.getQuantity();
        if(this.cartMap.containsKey(product)){
            int oldQuantity = cartMap.get(product);
            
            this.cartMap.put(product, oldQuantity + quantity);
        }else{
            this.cartMap.put(product,quantity);
        }
    }
    public void deleteItem(ItemDTO item){
        ProductDTO product = item.getProduct();
        this.cartMap.remove(product);
    }
    
    public void updateItem(ItemDTO item){
        ProductDTO product = item.getProduct();
        int quantity = item.getQuantity();
        this.cartMap.put(product, quantity);
    }
    
    public int getTotal(){
        int total = 0;
        for(ProductDTO product : this.cartMap.keySet()){
            total += product.getPrice() * this.cartMap.get(product);
        }
        return total;
    }
}