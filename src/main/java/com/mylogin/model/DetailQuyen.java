
package com.mylogin.model;


public class DetailQuyen {
    private int maChucNang;
    private int maNhomQuyen;
    private String hanhDong;

    public DetailQuyen() {
    }

    public DetailQuyen(int maChucNang, int maNhomQuyen, String hanhDong) {
        this.maChucNang = maChucNang;
        this.maNhomQuyen = maNhomQuyen;
        this.hanhDong = hanhDong;
    }

    public int getMaChucNang() {
        return maChucNang;
    }

    public void setMaChucNang(int maChucNang) {
        this.maChucNang = maChucNang;
    }

    public int getMaNhomQuyen() {
        return maNhomQuyen;
    }

    public void setMaNhomQuyen(int maNhomQuyen) {
        this.maNhomQuyen = maNhomQuyen;
    }

    public String getHanhDong() {
        return hanhDong;
    }

    public void setHanhDong(String hanhDong) {
        this.hanhDong = hanhDong;
    }

    @Override
    public String toString() {
        return "DetailQuyen{" + "maChucNang=" + maChucNang + ", maNhomQuyen=" + maNhomQuyen + ", hanhDong=" + hanhDong + '}';
    }
    
    
}
