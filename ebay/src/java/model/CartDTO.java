package model;

import java.util.Map;


public class CartDTO{
    private Map<ProductDTO,Integer> cartMap;

    public CartDTO() {
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
        if(this.cartMap.containsKey(item.getProduct())){
            //
        }else{
            //
        }
    }
    public void deleteItem(ItemDTO item){
        //
    }
}