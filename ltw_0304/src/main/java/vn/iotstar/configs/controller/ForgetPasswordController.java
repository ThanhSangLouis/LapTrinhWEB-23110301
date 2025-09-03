package vn.iotstar.configs.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.configs.service.IUserService;
import vn.iotstar.configs.service.Impl.UserService;

public class ForgetPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/forget_password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String newPassword = req.getParameter("newPassword");

        if (newPassword == null || newPassword.isEmpty()) {
            // Bước 1: chỉ nhập email
            boolean emailExists = userService.checkExistEmail(email);
            if (emailExists) {
                req.setAttribute("emailValid", true);
                req.setAttribute("email", email); // giữ lại email
                req.setAttribute("message", "Email hợp lệ. Vui lòng nhập mật khẩu mới.");
            } else {
                req.setAttribute("emailValid", false);
                req.setAttribute("message", "Email không tồn tại trong hệ thống.");
            }
            req.getRequestDispatcher("/views/forget_password.jsp").forward(req, resp);
        } else {
            // Bước 2: nhập mật khẩu mới
            boolean isUpdated = userService.updatePasswordByEmail(email, newPassword);
            if (isUpdated) {
                // redirect để tránh lỗi F5
                resp.sendRedirect(req.getContextPath() + "/login?reset=success");
            } else {
                req.setAttribute("message", "Cập nhật mật khẩu thất bại. Vui lòng thử lại.");
                req.getRequestDispatcher("/views/forget_password.jsp").forward(req, resp);
            }
        }
    }
}
