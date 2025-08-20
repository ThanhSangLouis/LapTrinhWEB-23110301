package vn.hcmute.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/loginsession"})
public class LoginServletSession extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        if ("sang".equals(user) && "123".equals(pass))  {
            // Create session
            HttpSession session = req.getSession();
            session.setAttribute("name", user);
            session.setMaxInactiveInterval(60); // Valid for 1 minute

            // Redirect to ProfileServlet
            resp.sendRedirect(req.getContextPath() + "/profile");
        } else {
            // Hiển thị form login với thông báo lỗi
            resp.setContentType("text/html");
            resp.getWriter().println("<!DOCTYPE html>");
            resp.getWriter().println("<html>");
            resp.getWriter().println("<head>");
            resp.getWriter().println("<meta charset='UTF-8'>");
            resp.getWriter().println("<title>Login Form</title>");
            resp.getWriter().println("</head>");
            resp.getWriter().println("<body>");
            resp.getWriter().println("<h2>Login Form</h2>");
            resp.getWriter().println("<form action='loginsession' method='post'>");
            resp.getWriter().println("UserName: <input type='text' name='username' value='' required><br/>");
            resp.getWriter().println("Password: <input type='password' name='password' value='' required><br/>");
            resp.getWriter().println("<input type='submit' value='Login'>");
            resp.getWriter().println("</form>");
            resp.getWriter().println("<p style='color: red;'>Sai tên đăng nhập hoặc mật khẩu!</p>");
            resp.getWriter().println("</body>");
            resp.getWriter().println("</html>");
        }
    }

    // Nếu bạn không muốn cho phép phương thức GET, bạn có thể override doGet và trả về lỗi hoặc chuyển hướng
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.getWriter().println("<!DOCTYPE html>");
        resp.getWriter().println("<html>");
        resp.getWriter().println("<head>");
        resp.getWriter().println("<meta charset='UTF-8'>");
        resp.getWriter().println("<title>Login Form</title>");
        resp.getWriter().println("</head>");
        resp.getWriter().println("<body>");
        resp.getWriter().println("<h2>Login Form</h2>");
        resp.getWriter().println("<form action='loginsession' method='post'>");
        resp.getWriter().println("UserName: <input type='text' name='username' value='' required><br/>");
        resp.getWriter().println("Password: <input type='password' name='password' value='' required><br/>");
        resp.getWriter().println("<input type='submit' value='Login'>");
        resp.getWriter().println("</form>");
        resp.getWriter().println("</body>");
        resp.getWriter().println("</html>");
    }
}