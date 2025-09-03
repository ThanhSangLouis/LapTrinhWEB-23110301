package vn.iotstar.configs.controller.admin;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.iotstar.configs.service.Impl.CategoryServiceImpl;

@WebServlet("/admin/category/delete")
public class CategoryDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CategoryServiceImpl cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        cateService.delete(Integer.parseInt(id));
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
