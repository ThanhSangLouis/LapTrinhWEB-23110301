package vn.iotstar.configs.controller.admin;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.iotstar.configs.model.Category;
import vn.iotstar.configs.service.ICategoryService;
import vn.iotstar.configs.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = "/admin/category/edit")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class CategoryEditController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ICategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        
        if (id == null || id.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/categories");
            return;
        }
        
        try {
            int categoryId = Integer.parseInt(id);
            Category category = categoryService.findById(categoryId);
            
            if (category == null) {
                req.setAttribute("error", "Không tìm thấy category với ID: " + id);
                req.getRequestDispatcher("/views/admin/list-category.jsp").forward(req, resp);
                return;
            }
            
            req.setAttribute("category", category);
            req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
            
        } catch (NumberFormatException e) {
            req.setAttribute("error", "ID category không hợp lệ");
            req.getRequestDispatcher("/views/admin/list-category.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        
        // Validate input
        if (idStr == null || idStr.trim().isEmpty()) {
            req.setAttribute("error", "ID category không được để trống");
            req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
            return;
        }
        
        if (name == null || name.trim().isEmpty()) {
            req.setAttribute("error", "Tên category không được để trống");
            req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
            return;
        }
        
        try {
            int categoryId = Integer.parseInt(idStr);
            Category existingCategory = categoryService.findById(categoryId);
            
            if (existingCategory == null) {
                req.setAttribute("error", "Không tìm thấy category với ID: " + idStr);
                req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
                return;
            }
            
            // Update category information
            existingCategory.setName(name);
            
            // Handle file upload
            Part filePart = req.getPart("icon");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = getSubmittedFileName(filePart);
                
                if (fileName != null && !fileName.isEmpty()) {
                    // Create upload directory if not exists
                    String uploadPath = getServletContext().getRealPath("") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    // Delete old icon file if exists
                    if (existingCategory.getIcon() != null && !existingCategory.getIcon().isEmpty()) {
                        File oldFile = new File(uploadPath + File.separator + existingCategory.getIcon());
                        if (oldFile.exists()) {
                            oldFile.delete();
                        }
                    }

                    // Generate unique filename
                    String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                    String filePath = uploadPath + File.separator + uniqueFileName;

                    // Save new file
                    filePart.write(filePath);
                    existingCategory.setIcon(uniqueFileName);
                }
            }
            
            // Update category
            categoryService.update(existingCategory);
            
            req.setAttribute("message", "Cập nhật category thành công!");
            resp.sendRedirect(req.getContextPath() + "/admin/categories");
            
        } catch (NumberFormatException e) {
            req.setAttribute("error", "ID category không hợp lệ");
            req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Có lỗi xảy ra khi cập nhật category: " + e.getMessage());
            req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
        }
    }
    
    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
