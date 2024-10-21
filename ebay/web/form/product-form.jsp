<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>
    <body>
        <div class="">
            <a href="/ebay/home.jsp"><img src="/ebay/assets/image/logo.png"></a>
        </div>


        <form action="product" method="post" class="d-flex flex-column g-2 w-100" enctype="multipart/form-data">
            <input type="text" name="action" value="${param.action}" hidden>
            <input type="text" name="id" value="${requestScope.product.id}" hidden>
            <div class="form-floating my-1">
                <input type="text" name="name"  required class="form-control" placeholder="" value="${requestScope.product.name}">
                <label for="name">Name</label>
            </div>
            <div class="form-floating my-1">
                <input type="number" name="stock"  required class="form-control" placeholder="" min="0" value="${requestScope.product.stock}">
                <label for="stock">Stock</label>
            </div>
            <div class="form-floating my-1">
                <input type="number" name="price"  required class="form-control " placeholder=""  min="0" value="${requestScope.product.price}">
                <label for="price">Price</label>
            </div>
            <select class="form-control my-1" name="categoryId">
                <c:forEach items="${sessionScope.categories}" var="category">
                    <option value="${category.id}" ${requestScope.product.category.id == category.id ? 'selected' : ''}>${category.name}</option>
                </c:forEach>
            </select>
            <!--            <div class="form-floating my-1">
                            <input type="text" name="image"  required class="form-control " placeholder="" value="${requestScope.product.image}">
                            <label for="image">Image Link</label>
                        </div>-->

            <div class="my-1">
                
                <input class="form-control" type="file" name="image"> 
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
            <button type="submit" class="btn btn-primary text-uppercase">${param.action}</button>
        </form>
    </body>
</html>
