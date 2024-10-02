<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
    </head>
    <body>       
        
    <c:if test="${sessionScope.categories == null}">
        <c:redirect url="category"></c:redirect>
    </c:if>
    <c:if test="${sessionScope.products == null}">
        <c:redirect url="product"></c:redirect>
    </c:if>
        
    <jsp:include flush="true" page="header.jsp"></jsp:include>
        
    <div class="container d-flex flex-wrap justify-content-between">
        <c:forEach items="${sessionScope.categories}" var="category">
            <a href="product?selectedCategoryId=${category.id}">
                <div>
                    <img src="${category.image}" alt="${category.name} image" width="150px" height="150px"  class="rounded-circle"/>
                    <p class="text-center">${category.name}</p>
                </div>
            </a>
        </c:forEach>
    </div>
                
    <div class="d-flex justify-content-between flex-wrap w-100" style="gap: 50px">
        <c:forEach var="product" items="${sessionScope.products}">
            <div class="card" style="width:300px">
                <img class="card-img-top d-inline-block" src="${product.image}" alt="product image" width="300px" height="200px" >
                <div class="card-body d-flex flex-column justify-content-between">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="text-center text-primary">${product.price} $</p>
                </div>
                
                <div class="card-footer d-flex justify-content-between">
                    <button class="btn btn-primary">Add To Cart</button>
                    <button class="btn btn-primary">Buy Now</button>
                </div>
            </div>
        </c:forEach>
    </div>F


</body>
</html>
