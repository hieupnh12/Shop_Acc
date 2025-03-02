
package com.mylogin.model;


public class DanhMucChucNang {
    private int maChucNang;
    private String tenChucNang;

    public DanhMucChucNang() {
    }

    public DanhMucChucNang(int maChucNang, String tenChucNang) {
        this.maChucNang = maChucNang;
        this.tenChucNang = tenChucNang;
    }

    public int getMaChucNang() {
        return maChucNang;
    }

    public void setMaChucNang(int maChucNang) {
        this.maChucNang = maChucNang;
    }

    public String getTenChucNang() {
        return tenChucNang;
    }

    public void setTenChucNang(String tenChucNang) {
        this.tenChucNang = tenChucNang;
    }

    @Override
    public String toString() {
        return "DanhMucChucNang{" + "maChucNang=" + maChucNang + ", tenChucNang=" + tenChucNang + '}';
    }
    
    
}
