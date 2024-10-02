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
                
</body>
</html>
