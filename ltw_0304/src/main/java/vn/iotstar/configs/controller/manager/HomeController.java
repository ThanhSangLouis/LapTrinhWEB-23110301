package vn.iotstar.configs.controller.manager;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


@WebServlet(urlPatterns = {"/manager/home"})
public class HomeController extends HttpServlet {
	@Override
	protected void doGet(jakarta.servlet.http.HttpServletRequest req, jakarta.servlet.http.HttpServletResponse resp)
			throws jakarta.servlet.ServletException, java.io.IOException {
		req.getRequestDispatcher("/views/manager/home.jsp").forward(req, resp);
	}
}
