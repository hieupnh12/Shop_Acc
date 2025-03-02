
package com.mylogin.model;

import java.sql.Date;
import java.util.Objects;


public class Users {
    private int userId;;
    private String email;;
    private String password;;
    private String phone;
    private double balance;
    private boolean status;
    private Date create_Date;
    private Date update_date;
    private int maNhomQuyen;

    public Users() {
    }

    public Users(int userId, String email, String password, String phone, double balance, boolean status, Date create_Date, Date update_date, int maNhomQuyen) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.balance = balance;
        this.status = status;
        this.create_Date = create_Date;
        this.update_date = update_date;
        this.maNhomQuyen = maNhomQuyen;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreate_Date() {
        return create_Date;
    }

    public void setCreate_Date(Date create_Date) {
        this.create_Date = create_Date;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public int getMaNhomQuyen() {
        return maNhomQuyen;
    }

    public void setMaNhomQuyen(int maNhomQuyen) {
        this.maNhomQuyen = maNhomQuyen;
    }

    @Override
    public int hashCode() {
        int hash = 7;
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
        final Users other = (Users) obj;
        if (this.userId != other.userId) {
            return false;
        }
        if (Double.doubleToLongBits(this.balance) != Double.doubleToLongBits(other.balance)) {
            return false;
        }
        if (this.status != other.status) {
            return false;
        }
        if (this.maNhomQuyen != other.maNhomQuyen) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        if (!Objects.equals(this.phone, other.phone)) {
            return false;
        }
        if (!Objects.equals(this.create_Date, other.create_Date)) {
            return false;
        }
        return Objects.equals(this.update_date, other.update_date);
    }

    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", email=" + email + ", password=" + password + ", phone=" + phone + ", balance=" + balance + ", status=" + status + ", create_Date=" + create_Date + ", update_date=" + update_date + ", maNhomQuyen=" + maNhomQuyen + '}';
    }
    
    
}
