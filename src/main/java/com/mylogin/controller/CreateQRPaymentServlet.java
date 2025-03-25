package com.mylogin.controller;

import com.mylogin.dao.HistoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import vn.payos.PayOS;
import vn.payos.type.CheckoutResponseData;
import vn.payos.type.PaymentData;

//21:41:23.762 [http-nio-8080-exec-47] DEBUG org.apache.hc.client5.http.wire -- http-outgoing-0 << "{"code":"00","desc":"success","data":{"bin":"970422","accountNumber":"0395710052","accountName":"NGUYEN MINH HIEU","amount":2000,"description":"CSV3YCQFAB6 naptien2","orderCode":1742654482,"currency":"VND","paymentLinkId":"57a5f46211e6493ebfb95712beb403ea","status":"PENDING","checkoutUrl":"https://pay.payos.vn/web/57a5f46211e6493ebfb95712beb403ea","qrCode":"00020101021238540010A00000072701240006970422011003957100520208QRIBFTTA5303704540420005802VN62240820CSV3YCQFAB6 naptien263043ED8"},"signature":"242170a6cb68985f709696dcad6d23a4145adce6f4e2a4df810b9e5f7b4e2409"}"
@WebServlet(name = "CreateQRPaymentServlet", urlPatterns = {"/CreateQRPayment"})
public class CreateQRPaymentServlet extends HttpServlet {

    private static final String CLIENT_ID = "4ac491f6-bd5f-4fc7-8e27-1aa51635f697";
    private static final String API_KEY = "b35d794f-b019-49fb-af45-93c345be6696";
    private static final String CHECKSUM_KEY = "f5be470d47fb8148832cb023fe42ea10d5e4284159b9a784a08b91a868961ac5";
    private static final PayOS payOS = new PayOS(CLIENT_ID, API_KEY, CHECKSUM_KEY);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Received POST request to /CreateQRPayment");

        String userId = request.getParameter("userId");
        if (userId == null || userId.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing userId");
            return;
        }

        String description = "naptien" + userId;
        Long orderCode = System.currentTimeMillis() / 1000;
        int amount = 2000;

        HistoryDAO historyDAO = new HistoryDAO();
        try {
            boolean success = historyDAO.insertPayment(Integer.parseInt(userId), amount, orderCode+"", "Nạp tiền vào tài khoản", "Bank");
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
            Logger.getLogger(CreateQRPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        PaymentData paymentData = PaymentData.builder()
                .orderCode(orderCode)
                .amount(amount)
                .description(description)
                .returnUrl("http://localhost:8080/Shop_Acc/SuccessPayment")
                .cancelUrl("http://localhost:8080/Shop_Acc/")
                .build();

        try {
            CheckoutResponseData result = payOS.createPaymentLink(paymentData);
            System.out.println("Redirecting to: " + result.getCheckoutUrl());
            response.sendRedirect(result.getCheckoutUrl());
        } catch (Exception e) {
            System.err.println("PayOS error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể tạo link thanh toán: " + e.getMessage());
        }
    }
}
