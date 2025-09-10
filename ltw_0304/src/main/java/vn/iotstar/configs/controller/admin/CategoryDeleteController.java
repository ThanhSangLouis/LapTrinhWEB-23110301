package vn.iotstar.configs.controller.admin;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.iotstar.configs.model.Category;
import vn.iotstar.configs.service.ICategoryService;
import vn.iotstar.configs.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = "/admin/category/delete")
public class CategoryDeleteController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ICategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        
        if (id == null || id.trim().isEmpty()) {
            req.setAttribute("error", "ID category không được để trống");
            resp.sendRedirect(req.getContextPath() + "/admin/categories");
            return;
        }
        
        try {
            int categoryId = Integer.parseInt(id);
            Category category = categoryService.findById(categoryId);
            
            if (category == null) {
                req.setAttribute("error", "Không tìm thấy category với ID: " + id);
                resp.sendRedirect(req.getContextPath() + "/admin/categories");
                return;
            }
            
            // Delete icon file if exists
            if (category.getIcon() != null && !category.getIcon().isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + "uploads";
                File iconFile = new File(uploadPath + File.separator + category.getIcon());
                if (iconFile.exists()) {
                    iconFile.delete();
                }
            }
            
            // Delete category from database
            categoryService.delete(categoryId);
            
            req.getSession().setAttribute("message", "Xóa category thành công!");
            resp.sendRedirect(req.getContextPath() + "/admin/categories");
            
        } catch (NumberFormatException e) {
            req.setAttribute("error", "ID category không hợp lệ");
            resp.sendRedirect(req.getContextPath() + "/admin/categories");
        } catch (Exception e) {
            req.setAttribute("error", "Có lỗi xảy ra khi xóa category: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/categories");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Redirect POST requests to GET for consistency
        doGet(req, resp);
    }
}
