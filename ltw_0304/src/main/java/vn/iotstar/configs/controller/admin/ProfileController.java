package vn.iotstar.configs.controller.admin;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.File;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import vn.iotstar.configs.model.UserModel;
import vn.iotstar.configs.service.IUserService;
import vn.iotstar.configs.service.Impl.UserService;
import vn.iotstar.configs.util.Constant;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = {"/admin/profile"})
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IUserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			UserModel user = (UserModel) session.getAttribute("account");
			req.setAttribute("user", user);
			req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		if (session == null || session.getAttribute("account") == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		UserModel currentUser = (UserModel) session.getAttribute("account");
		
		// Get form parameters
		String fullName = req.getParameter("fullname");
		String phone = req.getParameter("phone");
		
		// Handle file upload
		String avatar = currentUser.getAvatar(); // Keep current avatar by default
		Part filePart = req.getPart("avatar");
		
		if (filePart != null && filePart.getSize() > 0) {
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			
			// Validate file type
			if (fileName.toLowerCase().endsWith(".jpg") || 
				fileName.toLowerCase().endsWith(".png") || 
				fileName.toLowerCase().endsWith(".gif") || 
				fileName.toLowerCase().endsWith(".jpeg")) {
				
				// Create upload directory if not exists
				String uploadPath = getServletContext().getRealPath("") + File.separator + Constant.UPLOAD_DIRECTORY;
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}
				
				// Generate unique filename
				String fileExtension = fileName.substring(fileName.lastIndexOf("."));
				String newFileName = System.currentTimeMillis() + fileExtension;
				
				// Save file
				filePart.write(uploadPath + File.separator + newFileName);
				avatar = Constant.UPLOAD_DIRECTORY + "/" + newFileName;
			} else {
				req.setAttribute("error", "Chỉ chấp nhận file ảnh (jpg, png, gif, jpeg)");
				req.setAttribute("user", currentUser);
				req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
				return;
			}
		}
		
		// Update user information
		currentUser.setFullName(fullName);
		currentUser.setPhone(phone);
		currentUser.setAvatar(avatar);
		
		// Save to database
		boolean success = userService.updateProfile(currentUser);
		
		if (success) {
			// Update session
			session.setAttribute("account", currentUser);
			req.setAttribute("message", "Cập nhật thông tin thành công!");
		} else {
			req.setAttribute("error", "Có lỗi xảy ra khi cập nhật thông tin!");
		}
		
		req.setAttribute("user", currentUser);
		req.getRequestDispatcher("/views/admin/profile.jsp").forward(req, resp);
	}
}
