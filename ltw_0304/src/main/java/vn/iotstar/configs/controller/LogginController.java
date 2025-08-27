package vn.iotstar.configs.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.configs.model.UserModel;
import vn.iotstar.configs.service.IUserService;
import vn.iotstar.configs.service.Impl.UserService;

public class LogginController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	private IUserService userService = new UserService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserModel user = userService.login(username, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/home");
		} else {
			request.setAttribute("errorMessage", "Invalid username or password");
			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		}
	}
}