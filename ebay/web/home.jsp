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


        <jsp:include page="common/header.jsp"></jsp:include>
        <jsp:include page="list/category-list.jsp"></jsp:include>
        <jsp:include page="list/product-list.jsp"></jsp:include>
        <jsp:include page="common/footer.jsp"></jsp:include>
    </body>
</html>
