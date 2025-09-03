package vn.iotstar.configs.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import vn.iotstar.configs.model.Category;
import vn.iotstar.configs.service.Impl.CategoryServiceImpl;

@WebServlet("/admin/category/add")
public class CategoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CategoryServiceImpl cateService = new CategoryServiceImpl();

    // ❗ Bổ sung xử lý GET để hiển thị form thêm
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
    }

    // Xử lý thêm danh mục khi submit
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");

        Category category = new Category();
        category.setName(name);

        try {
            cateService.insert(category);
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi thêm danh mục");
        }
    }
}
