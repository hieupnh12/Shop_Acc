package com.mylogin.filter;

import com.mylogin.model.Users;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthorizationFilter", value = "/admin/*")
public class AuthorizationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String admin401URI = request.getContextPath() + "/admin/401";
        String requestURI = request.getRequestURI(); // Lấy đường dẫn hiện tại

        // Bỏ qua filter cho trang lỗi 401
        if (requestURI.endsWith("/admin/401")) {
            chain.doFilter(request, response);
            return;
        }

        // Nếu session không tồn tại hoặc chưa đăng nhập
        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
        }
        if (session != null) {
            Users currentUser = (Users) session.getAttribute("account");
            int role = currentUser.getMaNhomQuyen();
            boolean isAdmin = (role == 1);
            boolean isManager = (role == 3);

            // Nếu Manager cố gắng vào trang admin/home => Chặn lại
            if (requestURI.endsWith("/admin/home") && !isAdmin) {
                response.sendRedirect(admin401URI);
                return;
            }

            // Nếu có quyền hợp lệ thì tiếp tục request
            if (isAdmin || isManager) {
                chain.doFilter(request, response);
            } else {
                response.sendRedirect(admin401URI);
            }
        }
    }
}
