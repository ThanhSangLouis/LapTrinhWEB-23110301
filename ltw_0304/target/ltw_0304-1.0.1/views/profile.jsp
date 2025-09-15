<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/commons/header.jsp" />
<div class="container mt-4">
    <h2>Profile</h2>
    <form method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="fullname" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="fullname" name="fullname" value="${fullname}" required>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${phone}">
        </div>
        <div class="mb-3">
            <label for="images" class="form-label">Profile Image</label>
            <input type="file" class="form-control" id="images" name="images">
            <c:if test="${not empty images}">
                <img src="/${images}" alt="Profile Image" class="img-thumbnail mt-2" style="max-width:150px;">
            </c:if>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
<jsp:include page="/commons/footer.jsp" />
</body>
</html>