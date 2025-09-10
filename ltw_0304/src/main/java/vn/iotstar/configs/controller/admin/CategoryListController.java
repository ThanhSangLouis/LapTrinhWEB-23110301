package vn.iotstar.configs.controller.admin;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.iotstar.configs.model.Category;
import vn.iotstar.configs.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = {"/admin/categories", "/admin/category/list"})
public class CategoryListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CategoryServiceImpl cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Category> cateList = cateService.findAll();
        req.setAttribute("cateList", cateList);
        req.getRequestDispatcher("/views/admin/list-category.jsp").forward(req, resp);
    }
}
