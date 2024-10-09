package model;

import java.util.Date;
import java.util.Objects;


public class OrderDTO {
    private int id;
    private AccountDTO account;
    private Date date;
    private CartDTO cart;
    private String status;

    public OrderDTO(int id, AccountDTO account, Date date, CartDTO cart, String status) {
        this.id = id;
        this.account = account;
        this.date = date;
        this.cart = cart;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public AccountDTO getAccount() {
        return account;
    }

    public void setAccount(AccountDTO account) {
        this.account = account;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public CartDTO getCart() {
        return cart;
    }

    public void setCart(CartDTO cart) {
        this.cart = cart;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + this.id;
        hash = 89 * hash + Objects.hashCode(this.account);
        hash = 89 * hash + Objects.hashCode(this.date);
        hash = 89 * hash + Objects.hashCode(this.cart);
        hash = 89 * hash + Objects.hashCode(this.status);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final OrderDTO other = (OrderDTO) obj;
        return this.id == other.id;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "id=" + id + ", account=" + account + ", date=" + date + ", cart=" + cart + ", status=" + status + '}';
    }
    
    
    
}


