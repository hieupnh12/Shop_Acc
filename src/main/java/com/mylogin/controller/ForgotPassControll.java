package com.mylogin.controller;

import com.mylogin.dao.TokenForgetDAO;
import com.mylogin.dao.UserDAO;
import com.mylogin.dao.resetService;
import com.mylogin.model.TokenForgetPassword;
import com.mylogin.model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hieup
 */
@WebServlet(name = "ForgotPassControll", urlPatterns = {"/forgot-password"})
public class ForgotPassControll extends HttpServlet {

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
            out.println("<title>Servlet ForgotPassControll</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassControll at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
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
        UserDAO userDAO = new UserDAO();
        String email = request.getParameter("email");

        Users user = userDAO.checkUsernameExistsVerUsers(email);

        if (user == null) {
            String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                    + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                    + "                            Wrong username or password!\n"
                    + "                        </p>\n"
                    + "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
            return;
        }

        // Tồn tại 
        if (user.isStatus() == false) {
            String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                    + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                    + "                            Bạn đăng nhập bằng google nên không thể lấy mật khẩu\n"
                    + "                        </p>\n"
                    + "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
        } else {
            resetService service = new resetService();
            String token = service.generateToken();
            String linkReset = "http://localhost:8080/Shop_Acc/resetPassword?token=" + token;

            TokenForgetPassword newTokenForget = new TokenForgetPassword(user.getUserId(), false, token, service.expireDateTime());

            //send link to this mail
            TokenForgetDAO tokenDao = new TokenForgetDAO();
            try {
                boolean isInsert = tokenDao.insertTokenForget(newTokenForget);

                if (!isInsert) {
                    String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                            + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                            + "                            Have error in server\n"
                            + "                        </p>\n"
                            + "                    </div>";
                    request.setAttribute("alert", alert);
                    request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
                    return;
                }

                boolean isSend = service.sendEmail(email, linkReset, user.getEmail());
                if (!isSend) {
                    String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                            + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                            + "                            Can not send request\n"
                            + "                        </p>\n"
                            + "                    </div>";
                    request.setAttribute("alert", alert);
                    request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
                }

                String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                        + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                        + "                            Send successfully\n"
                        + "                        </p>\n"
                        + "                    </div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(ForgotPassControll.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

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
