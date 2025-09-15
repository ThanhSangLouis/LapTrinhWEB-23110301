package vn.iotstar.controller;

import vn.iotstar.configs.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/profile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UserProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy userId từ session (giả sử đã đăng nhập)
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        if (userId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        try (Connection conn = new DBConnect().getConnection()) {
            String sql = "SELECT * FROM Users WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                req.setAttribute("fullname", rs.getString("fullname"));
                req.setAttribute("phone", rs.getString("phone"));
                req.setAttribute("images", rs.getString("images"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        if (userId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        Part filePart = req.getPart("images");
        String fileName = null;
        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        if (filePart != null && filePart.getSize() > 0) {
            fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            filePart.write(uploadPath + File.separator + fileName);
        }
        try (Connection conn = new DBConnect().getConnection()) {
            String sql = fileName != null ?
                    "UPDATE Users SET fullname=?, phone=?, images=? WHERE id=?" :
                    "UPDATE Users SET fullname=?, phone=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullname);
            stmt.setString(2, phone);
            if (fileName != null) {
                stmt.setString(3, "uploads/" + fileName);
                stmt.setInt(4, userId);
            } else {
                stmt.setInt(3, userId);
            }
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("profile");
    }
}
