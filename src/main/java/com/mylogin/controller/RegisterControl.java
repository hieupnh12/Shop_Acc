package com.mylogin.controller;

import com.mylogin.dao.UserDAO;
import com.mylogin.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterControl", value = "/register")
@MultipartConfig
public class RegisterControl extends HttpServlet {

    // Call DAO class to access with database.
    UserDAO accountDao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/authentication/register.jsp").forward(req, resp);
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get username and password from request.
        String username = request.getParameter("username");
        String phone = request.getParameter("numPhone");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("repeat-password");

        // Set default profile image for account.
//        Part part = request.getPart("profile-image");
//        InputStream inputStream = part.getInputStream();
        // Check password and repeatPassword are the same.
        if (!password.equals(repeatPassword)) {
            String alert = "<div class=\"alert alert-danger wrap-input100\">\n"
                    + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                    + "                            Incorrect password!\n"
                    + "                        </p>\n"
                    + "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("/views/authentication/register.jsp").forward(request, response);
        } // Check username is existed or not from database.
        else if (accountDao.checkUsernameExists(username)) {
            String alert = "<div class=\"alert alert-danger wrap-input100\">\n"
                    + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                    + "                            Username already exist!\n"
                    + "                        </p>\n"
                    + "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("/views/authentication/register.jsp").forward(request, response);
        } // Insert username, password to database and create account.
        else {
            Users user = new Users(username, password, phone, 2);
            user.setStatus(true);
            accountDao.insert(user);
            String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-success wrap-input100\">\n"
                    + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                    + "                            Create account successfully!\n"
                    + "                        </p>\n"
                    + "                    </div>";
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("/views/authentication/login.jsp").forward(request, response);
        }
    }
}
