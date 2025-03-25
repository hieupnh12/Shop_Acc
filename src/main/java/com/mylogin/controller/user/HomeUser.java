package com.mylogin.controller.user;

import com.mylogin.dao.UserDAO;
import com.mylogin.model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hieup
 */
@WebServlet(name = "HomeUser", urlPatterns = {"/user/home"})
public class HomeUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/user/userPage.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users account = (Users) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect("/views/authentication/login.jsp");
            return;
        }

        String type = request.getParameter("type");

        if ("1".equals(type)) {
            changePassword(request, response, account);
            session.setAttribute("account", account);
        } else if ("2".equals(type)) {
            updatePhoneNumber(request, response, account);
            session.setAttribute("account", account);
        } else {
            response.sendRedirect("/views/user/userPage.jsp");
        }
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response, Users account) throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!account.getPassword().equals(oldPassword)) {
            request.setAttribute("messagePhone", "Mật khẩu cũ không đúng.");
            request.getRequestDispatcher("/views/user/userPage.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("messagePhone", "Mật khẩu mới không khớp.");
            request.getRequestDispatcher("/views/user/userPage.jsp").forward(request, response);
            return;
        }
        
        account.setPassword(newPassword);
        boolean updated = updatePasswordInDB(account);

        if (updated) {
            request.setAttribute("messagePhone", "Đổi mật khẩu thành công.");
        } else {
            request.setAttribute("messagePhone", "Lỗi khi cập nhật mật khẩu.");
        }
        request.getRequestDispatcher("/views/user/userPage.jsp").forward(request, response);
    }

    private void updatePhoneNumber(HttpServletRequest request, HttpServletResponse response, Users account) throws ServletException, IOException {
        String newPhoneNumber = request.getParameter("newPhoneNumber");
        if (!newPhoneNumber.matches("\\d{10,11}")) {
            request.setAttribute("messagePhone", "Số điện thoại không hợp lệ." + newPhoneNumber);
            request.getRequestDispatcher("/views/user/userPage.jsp").forward(request, response);
            return;
        }
        
        account.setPhone(newPhoneNumber);
        boolean updated = updatePhoneInDB(account);
        
        if (updated) {
            request.setAttribute("messagePhone", "Cập nhật số điện thoại thành công.");
        } else {
            request.setAttribute("messagePhone", "Lỗi khi cập nhật số điện thoại.");
        }
        request.getRequestDispatcher("/views/user/userPage.jsp").forward(request, response);
    }

    private boolean updatePhoneInDB(Users account) {
        // Cập nhật số điện thoại vào database
        UserDAO userDao = new UserDAO();
        boolean check = userDao.update(account);
        if (check == false) {
            return false;
        }
        return true; // Thay bằng truy vấn thực tế
    }

    private boolean updatePasswordInDB(Users account) {
        // Cập nhật mật khẩu vào database
        System.out.println(account.toString());
        UserDAO userDao = new UserDAO();
        boolean check = userDao.update(account);
        if (check == false) {
            return false;
        }
        return true; // Thay bằng truy vấn thực tế
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
