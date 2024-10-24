<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

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
                <c:choose>
                    <c:when test="${sessionScope.account == null or sessionScope.account.role == 'USER'}">
                        <c:if test="${product.stock > 0}">
                            <div class="card rounded-1" style="width:275px">
                                <img class="card-img-top d-inline-block" src="${product.image}" alt="product image" width="300px" height="200px" >
                                <div class="card-body d-flex flex-column justify-content-between">
                                    <h5 class="card-title">${product.name}</h5>
                                    <p class="text-center text-primary">Price : ${product.price} $</p>
                                    <c:if test="${sessionScope.account.role eq 'ADMIN'}">
                                        <p class="text-center text-danger">Stock : ${product.stock}</p>
                                    </c:if>
                                </div>
                                <c:choose>
                                    <c:when test="${sessionScope.account.role eq 'ADMIN'}">
                                        <div class="card-footer d-flex justify-content-between">
                                            <a href="/ebay/product?action=delete&id=${product.id}" class="btn btn-danger">Delete</a>
                                            <a href="/ebay/product?action=update&id=${product.id}" class="btn btn-primary">Update</a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="card-footer d-flex justify-content-between">
                                            <a href="/ebay/cart?action=create&id=${product.id}" class="btn btn-primary">Add To Cart</a>
                                            <form action="/ebay/order" method="post">
                                                <input name="id" value="${product.id}" hidden>
                                                <input name="mode" value="buyNow" hidden>
                                                <input name="action" value="create" hidden>
                                                <button type="submit" class="btn btn-primary">Buy Now</button>
                                            </form>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <div class="card rounded-1" style="width:275px">
                    <img class="card-img-top d-inline-block" src="${product.image}" alt="product image" width="300px" height="200px" >
                    <div class="card-body d-flex flex-column justify-content-between">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="text-center text-primary">Price : ${product.price} $</p>
                        <c:if test="${sessionScope.account.role eq 'ADMIN'}">
                            <p class="text-center text-danger">Stock : ${product.stock}</p>
                        </c:if>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.account.role eq 'ADMIN'}">
                            <div class="card-footer d-flex justify-content-between">
                                <a href="/ebay/product?action=delete&id=${product.id}" class="btn btn-danger">Delete</a>
                                <a href="/ebay/product?action=update&id=${product.id}" class="btn btn-primary">Update</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card-footer d-flex justify-content-between">
                                <a href="/ebay/cart?action=create&id=${product.id}" class="btn btn-primary">Add To Cart</a>
                                <form action="/ebay/order" method="post">
                                    <input name="id" value="${product.id}" hidden>
                                    <input name="mode" value="buyNow" hidden>
                                    <input name="action" value="create" hidden>
                                    <button type="submit" class="btn btn-primary">Buy Now</button>
                                </form>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
        </div>
        <c:if test ="${sessionScope.products.isEmpty()}">
            <div class="alert alert-danger" role="alert">No Product</div>
        </c:if>
    </body>
</html>
