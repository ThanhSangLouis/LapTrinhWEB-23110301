package vn.iotstar.configs.controller.admin;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


@WebServlet(urlPatterns = {"/admin/home"})
public class HomeController extends HttpServlet {
	@Override
	protected void doGet(jakarta.servlet.http.HttpServletRequest req, jakarta.servlet.http.HttpServletResponse resp)
			throws jakarta.servlet.ServletException, java.io.IOException {
		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}
}
