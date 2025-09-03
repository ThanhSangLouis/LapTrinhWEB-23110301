package vn.iotstar.configs.controller;

import vn.iotstar.configs.service.IUserService;
import vn.iotstar.configs.service.Impl.UserService;
import vn.iotstar.configs.util.Constant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String username = null;
		if (session != null && session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		} else {
			// Check cookie
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("username")) {
						username = cookie.getValue();
						// set lại session nếu có cookie
						session = req.getSession(true);
						session.setAttribute("username", username);
						break;
					}
				}
			}
		}

		if (username != null) {
			// Lấy thông tin user từ DB để kiểm tra role
			IUserService service = new UserService();
			vn.iotstar.configs.model.UserModel user = service.FindByUsername(username);
			if (user != null) {
				int role = user.getRoleid();
				if (role == 2) {
					resp.sendRedirect(req.getContextPath() + "/admin/home");
					return;
				} else if (role == 3) {
					resp.sendRedirect(req.getContextPath() + "/manager/home");
					return;
				} else {
					resp.sendRedirect(req.getContextPath() + "/home");
					return;
				}
			}
		}
		req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String fullname = req.getParameter("fullname");
		String phone = req.getParameter("phone");
		IUserService service = new UserService();
		String alertMsg = "";
		if (service.checkExistEmail(email)) {
			alertMsg = "Email đã tồn tại!";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
			return;
		}
		if (service.checkExistUsername(username)) {
			alertMsg = "Tài khoản đã tồn tại!";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
			return;
		}
		if (service.checkExistPhone(phone)) {
			alertMsg = "Số điện thoại đã tồn tại!";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
			return;
		}
		boolean isSuccess = service.register(username, password, email, fullname, phone);
		if (isSuccess) {
			resp.sendRedirect(req.getContextPath() + "/login");
		} else {
			alertMsg = "System error!";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher(Constant.REGISTER).forward(req, resp);
		}
	}
}
