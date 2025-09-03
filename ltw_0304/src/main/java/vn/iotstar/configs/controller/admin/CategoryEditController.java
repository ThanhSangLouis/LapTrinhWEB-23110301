package vn.iotstar.configs.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.iotstar.configs.model.Category;
import vn.iotstar.configs.service.Impl.CategoryServiceImpl;

@WebServlet("/admin/category/edit")
public class CategoryEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CategoryServiceImpl cateService = new CategoryServiceImpl();

    // HIỂN THỊ FORM CHỈNH SỬA
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = cateService.findById(id);
        req.setAttribute("category", category);
        req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
    }

    // CẬP NHẬT DỮ LIỆU DANH MỤC
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            // Nếu chưa làm upload ảnh, bạn có thể để ảnh mặc định hoặc bỏ qua
            String icon = req.getParameter("icon"); // chỉ lấy tên chuỗi (nếu có)

            Category category = new Category();
            category.setId(id);
            category.setName(name);
            category.setIcon(icon); // hoặc null

            cateService.update(category);
            resp.sendRedirect(req.getContextPath() + "/admin/category/list");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/category/edit?id=" + req.getParameter("id"));
        }
    }
}
