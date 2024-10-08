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
        <div class="container d-flex flex-wrap justify-content-between">
            <a href="product">
                <div>
                    <img src="assets/image/AllCategoriesIcon.png" alt="alt" width="150px" height="150px"  class="rounded-circle"/>
                    <p class="text-center">All</p>
                </div>
            </a>
            <c:forEach items="${sessionScope.categories}" var="category">
                <a href="product?selectedCategoryId=${category.id}">
                    <div>
                        <img src="${category.image}" alt="${category.name} image" width="150px" height="150px"  class="rounded-circle"/>
                        <p class="text-center">${category.name}</p>
                    </div>
                </a>
            </c:forEach>
        </div>
    </body>
</html>
