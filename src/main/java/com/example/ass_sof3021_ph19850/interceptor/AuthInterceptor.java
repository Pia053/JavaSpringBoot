package com.example.ass_sof3021_ph19850.interceptor;

import com.example.ass_sof3021_ph19850.entity.Account;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String requestURI = request.getRequestURI();

        // kiểm tra xác thực:
        boolean isAuthenticated = checkAuthentication(session);
        if (!isAuthenticated) {
            // Chuyển hướng đến trang đăng nhập nếu chưa xác thực
            response.sendRedirect("/login");
            return false;
        }


        // Kiểm tra phân quyền cho admin
        if (requestURI.startsWith("/admin")) {
            boolean isAdmin = checkAdminRole(session);
            if (!isAdmin) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN); // Trả về mã lỗi 403 nếu không phải admin
                return false;
            }
        }

        // Kiểm tra phân quyền cho user
        if (requestURI.startsWith("/user")) {
            boolean isUser = checkUserRole(session);
            if (!isUser) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN); // Trả về mã lỗi 403 nếu không phải user
                return false;
            }
        }

        // Tiếp tục xử lý request nếu đã xác thực và có quyền truy cập
        return true;
    }

    private boolean checkAuthentication(HttpSession session) {
        // trả về true khi tồn tại account
        return session.getAttribute("account") != null;
    }

    private boolean checkAdminRole(HttpSession session) {
        // Kiểm tra vai trò admin (ví dụ: kiểm tra thông tin người dùng trong session, database, ...)
        // Trả về true nếu có vai trò admin, ngược lại trả về false
        Account account = (Account) session.getAttribute("account");
        return account != null && account.getChucVu().getTenChucVu().equals("ADMIN");
    }

    private boolean checkUserRole(HttpSession session) {
        // Kiểm tra vai trò user (ví dụ: kiểm tra thông tin người dùng trong session, database, ...)
        // Trả về true nếu có vai trò user, ngược lại trả về false
        Account account = (Account) session.getAttribute("account");
        return account != null && account.getChucVu().getTenChucVu().equals("USER");
    }
}
