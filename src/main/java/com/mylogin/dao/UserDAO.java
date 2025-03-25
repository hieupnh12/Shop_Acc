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
import java.util.List;
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
        int result = -1;
        try {
            connection = Database.getConnection();
            String sql = "INSERT INTO Users (email, password, phone, balance, update_date, maNhomQuyen) VALUES (?, ?, ?, ?, GETDATE(), ?)";
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, t.getEmail());
            pst.setString(2, t.getPassword());
            pst.setString(3, t.getPhone());
            pst.setDouble(4, t.getBalance());
            pst.setInt(5, t.getMaNhomQuyen());
            result = pst.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    @Override
    public boolean update(Users t) {
        try {
            connection = Database.getConnection();
            String sql = "UPDATE Users SET password = ?, phone = ?, balance = ?, update_date = GETDATE(), maNhomQuyen = ? WHERE email = ?";
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, t.getPassword());
            pst.setString(2, t.getPhone());
            pst.setDouble(3, t.getBalance());
            pst.setInt(4, t.getMaNhomQuyen());
            pst.setString(5, t.getEmail());
            pst.executeUpdate();
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public int delete(String t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Users> selectAll() {
        ArrayList<Users> result = new ArrayList<>();
        Users account = new Users();
        try {
            connection = Database.getConnection();
            String sql = "SELECT * FROM Users WHERE status = '0' OR status = '1'";
            PreparedStatement pst = (PreparedStatement) connection.prepareStatement(sql);
            ResultSet rs = (ResultSet) pst.executeQuery();
            while (rs.next()) {
                account.setUserId(resultSet.getInt(1));
                account.setEmail(resultSet.getString(2));
                account.setPassword(resultSet.getString(3));
                account.setPhone(resultSet.getString(4));
                account.setBalance(resultSet.getDouble(5));
                account.setStatus(resultSet.getBoolean(6));
                account.setCreate_Date(resultSet.getDate(7));
                account.setUpdate_date(resultSet.getDate(8));
                account.setMaNhomQuyen(resultSet.getInt(9));
                result.add(account);
            }
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
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

    // Method to get login account from database.
    public Users checkLoginAccount(String username, String password) {
        String query = "SELECT * FROM Users WHERE email = '" + username + "' AND password = '" + password + "'";
        return queryGetAccount(query);
    }

    // Method to check is username exist or not.
    public boolean checkUsernameExists(String username) {
        String query = "SELECT * FROM Users WHERE email = '" + username + "'";
        return (queryGetAccount(query) != null);
    }

    public Users checkUsernameExistsVerUsers(String username) {
        String query = "SELECT * FROM Users WHERE email = '" + username + "'";
        return (queryGetAccount(query));
    }

    public boolean updatePassword(String email, String pass) {
        String sql = "UPDATE Users SET password = ? WHERE email = ?";
        try {
            connection = Database.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, pass);
            preparedStatement.setString(2, email);
            preparedStatement.executeUpdate();
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    // Method to get account by id.
    @Override
    public Users selectById(int t) {
        String query = "SELECT * FROM Users WHERE user_ID = " + t;
        return queryGetAccount(query);
    }

     public List<Users> getTop5NapTien() throws ClassNotFoundException {
        List<Users> usersTop5 = new ArrayList<>();
        String sql = "SELECT user_ID, email, phone, tong_nap FROM Top5_NapTien";

        try {
             connection = Database.getConnection();
             preparedStatement = connection.prepareStatement(sql);
             resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("user_ID");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                double tongNap = resultSet.getDouble("tong_nap");

                usersTop5.add(new Users(userId, email, phone, tongNap));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return usersTop5;
    }
    
    
    
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();

        Users tk = new Users(2, "user1", "123", "0987654344", 01232, true, null, null, 2);
       
        dao.update(tk);

    }
}
