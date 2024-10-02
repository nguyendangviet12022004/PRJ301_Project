package model;

import java.util.Objects;

public class AccountDTO {
    private String userName;
    private String password;
    private String role;

    public AccountDTO() {
    }

    public AccountDTO(String userName, String password, String role) {
        this.userName = userName;
        this.password = password;
        this.role = role;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 73 * hash + Objects.hashCode(this.userName);
        hash = 73 * hash + Objects.hashCode(this.password);
        hash = 73 * hash + Objects.hashCode(this.role);
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
        final AccountDTO other = (AccountDTO) obj;
        return Objects.equals(this.userName, other.userName);
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "userName=" + userName + ", password=" + password + ", role=" + role + '}';
    }
    
    
}
