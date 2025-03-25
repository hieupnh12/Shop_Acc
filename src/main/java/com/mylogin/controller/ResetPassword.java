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
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hieup
 */
@WebServlet(name = "ResetPassword", urlPatterns = {"/resetPassword"})
public class ResetPassword extends HttpServlet {

    private TokenForgetDAO tokenDao = new TokenForgetDAO();
    private UserDAO userDAO = new UserDAO();

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
            out.println("<title>Servlet ResetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPassword at " + request.getContextPath() + "</h1>");
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
        String token = request.getParameter("token");
        HttpSession session = request.getSession();

        if (token != null) {
            String alert = "";
            TokenForgetPassword tokenForgetPassword = tokenDao.getTokenPassword(token);
           
            resetService reService = new resetService();;
            if (tokenForgetPassword == null) {
                alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                        + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                        + "                            Token invalid!\n"
                        + "                        </p>\n"
                        + "                    </div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
                return;
            }

            if (tokenForgetPassword.isIsUsed()) {
                alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                        + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                        + "                            Token is used!\n"
                        + "                        </p>\n"
                        + "                    </div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
                return;
            }

            if (reService.isExpireTime(tokenForgetPassword.getExpiryTime())) {
                alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                        + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                        + "                            Token is expire time!\n"
                        + "                        </p>\n"
                        + "                    </div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
                return;
            }

            Users user = userDAO.selectById(tokenForgetPassword.getUserId());

            request.setAttribute("email", user.getEmail());
            session.setAttribute("token", tokenForgetPassword.getToken());
            alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                    + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                    + "                            Token is expire time!\n"
                    + "                        </p>\n"
                    + "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("/views/authentication/resetPass.jsp").forward(request, response);
            return;
        } else {
            request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/views/authentication/resetPass.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPass = request.getParameter("confirmPassword");

        if (!password.equals(confirmPass)) {
            String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                    + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                    + "                            Token is expire time!\n"
                    + "                        </p>\n"
                    + "                    </div>";
            request.setAttribute("email", email);
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
            return;
        }
        
        HttpSession session = request.getSession();
        String tokenSr = (String)session.getAttribute("token");
        TokenForgetPassword tokenForgetPassword = tokenDao.getTokenPassword(tokenSr);
           // Check token is valid, time, used
            resetService reService = new resetService();
            if (tokenForgetPassword == null) {
                String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                        + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                        + "                            Token invalid!\n"
                        + "                        </p>\n"
                        + "                    </div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
                return;
            }

            if (tokenForgetPassword.isIsUsed()) {
                String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                        + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                        + "                            Token is used!\n"
                        + "                        </p>\n"
                        + "                    </div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
                return;
            }

            if (reService.isExpireTime(tokenForgetPassword.getExpiryTime())) {
                String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                        + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                        + "                            Token is expire time!\n"
                        + "                        </p>\n"
                        + "                    </div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("/views/authentication/forgotPass.jsp").forward(request, response);
                return;
            }
        // Update
        tokenForgetPassword.setToken(tokenSr);
        tokenForgetPassword.setIsUsed(true);
        
        userDAO.updatePassword(email, password);
        tokenDao.updateStatus(tokenForgetPassword);
        // Save user
        request.getRequestDispatcher(request.getContextPath() + "/login").forward(request, response);
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
