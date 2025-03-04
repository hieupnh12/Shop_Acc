/*
 */
package com.mylogin.dao;

import com.mylogin.data.Database;
import com.mylogin.model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserDAO implements DAOinterface<Users> {

    private static final Logger LOGGER = LoggerFactory.getLogger(Users.class);

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    @Override
    public int insert(Users t) {
        int result = 0;
//        try {
//            connection = new Database().getConnection();
//            String sql = "INSERT INTO `taikhoan`(`manv`,`tendangnhap`,`matkhau`,`manhomquyen`,`trangthai`) VALUES (?,?,?,?,?)";
//            PreparedStatement pst = (PreparedStatement) connection.prepareStatement(sql);
//            pst.setInt(1, t.getManv());
//            pst.setString(2, t.getMatkhau());
//            pst.setString(3, t.getUsername());
//            pst.setInt(4, t.getManhomquyen());
//            pst.setInt(5, t.getTrangthai());
//            result = pst.executeUpdate();
//            connection.close();
//        } catch (SQLException ex) {
//            System.out.println(ex.getMessage());
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return result;
    }

    @Override
    public int update(Users t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(String t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Users> selectAll() {
        ArrayList<Users> result = new ArrayList<Users>();
//        try {
//            connection = new Database().getConnection();
//            String sql = "SELECT * FROM taikhoan WHERE trangthai = '0' OR trangthai = '1'";
//            PreparedStatement pst = (PreparedStatement) connection.prepareStatement(sql);
//            ResultSet rs = (ResultSet) pst.executeQuery();
//            while (rs.next()) {
//                int manv = rs.getInt("manv");
//                String matkhau = rs.getString("matkhau");
//                String username = rs.getString("email");
//                int manhomquyen = rs.getInt("manhomquyen");
//                int trangthai = rs.getInt("trangthai");
//                Users tk = new Users(manv, username, matkhau, manhomquyen, trangthai);
//                result.add(tk);
//            }
//            connection.close();
//        } catch (Exception e) {
//            System.out.println(e);
//        }
        return result;
    }

    @Override
    public Users selectById(String t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int getAutoIncrement() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private Users queryGetAccount(String query) {
        Users account = new Users();
        try {
            connection = new Database().getConnection();
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                account.setUserId(resultSet.getInt(1));
                account.setEmail(resultSet.getString(2));
                account.setPassword(resultSet.getString(3));
                account.setPhone(resultSet.getString(4));
                account.setBalance(resultSet.getDouble(5));
                account.setStatus(resultSet.getBoolean(6));
                account.setCreate_Date(resultSet.getDate(7));
                account.setUpdate_date(resultSet.getDate(8));
                account.setMaNhomQuyen(resultSet.getInt(9));
                return account;
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Users checkLoginAccount(String username, String password) {
        String query = "SELECT * FROM Users WHERE email = '" + username + "' AND password = '" + password + "'";
        return queryGetAccount(query);
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
//        ArrayList<Users> result = dao.selectAll();
//        for (Users taiKhoanDTO : result) {
//            System.out.println(taiKhoanDTO.toString());
//        }

        Users tk = dao.checkLoginAccount("admin", "123");
        System.out.println(tk);
    }
}
