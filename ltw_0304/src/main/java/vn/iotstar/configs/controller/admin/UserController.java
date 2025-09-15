package vn.iotstar.configs.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.configs.model.UserModel;
import vn.iotstar.configs.service.IUserService;
import vn.iotstar.configs.service.Impl.UserService;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/user/list", "/admin/user/add", "/admin/user/edit", "/admin/user/delete"})
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/admin/user/list":
                listUsers(req, resp);
                break;
            case "/admin/user/add":
                showAddForm(req, resp);
                break;
            case "/admin/user/edit":
                showEditForm(req, resp);
                break;
            case "/admin/user/delete":
                deleteUser(req, resp);
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/admin/user/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/admin/user/add":
                addUser(req, resp);
                break;
            case "/admin/user/edit":
                editUser(req, resp);
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/admin/user/list");
        }
    }

    private void listUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserModel> userList = userService.findAll();
        req.setAttribute("userList", userList);
        req.getRequestDispatcher("/views/admin/user-list.jsp").forward(req, resp);
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/user-add.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        UserModel user = userService.findById(Integer.parseInt(id));
        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/admin/user-edit.jsp").forward(req, resp);
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel user = new UserModel();
        user.setUserName(req.getParameter("userName"));
        user.setFullName(req.getParameter("fullName"));
        user.setEmail(req.getParameter("email"));
        user.setPassWord(req.getParameter("passWord"));
        user.setRoleid(Integer.parseInt(req.getParameter("roleid")));
        user.setPhone(req.getParameter("phone"));
        userService.insert(user);
        resp.sendRedirect(req.getContextPath() + "/admin/user/list");
    }

    private void editUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserModel user = userService.findById(id);
        user.setUserName(req.getParameter("userName"));
        user.setFullName(req.getParameter("fullName"));
        user.setEmail(req.getParameter("email"));
        user.setPassWord(req.getParameter("passWord"));
        user.setRoleid(Integer.parseInt(req.getParameter("roleid")));
        user.setPhone(req.getParameter("phone"));
        userService.update(user);
        resp.sendRedirect(req.getContextPath() + "/admin/user/list");
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        userService.delete(id);
        resp.sendRedirect(req.getContextPath() + "/admin/user/list");
    }
}
