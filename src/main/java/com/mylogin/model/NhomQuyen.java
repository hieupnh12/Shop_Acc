
package com.mylogin.model;

import java.util.Objects;


public class NhomQuyen {
    private int maNhomQuyen;
    private String tenNhomQuyen;

    public NhomQuyen() {
    }

    public int getMaNhomQuyen() {
        return maNhomQuyen;
    }

    public void setMaNhomQuyen(int maNhomQuyen) {
        this.maNhomQuyen = maNhomQuyen;
    }

    public String getTenNhomQuyen() {
        return tenNhomQuyen;
    }

    public void setTenNhomQuyen(String tenNhomQuyen) {
        this.tenNhomQuyen = tenNhomQuyen;
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
        final NhomQuyen other = (NhomQuyen) obj;
        if (this.maNhomQuyen != other.maNhomQuyen) {
            return false;
        }
        return Objects.equals(this.tenNhomQuyen, other.tenNhomQuyen);
    }

    
    
    @Override
    public String toString() {
        return "NhomQuyen{" + "maNhomQuyen=" + maNhomQuyen + ", tenNhomQuyen=" + tenNhomQuyen + '}';
    }
    
    
}
