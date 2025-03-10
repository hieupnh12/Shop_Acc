package com.mylogin.data;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class Database {
    private static String URL;
    private static String USER;
    private static String PASSWORD;

    // Load cấu hình từ file config.properties
    static {
        try (InputStream input = Database.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                throw new RuntimeException("❌ Không tìm thấy file config.properties");
            }

            Properties prop = new Properties();
            prop.load(input);

            URL = prop.getProperty("db.url");
            USER = prop.getProperty("db.user");
            PASSWORD = prop.getProperty("db.password");

            System.out.println("✅ Đã tải thông tin kết nối Database từ config.properties!");
        } catch (IOException e) {
            throw new RuntimeException("❌ Lỗi khi tải file config.properties", e);
        }
    }
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Load MySQL driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
    
    public static void main(String[] args) {
        try (Connection conn = Database.getConnection()) {
            System.out.println("✅ Kết nối SQL Server thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



