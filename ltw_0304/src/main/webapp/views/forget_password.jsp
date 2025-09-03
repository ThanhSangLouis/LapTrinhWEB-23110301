<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quên mật khẩu</title>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; background: #f5f5f5; }
        .form-container {
            width: 400px; margin: 60px auto; background: #fff; padding: 30px;
            border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .form-container h2 { text-align: center; margin-bottom: 20px; }
        .form-container input[type=text],
        .form-container input[type=password],
        .form-container input[type=email] {
            width: 100%; padding: 10px; margin: 8px 0 16px 0;
            border: 1px solid #ccc; border-radius: 4px;
        }
        .form-container button {
            width: 100%; padding: 10px; background: #007bff;
            color: #fff; border: none; border-radius: 4px; font-size: 16px;
        }
        .form-container button:hover { background: #0056b3; }
        .alert { color: red; text-align: center; margin-bottom: 10px; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Quên mật khẩu</h2>
    <form action="forget-password" method="post">
        <label for="email">Email:</label>
        <input type="email"
               id="email"
               name="email"
               placeholder="Nhập email của bạn"
               value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
               required>

        <% if (request.getAttribute("emailValid") != null && (boolean) request.getAttribute("emailValid")) { %>
            <!-- giữ email lại bằng hidden -->
            <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
            <label for="newPassword">Mật khẩu mới:</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới" required>
        <% } %>

        <button type="submit">Xác nhận</button>

        <div class="alert">
            <% if (request.getAttribute("message") != null) { %>
                <%= request.getAttribute("message") %>
            <% } %>
        </div>
    </form>
</div>
</body>
</html>
