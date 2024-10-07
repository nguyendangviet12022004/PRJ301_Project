<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Form</title>
        <link rel="stylesheet" href="../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
    </head>
    <body class="d-flex justify-content-center">

        <form action="product" method="post" class="d-flex flex-column g-2 w-75">
            <input type="text" name="action" value="create" hidden>
            <input type="text" name="id" value="" hidden>
            <div class="form-floating my-1">
                <input type="text" name="name"  required class="form-control" placeholder="">
                <label for="name">Name</label>
            </div>
            <div class="form-floating my-1">
                <input type="number" name="stock"  required class="form-control" placeholder="" min="0" >
                <label for="stock">Stock</label>
            </div>
            <div class="form-floating my-1">
                <input type="number" name="price"  required class="form-control " placeholder=""  min="0">
                <label for="price">Price</label>
            </div>
            <select class="form-control my-1" name="categoryId">
                <c:forEach items="${sessionScope.categories}" var="category">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
            <div class="form-floating my-1">
                <input type="text" name="image"  required class="form-control " placeholder="">
                <label for="image">Image Link</label>
            </div>

            <c:if test ="${requestScope.error != null}">
                <div class="alert alert-danger" role="alert">
                    ${requestScope.error}
                </div>
            </c:if>
            <c:if test ="${requestScope.info != null}">
                <div class="alert alert-success" role="alert">
                    ${requestScope.info}
                </div>
            </c:if>
            <button type="submit" class="btn btn-primary text-uppercase">Submit</button>
        </form>
    </body>
</html>
