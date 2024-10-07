<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <link rel="stylesheet" href="../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
    </head>
    <body>

        <c:if test ="${param.searchKey != null}">
            <div class="alert alert-success" role="alert">Your Search : ${param.searchKey}</div>
        </c:if>

        <c:if test ="${sessionScope.selectedCategory != null}">
            <div class="alert alert-success" role="alert">${sessionScope.selectedCategory.name}</div>
        </c:if>

        <div class="d-flex justify-content-start flex-wrap gap-3 p-3">
            <c:forEach var="product" items="${sessionScope.products}">
                <div class="card rounded-1" style="width:275px">
                    <img class="card-img-top d-inline-block" src="${product.image}" alt="product image" width="300px" height="200px" >
                    <div class="card-body d-flex flex-column justify-content-between">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="text-center text-primary">${product.price} $</p>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.account.role eq 'ADMIN'}">
                            <div class="card-footer d-flex justify-content-between">
                                <a href="product?action=delete&id=${product.id}" class="btn btn-primary">Delete</a>
                                <a href="product?action=update&id=${product.id}" class="btn btn-primary">Update</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card-footer d-flex justify-content-between">
                                <button class="btn btn-primary">Add To Cart</button>
                                <button class="btn btn-primary">Buy Now</button>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </c:forEach>
        </div>
        <c:if test ="${sessionScope.products.isEmpty()}">
            <div class="alert alert-danger" role="alert">No Product</div>
        </c:if>
    </body>
</html>
