package com.mylogin.dao;

import com.mylogin.data.Database;
import com.mylogin.model.LogsRef;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HistoryDAO {

    // Hàm để lấy danh sách LogRef từ cơ sở dữ liệu
    public List<LogsRef> getLogRefsByUserId(int userId) throws SQLException, ClassNotFoundException {
        List<LogsRef> logRefs = new ArrayList<>();

        // Câu truy vấn SQL
        String sql = "SELECT logsRef_id\n"
                + "      ,user_ID\n"
                + "      ,soTien_Truoc\n"
                + "      ,soTien_ThayDoi\n"
                + "      ,soTien_Sau\n"
                + "      ,reason\n"
                + "      ,create_date\n"
                + "  FROM logs_ref\n"
                + "  WHERE user_ID = ?\n"
                + "  ORDER BY create_date DESC";

        try (Connection conn = Database.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Đặt giá trị cho tham số user_ID
            stmt.setInt(1, userId);

            // Thực thi truy vấn và xử lý kết quả
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int logsRefId = rs.getInt("logsRef_id");
                    double soTienTruoc = rs.getDouble("soTien_Truoc");
                    double soTienThayDoi = rs.getDouble("soTien_ThayDoi");
                    double soTienSau = rs.getDouble("soTien_Sau");
                    String reason = rs.getString("reason");
                    Date createDate = rs.getDate("create_date");

                    // Tạo đối tượng LogRef và thêm vào danh sách
                    LogsRef logRef = new LogsRef(logsRefId, userId, soTienTruoc, soTienThayDoi,
                            soTienSau, reason, createDate);
                    logRefs.add(logRef);
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return logRefs; // Trả về danh sách các LogRef
    }

    public boolean insertPayment(int userId, double amount, String bankId, String description, String category) throws ClassNotFoundException {
        String sql = "EXEC InsertPayment ?, ?, ?, ?, ?";
        try (Connection conn = Database.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setDouble(2, amount);
            stmt.setString(3, bankId);
            stmt.setString(4, description);
            stmt.setString(5, category);
            stmt.executeUpdate();
            System.out.println("Giao dịch đã được chèn thành công!");
            return true;
        } catch (SQLException e) {
            System.out.println("Lỗi khi thực hiện giao dịch: " + e.getMessage());
            return false;
        }
    }

    public boolean testUpdatePaymentSuccess(int userId, double soTien, String bankId) throws ClassNotFoundException {
        String sql = "EXEC UpdatePaymentSuccess @user_id = ?, @soTien = ?, @bank_id = ?";

        try (Connection con = Database.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setDouble(2, soTien);
            stmt.setString(3, bankId);

            return stmt.execute();

        } catch (SQLException e) {
            System.err.println("Lỗi khi cập nhật thanh toán: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        HistoryDAO logs = new HistoryDAO();
    }
}
