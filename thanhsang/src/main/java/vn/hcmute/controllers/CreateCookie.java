package vn.hcmute.controllers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/createcookie")
public class CreateCookie extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ten = request.getParameter("ten");
        String holot = request.getParameter("holot");

        // Tạo cookie cho tên và họ lót
        Cookie firstName = new Cookie("ten", ten);
        Cookie lastName = new Cookie("holot", holot);

        // Thiết lập thời gian hết hạn cho cookie (24 giờ)
        firstName.setMaxAge(60 * 60 * 24);  // 1 ngày
        lastName.setMaxAge(60 * 60 * 24);   // 1 ngày

        // Thêm cookie vào response
        response.addCookie(firstName);
        response.addCookie(lastName);

        // In ra kết quả
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<b>First Name</b>: " + firstName.getValue() + " - <b>Last Name</b>: " + lastName.getValue());
    }
}

