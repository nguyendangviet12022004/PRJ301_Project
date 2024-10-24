<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    </head>
    <body>
        <div class="container d-flex flex-nowrap justify-content-between" style="overflow-x:scroll">
            <c:if test="${sessionScope.account != null && sessionScope.account.role eq 'ADMIN'}">
                <a href="category?action=create">
                    <div>
                        <img src="/ebay/assets/image/btn.png" alt="alt" width="150px" height="150px"  class="rounded-circle"/>
                        <p class="text-center">Add</p>
                    </div>
                </a>

            </c:if>

            <a href="product">
                <div>
                    <img src="/ebay/assets/image/AllCategoriesIcon.png" alt="alt" width="150px" height="150px"  class="rounded-circle"/>
                    <p class="text-center">All</p>
                </div>
            </a>
            <c:forEach items="${sessionScope.categories}" var="category">
                <a href="product?selectedCategoryId=${category.id}">
                    <div>
                        <img src="${category.image}" alt="${category.name} image" width="150px" height="150px"  class="rounded-circle"/>
                        <p class="text-center">${category.name}</p>
                        <c:if test="${sessionScope.account != null && sessionScope.account.role eq 'ADMIN'}">
                            <div class="d-flex justify-content-between flex-column align-items-center">
                                <p><a href="/ebay/category?action=delete&id=${category.id}" class="text-danger">Delete</a></p>
                                <p><a href="/ebay/category?action=update&id=${category.id}" class="text-success">Update</a></p>
                            </div>
                        </c:if>
                    </div>
                </a>
            </c:forEach>
        </div>
    </body>
</html>
