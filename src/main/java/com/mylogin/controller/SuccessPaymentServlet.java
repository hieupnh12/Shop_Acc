package com.mylogin.controller;

import com.mylogin.dao.HistoryDAO;
import com.mylogin.dao.UserDAO;
import com.mylogin.model.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.payos.PayOS;
import vn.payos.type.PaymentLinkData;

@WebServlet(name = "SuccessPaymentServlet", urlPatterns = {"/SuccessPayment"})
public class SuccessPaymentServlet extends HttpServlet {

    private static final String CLIENT_ID = "4ac491f6-bd5f-4fc7-8e27-1aa51635f697";
    private static final String API_KEY = "b35d794f-b019-49fb-af45-93c345be6696";
    private static final String CHECKSUM_KEY = "f5be470d47fb8148832cb023fe42ea10d5e4284159b9a784a08b91a868961ac5";
    private static final PayOS payOS = new PayOS(CLIENT_ID, API_KEY, CHECKSUM_KEY);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ query parameters của returnUrl
        String orderCodeStr = request.getParameter("orderCode");
        String status = request.getParameter("status");
        String cancel = request.getParameter("cancel");
        String code = request.getParameter("code");
        String decrip = request.getParameter("description");
        // Lấy userId từ session (giả sử đã được lưu khi đăng nhập)
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();
        Users userId = (Users) session.getAttribute("account");
        // Kiểm tra các tham số cần thiết
        if (orderCodeStr == null || orderCodeStr.trim().isEmpty()) {
            request.getSession().setAttribute("notification", "Lỗi: Mã đơn hàng không được cung cấp.");
//            response.sendRedirect(request.getContextPath() + "/user/historyservice");
//            return;
        }

        if (userId == null) {
            request.getSession().setAttribute("notification", "Lỗi: Vui lòng đăng nhập để xác nhận thanh toán.");
//            response.sendRedirect(request.getContextPath() + "/user/historyservice");
//            return;
        }

        Long orderCode;
        try {
            orderCode = Long.parseLong(orderCodeStr);
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("notification", "Lỗi: Mã đơn hàng không hợp lệ.");
            response.sendRedirect(request.getContextPath() + "/user/historyservice");
            return;
        }

        String message;
        try {
            // Kiểm tra trạng thái từ PayOS
            PaymentLinkData paymentInfo = payOS.getPaymentLinkInformation(orderCode);
            System.out.println("Order Code: " + paymentInfo.getOrderCode());
            System.out.println("Status: " + paymentInfo.getStatus());
            System.out.println("Amount: " + paymentInfo.getAmountPaid());
            System.out.println("order" + orderCodeStr);
            System.out.println("status" + status);
            System.out.println("code " + code);
            System.out.println("ID" + userId);
            System.out.println("dess  " + decrip);

            // Kiểm tra trạng thái thanh toán 
            if ("PAID".equals(paymentInfo.getStatus() + "") && "00".equals(code) && "false".equalsIgnoreCase(cancel)) {
                double amount = Double.parseDouble(paymentInfo.getAmountPaid() + "");
                addVirtualMoney(userId.getUserId(), amount, orderCodeStr); // Cộng tiền vào tài khoản
                session.setAttribute("account", dao.checkUsernameExistsVerUsers(userId.getEmail()));
                message = "Nạp tiền thành công! Số tiền: " + amount + " VNĐ";
            } else if ("CANCELLED".equals(paymentInfo.getStatus()) || "true".equalsIgnoreCase(cancel)) {
                message = "Thanh toán đã bị hủy.";
            } else if ("PENDING".equals(paymentInfo.getStatus()) || "PROCESSING".equals(paymentInfo.getStatus())) {
                message = "Thanh toán đang được xử lý. Vui lòng đợi.";
            } else {
                message = "Trạng thái thanh toán không xác định: " + paymentInfo.getStatus();
            }
        } catch (Exception e) {
            System.err.println("Error verifying payment: " + e.getMessage());
            message = "Lỗi khi xác nhận thanh toán: " + e.getMessage();
        }

        // Lưu thông báo vào session
        request.getSession().setAttribute("notification", message);

        // Redirect đến trang lịch sử giao dịch
        response.sendRedirect(request.getContextPath() + "/user/historytrans");
    }

    private void addVirtualMoney(int userId, double amount, String bankid) throws ClassNotFoundException {
        // Logic cộng tiền ảo vào DB (giả lập)
        System.out.println("Cộng " + amount + " VNĐ vào tài khoản user " + userId);
        // Thay bằng code thực tế để cập nhật DB, ví dụ:
        HistoryDAO historyDAO = new HistoryDAO();
        boolean hasResults = historyDAO.testUpdatePaymentSuccess(userId, amount, bankid);
        if (hasResults) {
            System.out.println("Thanh toán thành công và số dư đã được cập nhật.");
        }
    }
}
