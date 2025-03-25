package com.mylogin.controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mylogin.dao.GoogleLogin;
import com.mylogin.dao.Iconstant;
import com.mylogin.dao.UserDAO;
import com.mylogin.model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

@WebServlet(name = "LoginControl", value = "/login")
public class LoginControl extends HttpServlet {

    // Call DAO class to access with database.
    UserDAO accountDao = new UserDAO();

    private Users getAccountCookie(HttpServletRequest request) {
        // Get list cookies of the browser.
        Cookie[] cookies = request.getCookies();

        Users account;
        String username = "";
        String password = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
                if (cookie.getName().equals("password")) {
                    password = cookie.getValue();
                }
            }
        } else {
            return null;
        }
        account = accountDao.checkLoginAccount(username, password);
        return account;
    }

    private void executeLogin(HttpServletRequest request, HttpServletResponse response, Users account) throws IOException {
        // Get the status of remember me checkbox.
        HttpSession session = request.getSession();
        boolean rememberMe = (request.getParameter("remember-me-checkbox") != null);

        session.setAttribute("account", account);
        if (rememberMe) {
            Cookie usernameCookie = new Cookie("username", account.getEmail());
            usernameCookie.setMaxAge(600);
            response.addCookie(usernameCookie);

            Cookie passwordCookie = new Cookie("password", account.getPassword());
            passwordCookie.setMaxAge(600);
            response.addCookie(passwordCookie);
        }
        response.sendRedirect(request.getContextPath() + "/");
    }

    private void checkLoginAccountFirstTime(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check status is typed wrong input or not.
        String status = "";
        if (request.getParameter("status") != null) {
            status = request.getParameter("status");
        }
        // Get the submitted username and password.
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check account in database.
        Users account = accountDao.checkLoginAccount(username, password);
        if (account == null && status.equals("typed")) {
            // An alert to send to login page.
            String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                    + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                    + "                            Wrong username or password!\n"
                    + "                        </p>\n"
                    + "                    </div>";
            // Set attribute for alert tag in login.jsp page.
            request.setAttribute("alert", alert);
            // Resend to login page.
            request.getRequestDispatcher("/views/authentication/login.jsp").forward(request, response);
        } else if (account == null) {
            // Send to login page if the user have not typed input yet.
            request.getRequestDispatcher("/views/authentication/login.jsp").forward(request, response);
        } else {
            // Login when all information are correct.
            executeLogin(request, response, account);
        }
    }

    private Users getGoogleUserInfo(String accessToken) throws IOException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(Iconstant.GOOGLE_LINK_GET_USER_INFO + "?access_token=" + accessToken);

        try (CloseableHttpResponse response = httpClient.execute(httpGet)) {
            String jsonResponse = EntityUtils.toString(response.getEntity());
            JsonObject userInfo = JsonParser.parseString(jsonResponse).getAsJsonObject();
            System.out.println("Google UserInfo Response: " + jsonResponse); // Debug

// Kiểm tra lỗi từ Google
            if (userInfo.get("error") != null) {
                throw new IOException("Google API error: " + userInfo.get("error").getAsString());
            }

// Kiểm tra nếu không có "email"
            if (userInfo.get("email") == null) {
                throw new IOException("No email found in Google response: " + jsonResponse);
            }

            String email = userInfo.get("email").getAsString();
            String name = userInfo.get("name") != null ? userInfo.get("name").getAsString() : "Google User";

            Users account = accountDao.checkLoginAccount(email, null);
            if (account == null) {
                account = new Users(email, "", "", 2); // Password trống vì dùng Google
                accountDao.insert(account);
            }
            return account;
        } finally {
            httpClient.close();
        }
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check the cookies of account.
        String code = request.getParameter("code");
        if (code != null) {
            System.out.println("Google Auth Code: " + code); // Debug
            try {
                // Xử lý Google login
                String accessToken = GoogleLogin.getToken(code);
                Users account = getGoogleUserInfo(accessToken);
                Users account1 = accountDao.checkUsernameExistsVerUsers(account.getEmail());
                executeLogin(request, response, account1);
            } catch (Exception e) {
                e.printStackTrace();
                String alert = "<div style=\"margin-top: 15px;\" class=\"alert alert-danger wrap-input100\">\n"
                        + "                        <p style=\"font-family: Ubuntu-Bold; font-size: 18px; margin: 0.25em 0; text-align: center\">\n"
                        + "                            Google login failed!\n"
                        + "                        </p>\n"
                        + "                    </div>";
                request.setAttribute("alert", alert);
                request.getRequestDispatcher("/views/authentication/login.jsp").forward(request, response);
            }
        } else {
            // Xử lí như bình thường
            Users account = getAccountCookie(request);
            if (account == null) {
                // Check if account login first time or not.
                checkLoginAccountFirstTime(request, response);
            } else {
                // Execute login if exist account cookie.
                executeLogin(request, response, account);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }
}
