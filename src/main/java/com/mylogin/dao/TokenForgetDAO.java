package com.mylogin.dao;

import com.mylogin.data.Database;
import com.mylogin.model.TokenForgetPassword;
import com.mylogin.model.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TokenForgetDAO {

    private static final Logger LOGGER = LoggerFactory.getLogger(Users.class);

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    private String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatter);
        return formattedDate;
    }

    public boolean insertTokenForget(TokenForgetPassword t) throws SQLException {
        try {
            connection = Database.getConnection();
            String sql = "INSERT INTO tokenForgetPassword (token, expiryTime, isUsed, userId) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = (PreparedStatement) connection.prepareStatement(sql);

            pst.setString(1, t.getToken());
            pst.setTimestamp(2, Timestamp.valueOf(getFormatDate(t.getExpiryTime())));

            pst.setBoolean(3, t.isIsUsed());
            pst.setInt(4, t.getUserId());

            return pst.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public TokenForgetPassword getTokenPassword(String token) {
        try {
            connection = Database.getConnection();
            String sql = "Select * from [tokenForgetPassword] where token = (?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, token);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new TokenForgetPassword(
                        resultSet.getInt("id"),
                        resultSet.getInt("userId"),
                        resultSet.getBoolean("isUsed"),
                        resultSet.getString("token"),
                        resultSet.getTimestamp("expiryTime").toLocalDateTime()
                );
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateStatus(TokenForgetPassword token) {
        System.out.println("token=" + token);
        String sql = "UPDATE [dbo].[tokenForgetPassword] "
                + "SET [isUsed] = ? "
                + "WHERE token = ?";

        try {
            connection = Database.getConnection();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, token.isIsUsed());
            st.setString(2, token.getToken());
            st.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
}
